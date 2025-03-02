import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_icons.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'build_image_option.dart';

class PharmacyEditImg extends StatefulWidget {
  const PharmacyEditImg({super.key, required this.pharmacyImg});
  final String pharmacyImg;

  @override
  State<PharmacyEditImg> createState() => _PharmacyEditImgState();
}

class _PharmacyEditImgState extends State<PharmacyEditImg> {
  File? imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildImageOption(
                  icon: Icons.photo_library,
                  text: "Gallery",
                  onTap: () {
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                BuildImageOption(
                  icon: Icons.camera_alt,
                  text: "Camera",
                  onTap: () {
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 151.w, vertical: 30.h),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
          image: DecorationImage(
            image: imageFile == null
                ? AssetImage(widget.pharmacyImg) as ImageProvider
                : FileImage(imageFile!),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: Alignment(1.w, 1.3.h),
          child: IconButton(
            onPressed: showImagePicker,
            icon: SvgPicture.asset(AppIcons.iconsCamera),
          ),
        ),
      ),
    );
  }
}
