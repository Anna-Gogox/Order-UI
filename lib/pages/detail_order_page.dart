import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:order_ui/services/order_service.dart';
import 'package:provider/provider.dart';

class DetailOrderScreen extends StatelessWidget {
  final int orderId;

  const DetailOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Detail")),
      body: FutureBuilder<Response>(
        future: Provider.of<OrderService>(context).getOrderById(orderId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final Map order = json.decode(snapshot.data!.bodyString);
            return _buildOrder(order);
          } else {
            return const Center(child: Text('No data found'));
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
        Text("Order ID: ${order['id']}", style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Text("Title: ${order['title']}", style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Text("Body: ${order['body']}", style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}