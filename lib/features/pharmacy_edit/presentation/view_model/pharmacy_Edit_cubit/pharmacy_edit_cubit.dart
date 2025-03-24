import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'pharmacy_edit_state.dart';

class PharmacyEditCubit extends Cubit<PharmacyEditState> {
  PharmacyEditCubit() : super(PharmacyEditInitial());
  static PharmacyEditCubit get(context) => BlocProvider.of<PharmacyEditCubit>(context);

  final TextEditingController pharmacyNameController = TextEditingController();
  final TextEditingController arBranchNameController = TextEditingController();
  final TextEditingController enBranchNameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController pricePerKilo= TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController deliveryRange = TextEditingController();
  final TextEditingController lowestPriceController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  final TextEditingController branchStatusController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  Future<void> close() {
    pharmacyNameController.dispose();
    arBranchNameController.dispose();
    enBranchNameController.dispose();
    descController.dispose();
    pricePerKilo.dispose();
    phoneController.dispose();
    deliveryRange.dispose();
    lowestPriceController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    branchStatusController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    return super.close();
  }
}
