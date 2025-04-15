import 'package:flutter/material.dart';

class ListChip extends StatefulWidget {
  const ListChip({super.key});

  @override
  State<ListChip> createState() => _ListChipState();
}

class _ListChipState extends State<ListChip> {
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Searching',
    'Active',
    'Completed',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ChoiceChip(
            label: Text(
              categories[index],
              style: TextStyle(
                color:
                    isSelected
                        ? Theme.of(context).colorScheme.onSecondary
                        : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            selected: isSelected,
            selectedColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
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
            },
          ),
        );
      },
    );
  }
}