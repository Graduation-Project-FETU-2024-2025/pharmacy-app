import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import '../helpers/extentions.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.controller,
    // this.validator,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isValid = false;

  String? validator({required String value, required String hintText}) {
    if (hintText.toLowerCase().contains('email')) {
      if (!value.isValidEmail) {
        return 'Please enter a valid email address';
      }
    } else if (hintText.toLowerCase().contains('password')) {
      if (!value.isValidPassword) {
        return 'Password must be at least 8 characters long and include letters and numbers';
      }
    } else if (hintText.toLowerCase().contains('name')) {
      if (!value.isValidName) {
        return 'Please enter a valid name';
      }
    } else if (hintText.toLowerCase().contains('phone')) {
      if (!value.isValidPhone) {
        return 'Please enter a valid phone number';
      }
    } else {
      return 'Invalid value';
    }

    return null;
  }

  void updateValidationStatus(String value) {
    setState(() {
      isValid = validator(value: value, hintText: widget.hintText!) == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: updateValidationStatus,
      validator: (val) {
        return validator(value: val!, hintText: widget.hintText!);
      },
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
            fontSize: 18,
          ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 4.0,
            top: 4,
            start: 4,
          ),
          child: widget.prefixIcon,
        ),
        suffixIcon: isValid
            ? widget.suffixIcon ?? Image.asset(AppImages.imgCheckmark)
            : null,
      ),
    );
  }
}


// Example
// CustomTextFormField(
//                 controller: controller, 
//                 hintText: 'Enter Email', 
//                 prefixIcon: Icons.email,
//                 keyboardType: TextInputType.emailAddress,
//                 ),