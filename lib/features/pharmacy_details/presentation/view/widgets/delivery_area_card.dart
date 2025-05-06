import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'delivery_card_detail.dart';

class DeliveryAreaCard extends StatelessWidget {
  const DeliveryAreaCard(
      {super.key,
      required this.phoneNum,
      required this.pricePerKilo,
      required this.deliveryRange});
  final String phoneNum;
  final double pricePerKilo;
  final int deliveryRange;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.white
          : AppColors.white.withOpacity(0.15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: EdgeInsets.all(18),
          child: DeliveryCardDetail(
              phoneNum: phoneNum,
              pricePerKilo: pricePerKilo,
              deliveryRange: deliveryRange)),
    );
  }
}
