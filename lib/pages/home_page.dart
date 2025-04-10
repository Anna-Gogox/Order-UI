import 'package:flutter/material.dart';
import 'package:order_ui/gen/colors.gen.dart';
import 'package:order_ui/widgets/order_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.neutral2,
      appBar: AppBar(
        title: const Text('Order list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(label: Text('Category')),
                  );
                },
              ),
            ),
        
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  // return Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5.0),
                  //     color: Colors.blue,
                  //   ),
                  //   margin: EdgeInsets.all(8.0),
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Text('hello'),
                  // );
                  return OrderCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
