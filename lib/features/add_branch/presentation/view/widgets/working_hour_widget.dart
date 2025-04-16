import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';

class WorkingHourWidget extends StatefulWidget {
  const WorkingHourWidget({
    super.key,
    this.start,
    this.end,
  });
  final String? start;
  final String? end;

  @override
  State<WorkingHourWidget> createState() => _WorkingHourWidgetState();
}

class _WorkingHourWidgetState extends State<WorkingHourWidget> {
  @override
  Widget build(BuildContext context) {
    getTimeFromUser({required bool isStartTime}) async {
      TimeOfDay? pickedDate = await showTimePicker(
        context: context,
        initialTime: isStartTime
            ? TimeOfDay.fromDateTime(DateTime.now())
            : TimeOfDay.fromDateTime(
                DateTime.now().add(const Duration(minutes: 15))),
      );

      String formattedTime = pickedDate!.format(context);
      if (isStartTime) {
        setState(() {
          PharmacyEditCubit.get(context).startTimeController.text =
              formattedTime;
        });
      } else if (!isStartTime) {
        setState(() => PharmacyEditCubit.get(context).endTimeController.text =
            formattedTime);
      } else {
        log('something error');
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).startTime,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Gap(18.h),
                    CustomEditTextFormField(
                      controller:
                          PharmacyEditCubit.get(context).startTimeController,
                      hintTxt: widget.start ?? "00:00",
                      initialVal: widget.start,
                      keyboardType: TextInputType.number,
                      suffixIcon: IconButton(
                          onPressed: () => getTimeFromUser(isStartTime: true),
                          icon: SvgPicture.asset(AppIcons.iconTime)),
                          readOnly: true,
                    ),
                  ],
                ),
              ),
              Gap(19.h),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).endTime,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Gap(18.h),
                    CustomEditTextFormField(
                      controller:
                          PharmacyEditCubit.get(context).endTimeController,
                      hintTxt: widget.end ?? "00:00",
                      initialVal: widget.end,
                      keyboardType: TextInputType.number,
                      suffixIcon: IconButton(
                          onPressed: () => getTimeFromUser(isStartTime: false),
                          icon: SvgPicture.asset(AppIcons.iconTime)),
                          readOnly: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
