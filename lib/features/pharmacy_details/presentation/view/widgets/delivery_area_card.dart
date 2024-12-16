import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'delivery_card_detail.dart';

class DeliveryAreaCard extends StatelessWidget {
  const DeliveryAreaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: DeliveryCardDetail()
      ),
    );
  }
}