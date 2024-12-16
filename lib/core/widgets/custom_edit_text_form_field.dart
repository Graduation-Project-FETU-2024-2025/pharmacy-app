import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';

class CustomEditTextFormField extends StatelessWidget {
  const CustomEditTextFormField({super.key, required this.controller, required this.hintTxt, this.initialVal, this.maxLines} );
  final TextEditingController controller;
  final String? initialVal;
  final String hintTxt;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.primaryColor),
      controller: controller,
      initialValue: initialVal,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal:17 ,vertical: 5),
        hintText: hintTxt,
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.black.withOpacity(0.3)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.3)),
        ),
      ),

    );
  }
}