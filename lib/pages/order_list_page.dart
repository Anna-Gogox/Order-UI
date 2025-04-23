import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/network/network_bloc.dart';
import 'package:order_ui/blocs/network/network_state.dart';
import 'package:order_ui/blocs/order/order_list/order_list_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_event.dart';
import 'package:order_ui/blocs/order/order_list/order_list_state.dart';
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
        builder: (context, networkState) {
          return BlocBuilder<OrderListBloc, OrderListState>(
            builder: (context, orderState) {
              if (orderState is OrderListLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (orderState is OrderListLoadedState) {
                return _buildOrderList(context, orderState.orders);
              } else if (orderState is OrderListErrorState) {
                return Center(child: Text(orderState.error));
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          );
        },
      ),
      
    );
  }
}

ListView _buildOrderList(BuildContext context, List orders) {
  return ListView.builder(
    itemCount: orders.length,
    itemBuilder: (context, index) {
      return OrderCard(orderId: orders[index]["id"]);
    },
  );
}
