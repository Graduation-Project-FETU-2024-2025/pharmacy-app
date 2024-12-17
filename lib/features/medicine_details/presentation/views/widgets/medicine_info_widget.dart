import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class MedicineInfoWidget extends StatelessWidget {
  const MedicineInfoWidget({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.black.withOpacity(0.4),
              ),
        ),
        SizedBox(height: 8),
        Text(
          info,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
