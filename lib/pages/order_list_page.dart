import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/internet_bloc/internet_bloc.dart';
import 'package:order_ui/blocs/internet_bloc/internet_state.dart';
import 'package:order_ui/pages/detail_order_page.dart';
import 'package:order_ui/services/order_service.dart';
import 'package:order_ui/widgets/list_chip.dart';
import 'package:order_ui/widgets/order_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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

      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No internet connection')),
            );
          } else if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Internet connected!')),
            );
          }
        },
        builder: (context, state) {
          if (state is InternetLostState) {
            return const Center(child: Text('No internet connection'));
          } else if (state is InternetGainedState) {
            return const Center(child: Text('Internet connected!'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      
    );
  }
}

FutureBuilder<Response> _buildBody(BuildContext context) {
  return FutureBuilder<Response>(
    future: Provider.of<OrderService>(context).getOrders({}),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (snapshot.hasData) {
        final List orders = json.decode(snapshot.data!.bodyString);
        return _buildOrderList(context, orders);
      } else {
        return const Center(child: Text('No data available'));
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
