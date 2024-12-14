import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import '../../../../../core/utils/app_colors.dart';


class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading : false,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: MediaQuery.of(context).size.height*0.4,
      backgroundColor: Colors.white,
      elevation: 0.0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppImages.imgMap,
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Container(
            width: 85.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      
    );
  }
}



