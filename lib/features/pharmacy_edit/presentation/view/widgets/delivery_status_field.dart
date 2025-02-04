import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';

import '../../../../../core/widgets/custom_edit_text_form_field.dart';

class DeliveryStatusField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const DeliveryStatusField({super.key, required this.controller, this.onChanged});

  @override
  State<DeliveryStatusField> createState() => _DeliveryStatusFieldState();
}

class _DeliveryStatusFieldState extends State<DeliveryStatusField> {
  String? selectedStatus;
  final List<String> branchStatuses = ["Delivery", "No Delivery", "Close"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        CustomEditTextFormField(
          controller: widget.controller,
          hintTxt: "Branch Status",
        ),
        Positioned(
          right: 15.h,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor:Colors.white,
              borderRadius: BorderRadius.circular(20),
              icon: SvgPicture.asset(AppIcons.arrowDown),
              onChanged: (String? newValue) {
                setState(() {
                  selectedStatus = newValue;
                  widget.controller.text = newValue ?? "";
                  if (widget.onChanged != null) {
                    widget.onChanged!(newValue!);
                  }
                });
              },
              items: branchStatuses.map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: SizedBox(
                    width: 132.w,
                    child: Text(status, textAlign: TextAlign.start),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
