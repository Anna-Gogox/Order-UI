import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_bloc.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_event.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_state.dart';

class DetailOrderScreen extends StatefulWidget {
  final int orderId;

  const DetailOrderScreen({super.key, required this.orderId});

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  late final DetailOrderBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = Modular.get<DetailOrderBloc>();
    _bloc.add(DetailOrderRequested(widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: _DetailOrderView(),
    );
  }
}

class _DetailOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Detail"),
      ),
      body: BlocBuilder<DetailOrderBloc, DetailOrderState>(
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
    );
  }
}

Padding _buildOrder(Map order) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order ID: ${order['order']['ID']}", style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Text("User ID: ${order['order']['UserID']}", style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Text("Status Name: ${order['order']['StatusName']}", style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Text("Appointment At: ${order['order']['AppointmentAt']}", style: const TextStyle(fontSize: 16)),
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