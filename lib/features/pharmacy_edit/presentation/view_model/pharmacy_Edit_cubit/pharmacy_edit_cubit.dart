import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'pharmacy_edit_state.dart';

class PharmacyEditCubit extends Cubit<PharmacyEditState> {
  PharmacyEditCubit() : super(PharmacyEditInitial());
  static PharmacyEditCubit get(context) => BlocProvider.of<PharmacyEditCubit>(context);

  final TextEditingController pharmacyNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController manNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mileageController = TextEditingController();
  final TextEditingController lowestPriceController = TextEditingController();
  final TextEditingController workHourController = TextEditingController();
  final TextEditingController branchStatusController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  Future<void> close() {
    pharmacyNameController.dispose();
    branchNameController.dispose();
    descController.dispose();
    manNameController.dispose();
    phoneController.dispose();
    mileageController.dispose();
    lowestPriceController.dispose();
    workHourController.dispose();
    branchStatusController.dispose();
    return super.close();
  }
}
