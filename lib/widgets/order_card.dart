import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:order_ui/gen/assets.gen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IdAndStatus(id: '#123456'),
            SizedBox(height: 16.0,),
            AmountTotal(number: 4300),
            SizedBox(height: 16.0,),
            DetailDateAndVehicle(dateOrder: '30/12/2024, 12:00 p.m', vehicle: '1 ton truck'),
            SizedBox(height: 16.0,),
            Address(appointmentPoint: 'Road A, Street B, Province C, City D', destinationPoint: 'Road A, Street B, Province C, City D'),
            SizedBox(height: 16.0,),
            ButtonInOrderItem(textButton: 'Tip driver', status: 'Completed',)
          ],
        ),
      ),
    );
  }
}

class StatusLabel extends StatelessWidget {
  const StatusLabel({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({super.key, required this.iconAsset, this.color, required this.text});
  
  final String iconAsset;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: SvgPicture.asset(
            iconAsset,
            height: 18,
            width: 18,
            colorFilter:
              color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(child: Text(text, style: TextStyle(fontSize: 14))),
      ],
    );
  }
}

class IdAndStatus extends StatelessWidget {
  const IdAndStatus({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(id), SizedBox(width: 8.0), StatusLabel(status: 'Label',)],
    );
  }
}

class AmountTotal extends StatelessWidget {
  const AmountTotal({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    final won = NumberFormat.currency(locale: 'ko_KR', symbol: '₩');
    return IconWithText(iconAsset: Assets.icons.creditCard, color: Theme.of(context).colorScheme.secondaryFixedDim, text: won.format(number));
  }
}

class DetailDateAndVehicle extends StatelessWidget {
  const DetailDateAndVehicle({super.key, required this.dateOrder, required this.vehicle});

  final String dateOrder;
  final String vehicle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date Order', style: TextStyle(color: Theme.of(context).colorScheme.secondaryFixedDim)),
            Text(dateOrder),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vehicle', style: TextStyle(color: Theme.of(context).colorScheme.secondaryFixedDim)),
            Text(vehicle),
          ],
        ),
      ],
    );
  }
}

class Address extends StatelessWidget {
  const Address({super.key, required this.appointmentPoint, required this.destinationPoint});

  final String appointmentPoint;
  final String destinationPoint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconWithText(
          iconAsset: Assets.icons.departureIcon,
          text: appointmentPoint,
        ),
        RotateIcon90Degree(icon: Assets.icons.minus),
        IconWithText(
          iconAsset: Assets.icons.point,
          color: Colors.pink,
          text: destinationPoint,
        ),
      ],
    );
  }
}

class RotateIcon90Degree extends StatelessWidget {
  const RotateIcon90Degree({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 18,
          child: Transform.rotate(
            angle: 3.14 / 2,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondaryFixedDim, BlendMode.srcIn),
              height: 18,
              width: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class DesignButton extends StatelessWidget {
  const DesignButton({super.key, required this.textButton, this.status});

  final String textButton;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor:
              status == 'Completed'
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.primary,
          side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.0),
          elevation: 0,
        ),
        child: Text(
          textButton,
          style: TextStyle(
            color:
                status == 'Completed'
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class ButtonInOrderItem extends StatelessWidget {
  const ButtonInOrderItem({super.key, required this.textButton, this.status});

  final String textButton;
  final String? status;

  @override
  Widget build(BuildContext context) {
    if (status == 'Completed') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: DesignButton(textButton: 'Reorder',),),
          SizedBox(width: 16.0,),
          Expanded(child: DesignButton(textButton: 'Receipt', status: status,)),
        ],
      );
    }
    else {
      return DesignButton(textButton: 'Reorder',);
    }
  }
}