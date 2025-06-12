import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/blocs/network/network_bloc.dart';
import 'package:order_ui/blocs/network/network_state.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_bloc.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_event.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_state.dart';

class DetailOrderScreen extends StatelessWidget {
  final int orderId;

  const DetailOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Detail"),
      ),
      body: BlocListener<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is NetworkSuccess) {
            final orderId = this.orderId;
            BlocProvider.of<DetailOrderBloc>(context)
                .add(DetailOrderRequested(orderId));
          }
        },
        child: BlocBuilder<DetailOrderBloc, DetailOrderState>(
          builder: (context, snapshot) {
            if (snapshot is DetailOrderLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot is DetailOrderErrorState) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot is DetailOrderLoadedState) {
              return _buildOrder(snapshot.order);
            } else {
              return const Center(child: Text(''));
            }
          },
        ),
      ),
    );
  }
}

Padding _buildOrder(Map order) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order ID: ${order['id']}", style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Text("Title: ${order['title']}", style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Text("Body: ${order['body']}", style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Modular.to.pushNamed('/user/me/1');
          },
          child: const Text("Action Button"),
        ),
      ],
    ),
  );
}