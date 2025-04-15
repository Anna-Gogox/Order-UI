import 'package:flutter/material.dart';
import 'package:order_ui/features/order/presentation/widgets/list_chip.dart';
import 'package:order_ui/features/order/presentation/widgets/order_card.dart';

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
        title: const Text('Order list'),
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

      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: OrderCard(
                ),
              );
            },
          ),
      ),
    );
  }
}
