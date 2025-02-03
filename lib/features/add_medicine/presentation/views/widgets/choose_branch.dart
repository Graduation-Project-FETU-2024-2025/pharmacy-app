import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';

class ChooseBranch extends StatefulWidget {
  const ChooseBranch({
    super.key,
  });

  @override
  State<ChooseBranch> createState() => _ChooseBranchState();
}

class _ChooseBranchState extends State<ChooseBranch> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).branch,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.black.withOpacity(0.3),
            ),
          ),
          child: DropdownButton<String>(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            underline: SizedBox(),
            menuMaxHeight: 100,
            borderRadius: BorderRadius.circular(20),
            value: selectedValue,
            isExpanded: true,
            dropdownColor: AppColors.white,
            hint: Text(
              S.of(context).selectBranch,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.black.withOpacity(0.3),
                  ),
            ),
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(child: Text('elstad'), value: 'elstad'),
              DropdownMenuItem<String>(child: Text('saeed'), value: 'saeed'),
              DropdownMenuItem<String>(
                  child: Text('elmahatta'), value: 'elmahatta'),
            ],
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
