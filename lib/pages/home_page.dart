import 'package:flutter/material.dart';
import 'package:order_ui/widgets/order_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: AppBar(
        title: const Text('Order list'),
        scrolledUnderElevation: 0,
        elevation: 0, // optional, but makes it totally flat
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44), // adjust height as needed
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Chip(
                      label: Text(
                        'Category',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.transparent, width: 0),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return OrderCard();
          },
        ),

        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       return OrderCard();
        //     },
        //   ),
        // ),
      ),
    );
  }
}
