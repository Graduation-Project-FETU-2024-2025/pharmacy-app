import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/filter_list_view.dart';

import '../../../../../core/utils/app_colors.dart';

class FilterDialog extends StatefulWidget {
  final int? selectedIndex;
  final Function(int) onSelect;

  const FilterDialog(
      {super.key, required this.selectedIndex, required this.onSelect});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? 0;
  }

  void updateSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onSelect(index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: AppColors.white,
      child: SizedBox(
        height: 240.h,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
            child: Column(
              children: [
                FilterListView(
                  selectedIndex: selectedIndex,
                  onSelect: updateSelection,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
