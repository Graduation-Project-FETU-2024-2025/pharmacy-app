import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.label,
    required this.isSelected,
  });
  final String label;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
        ),
        Spacer(),
        Container(
          width: 16,
          height: 16,
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: isSelected
                  ? BorderSide(color: AppColors.primaryColor)
                  : BorderSide(
                      color: AppColors.black.withOpacity(0.3),
                    ),
            ),
            color: isSelected ? AppColors.primaryColor : AppColors.white,
          ),
          child: isSelected
              ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: AppColors.white,
                    ),
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
