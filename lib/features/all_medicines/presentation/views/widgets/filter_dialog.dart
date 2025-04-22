import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/view_models/cubit/get_branch_products_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/filter_list_view.dart';

import '../../../../../core/utils/app_colors.dart';

class FilterDialog extends StatefulWidget {
  final int? selectedIndex;
  final Function(int) onSelect;
  final String branchId;
  final GetBranchProductsCubit getBranchCubit;

  const FilterDialog(
      {super.key,
      required this.selectedIndex,
      required this.onSelect,
      required this.branchId,
      required this.getBranchCubit});

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
    if (index == 0) {
      widget.getBranchCubit
          .getBranchProducts(branchId: widget.getBranchCubit.currentBranchId!);
    }
    if (index == 1) {
      widget.getBranchCubit.fetechOutOfStock(branchId: widget.branchId);
    }
    if (index == 2) {
      widget.getBranchCubit.fetechLastAdded(branchId: widget.branchId);
    }
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
