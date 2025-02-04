import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/filter_item.dart';

class FilterBranchesList extends StatelessWidget {
  final int? selectedIndex;
  final Function(int) onSelect;

  const FilterBranchesList(
      {super.key, required this.selectedIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onSelect(index + 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: FilterItem(
              label: 'Elstad Branch',
              isSelected: selectedIndex == index + 100,
            ),
          ),
        );
      },
    );
  }
}
