import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:order_ui/gen/assets.gen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final won = NumberFormat.currency(locale: 'ko_KR', symbol: '₩');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('#123456'),
                SizedBox(width: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('Lable'),
                ),
                SizedBox(width: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('Completed'),
                ),
              ],
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SvgPicture.asset(
                Assets.icons.creditCard,
                height: 15,
                width: 15,
              ),
              title: Text(won.format(4300), style: TextStyle(fontSize: 14)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Date Order'), Text('30/12/2024, 12:00 p.m')],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Vehicle'), Text('1 ton truck')],
                ),
              ],
            ),

            Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    Assets.icons.departureIcon,
                    height: 15,
                    width: 15,
                  ),
                  title: Text(
                    'Road A, Street B, Province C, City D',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    Assets.icons.point,
                    height: 15,
                    width: 15,
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                  ),
                  title: Text(
                    'Road A, Street B, Province C, City D',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
