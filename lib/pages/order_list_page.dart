import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/network/network_bloc.dart';
import 'package:order_ui/blocs/network/network_state.dart';
import 'package:order_ui/blocs/order/order_list/order_list_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_event.dart';
import 'package:order_ui/blocs/order/order_list/order_list_state.dart';
import 'package:order_ui/core/theme/app_theme.dart';
import 'package:order_ui/services/order_service.dart';
import 'package:order_ui/widgets/list_chip.dart';
import 'package:order_ui/widgets/order_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    final orderService = Provider.of<OrderService>(context, listen: false);
    final customTheme = context.appTheme;

    return BlocProvider<OrderListBloc>(
      create: (_) => OrderListBloc(orderService),
      child: BlocListener<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is NetworkFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No internet connection')),
            );
          } else if (state is NetworkSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Back online')),
            );
            context.read<OrderListBloc>().add(OrderListFetchEvent());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                AppLocalizations.of(context)!.title_app_bar('Order list'),
                style: customTheme.heading1,
              ),
            ),
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: customTheme.appBarBackground,
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  bottom: 12.0,
                  left: 20.0,
                ),
                child: const SizedBox(height: 44, child: ListChip()),
              ),
            ),
          ),
          body: Container(
            color: customTheme.background,
            child: BlocBuilder<OrderListBloc, OrderListState>(
              builder: (context, orderState) {
                debugPrint('OrderListState: ${orderState.toString()}');
                if (orderState.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (orderState.errorMessage != null) {
                  return Center(child: Text(orderState.errorMessage!));
                } 
                return _buildOrderList(context, orderState.orders, orderState);
              }
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildOrderList(BuildContext context, List orders, OrderListState state) {
  return RefreshIndicator(
    onRefresh: () async {
      context.read<OrderListBloc>().add(OrderListRefreshEvent());
    },
    child: NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
          !state.isLoading &&
          state.hasMore) {
            context.read<OrderListBloc>().add(OrderListLoadMoreEvent());
          }
          return false;
      },
      child: ListView.builder(
        itemCount: state.orders.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < state.orders.length) {
            return OrderCard(order: orders[index]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
  );
}
