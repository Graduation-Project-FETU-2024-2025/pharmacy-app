import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../generated/l10n.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffE5E5E5),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              cursorHeight: 25,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: S.of(context).searchHint,
                hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color(0xffBDBDBD),
                    ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                filled: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    AppIcons.iconsSearch,
                    colorFilter: ColorFilter.mode(
                      Color(0xffBDBDBD),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  S.of(context).searchButtonTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
