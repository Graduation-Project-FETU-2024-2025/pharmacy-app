import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/add_branch/data/models/add_branch_model_response.dart';
import '../../../../../core/database/cache/secure_storage.dart';
import '../../../../all_branches/data/models/working_hours_model.dart';
import '../../../data/models/add_branch_model.dart';
import '../../../data/repo/add_branch_repo.dart';
part 'pharmacy_edit_state.dart';

class PharmacyEditCubit extends Cubit<PharmacyEditState> {
  PharmacyEditCubit(this.branchRepository) : super(PharmacyEditInitial());
  static PharmacyEditCubit get(context) => BlocProvider.of<PharmacyEditCubit>(context);

  final TextEditingController pharmacyNameController = TextEditingController();
  final TextEditingController arBranchNameController = TextEditingController();
  final TextEditingController enBranchNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pricePerKilo= TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController deliveryRange = TextEditingController();
  final TextEditingController lowestPriceController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController branchStatusController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



final AddBranchRepo branchRepository;

  Future<void> addBranch() async {
  final List<WorkingHours> workingHoursList = [
    WorkingHours(
      start: startTimeController.text,
      end: endTimeController.text,
    ),
  ];
    final pharmacyId =await SecureStorage.instance.getData(key: "id");
    emit(AddBranchLoading());
    final branch = AddBranchModel(
      pharmacyId: pharmacyId!, 
      arBranchName: arBranchNameController.text,
      enBranchName: enBranchNameController.text,
      deliveryRange: int.tryParse(deliveryRange.text) ?? 0,
      pricePerKilo: int.tryParse(pricePerKilo.text) ?? 0,
      minDeliveryPrice: int.tryParse(lowestPriceController.text) ?? 0,
      status: branchStatusController.text,
      image: "https://images.wuzzuf-data.net/files/company_logo/eltarshouby-pharmacy-Egypt-31230-1519210111-og.jpg", // imageFile?.path ?? '',
      phoneNumber: phoneController.text,
      lat: double.tryParse(latitudeController.text) ?? 0.0,
      long: double.tryParse(longitudeController.text) ?? 0.0,
      address: addressController.text,
      workingHours: workingHoursList, 
    );
    final result = await branchRepository.addBranch(branch);
    result.fold(
      (apiErrorModel) => emit(AddBranchFailure(apiErrorModel)),
      (branch) => emit(AddBranchSuccess(branch)),
    );
  }


  File? imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        emit(BranchImagePicked(imageFile!));
      } 
    } catch (e) {
      emit(AddBranchFailure(ApiErrorHandler.handleError(e)));
    }
  }



  @override
  Future<void> close() {
    pharmacyNameController.dispose();
    arBranchNameController.dispose();
    enBranchNameController.dispose();
    addressController.dispose();
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
