import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_event.dart';
import 'package:order_ui/core/theme/app_theme.dart';

class ListChip extends StatefulWidget {
  const ListChip({super.key});

  @override
  State<ListChip> createState() => _ListChipState();
}

class _ListChipState extends State<ListChip> {
  int selectedIndex = 0;
  final List<String> filters = [
    'All',
    'Searching',
    'Active',
    'Completed',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    final customTheme = context.appTheme;
    
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filters.length,
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ChoiceChip(
            label: Text(
              filters[index],
              style: TextStyle(
                color: customTheme.pallete.neutral1,
              ),
            ),
            selected: isSelected,
            selectedColor: customTheme.pallete.secondary,
            backgroundColor: customTheme.pallete.neutral4,
            elevation: 0,
            pressElevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: Colors.transparent, width: 0),
            ),
            showCheckmark: false,
            onSelected: (_) {
              setState(() {
                selectedIndex = index;
              });
              final filter = filters[index].toLowerCase();
              context.read<OrderListBloc>().add(
                    OrderListFetchEvent(
                      filter: filter,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}