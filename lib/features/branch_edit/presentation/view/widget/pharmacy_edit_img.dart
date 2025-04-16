import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import '../../../../../core/utils/app_icons.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_branch/presentation/view/widgets/build_image_option.dart';

class PharmacyEditImg extends StatefulWidget {
  const PharmacyEditImg({super.key, this.pharmacyImg});
  final String? pharmacyImg;

  @override
  State<PharmacyEditImg> createState() => _PharmacyEditImgState();
}

class _PharmacyEditImgState extends State<PharmacyEditImg> {
  void showImagePicker(BuildContext context) {
    final branchCubit = context.read<PharmacyEditCubit>();

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => BlocProvider.value(
        value: branchCubit,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildImageOption(
                    icon: Icons.photo_library,
                    text: S.of(context).gallery,
                    onTap: () {
                      branchCubit.pickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  BuildImageOption(
                    icon: Icons.camera_alt,
                    text: S.of(context).camera,
                    onTap: () {
                      branchCubit.pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyEditCubit, PharmacyEditState>(
      builder: (context, state) {
        XFile? imageFile = context.read<PharmacyEditCubit>().imageFile;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 151.w, vertical: 30.h),
          child: Container(
            height: 90.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              image: DecorationImage(
                image: imageFile != null
                    ? FileImage(File(imageFile.path))
                    : widget.pharmacyImg != null
                        ? NetworkImage(widget.pharmacyImg!) as ImageProvider
                        : AssetImage(AppImages.pharmacyDetailImg)
                            as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () => showImagePicker(context),
                icon: SvgPicture.asset(AppIcons.iconsCamera),
              ),
            ),
          ),
        );
      },
    );
  }
}
