import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/network/network_bloc.dart';
import 'package:order_ui/blocs/network/network_state.dart';
import 'package:order_ui/blocs/order/order_list/order_list_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_event.dart';
import 'package:order_ui/blocs/order/order_list/order_list_state.dart';
import 'package:order_ui/pages/detail_order_page.dart';
import 'package:order_ui/widgets/list_chip.dart';
import 'package:order_ui/widgets/order_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title_app_bar('Order list')),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              bottom: 12.0,
              left: 20.0,
            ),
            child: SizedBox(
              height: 44,
              child: ListChip()
            ),
          ),
        ),
      ),

      body: BlocConsumer<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is NetworkFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No internet connection')),
            );
          } else if (state is NetworkSuccess) {
            context.read<OrderListBloc>().add(OrderListLoadEvent());
          }
        },

        builder: (context, state) {
          if (state is NetworkSuccess) {
            return _buildBody(context);          
          }
          else {
            return const Center(child: Text('No internet connection'));
          }
        }
      ),
      
    );
  }
}

Widget _buildBody(BuildContext context) {
  return BlocBuilder<OrderListBloc, OrderListState>(
    builder: (context, state) {
      debugPrint('Response: ${state.runtimeType}');

      if (state is OrderListLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is OrderListLoadedState) {
        return _buildOrderList(context, state.orders);
      } else if (state is OrderListErrorState) {
        debugPrint('Response: ${state.error}');
        return const Center(child: Text('Failed to load orders'));
      } else {
        return const Center(child: Text('No orders available'));
      }
    },
  );
}

ListView _buildOrderList(BuildContext context, List orders) {
  return ListView.builder(
    itemCount: orders.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () => _navigateToDetailPage(context, orders[index]['id']),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
          child: OrderCard(orderId: orders[index]["id"]),
        ),
      );
    },
  );
}

void _navigateToDetailPage(BuildContext context, int id) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => DetailOrderScreen(orderId: id)),
  );
}
