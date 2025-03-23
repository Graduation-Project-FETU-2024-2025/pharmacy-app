import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'delivery_card_detail.dart';

class DeliveryAreaCard extends StatelessWidget {
  const DeliveryAreaCard({super.key, required this.phoneNum, required this.pricePerKilo, required this.deliveryRange});
  final String phoneNum;
  final double pricePerKilo;
  final int deliveryRange;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: DeliveryCardDetail( phoneNum :phoneNum ,pricePerKilo: pricePerKilo ,deliveryRange: deliveryRange)
      ),
    );
  }
}