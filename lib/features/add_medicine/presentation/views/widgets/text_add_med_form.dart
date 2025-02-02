import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';

class TextAddMedForm extends StatelessWidget {
  const TextAddMedForm(
      {super.key,
      required this.label,
      required this.readOnly,
      this.controller,
      required this.hintText});
  final String label;
  final bool readOnly;
  final TextEditingController? controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: readOnly ? Color(0xffD9D9D9) : Colors.transparent,
            borderRadius: readOnly
                ? BorderRadius.circular(10.r)
                : BorderRadius.circular(20.r),
          ),
          child: TextFormField(
            onTapOutside: (v) {
              FocusScope.of(context).unfocus();
            },
            controller: controller,
            readOnly: readOnly,
            cursorHeight: 25.h,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: hintText,
              hintStyle: readOnly
                  ? Theme.of(context).textTheme.labelMedium
                  : Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.black.withOpacity(0.3),
                      ),
              fillColor: readOnly ? Color(0xffD9D9D9) : Colors.transparent,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: readOnly
                    ? BorderRadius.circular(10.r)
                    : BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  width: 1,
                  color: readOnly
                      ? Colors.transparent
                      : AppColors.black.withOpacity(0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: readOnly
                    ? BorderRadius.circular(10.r)
                    : BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  width: 1,
                  color: readOnly ? Colors.transparent : AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
