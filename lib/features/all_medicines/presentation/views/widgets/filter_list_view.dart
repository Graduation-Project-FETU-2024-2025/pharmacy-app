import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/filter_item.dart';

import '../../../../../generated/l10n.dart';

class FilterListView extends StatelessWidget {
  final int? selectedIndex;
  final Function(int) onSelect;

  const FilterListView(
      {super.key, required this.selectedIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    List<String> filterListLabel = [
      S.of(context).allMedicines,
      S.of(context).almostRunOut,
      S.of(context).lastAdded,
    ];

    return ListView.builder(
      itemCount: filterListLabel.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onSelect(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: FilterItem(
              label: filterListLabel[index],
              isSelected: selectedIndex == index,
            ),
          ),
        );
      },
    );
  }
}
