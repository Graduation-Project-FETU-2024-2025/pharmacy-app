import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';

import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class DeliveryStatusField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? status;

  const DeliveryStatusField(
      {super.key, required this.controller, this.onChanged, this.status});

  @override
  State<DeliveryStatusField> createState() => _DeliveryStatusFieldState();
}

class _DeliveryStatusFieldState extends State<DeliveryStatusField> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    final List<String> branchStatuses = [
      S.of(context).delivery,
      S.of(context).noDelivery,
      S.of(context).close
    ];
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        CustomEditTextFormField(
          controller: widget.controller,
          hintTxt: S.of(context).branchStatus,
          initialVal: widget.status,
        ),
        Positioned(
          right: 15.h,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
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
