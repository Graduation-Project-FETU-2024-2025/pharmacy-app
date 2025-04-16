import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/branch_edit/data/repo/edit_branch_repo.dart';
import '../../../../../core/database/cache/secure_storage.dart';
import '../../../../all_branches/data/models/working_hours_model.dart';
import '../../../../branch_edit/data/models/update_branch_model.dart';
import '../../../data/models/add_branch_model.dart';
import '../../../data/repo/add_branch_repo.dart';
part 'pharmacy_edit_state.dart';

class PharmacyEditCubit extends Cubit<PharmacyEditState> {
  PharmacyEditCubit(this.addBranchRepo, this.editBranchRepo)
      : super(PharmacyEditInitial());
  static PharmacyEditCubit get(context) =>
      BlocProvider.of<PharmacyEditCubit>(context);

  final TextEditingController pharmacyNameController = TextEditingController();
  final TextEditingController arBranchNameController = TextEditingController();
  final TextEditingController enBranchNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController enAddressController = TextEditingController();
  final TextEditingController arAddressController = TextEditingController();
  final TextEditingController pricePerKilo = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController deliveryRange = TextEditingController();
  final TextEditingController lowestPriceController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController branchStatusController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? imageFile;
  final AddBranchRepo addBranchRepo;
  final EditBranchRepo editBranchRepo;

  Future<void> addBranch() async {
    final List<WorkingHours> workingHoursList = [
      WorkingHours(
        start: startTimeController.text,
        end: endTimeController.text,
      ),
    ];
    final pharmacyId = await SecureStorage.instance.getData(key: "id");
    emit(AddBranchLoading());
    final branch = AddBranchModel(
      pharmacyId: pharmacyId??"fc01d1d3-8e55-46f5-928e-a63a840ee90f",
      arBranchName: arBranchNameController.text,
      enBranchName: enBranchNameController.text,
      deliveryRange: int.tryParse(deliveryRange.text)!,
      pricePerKilo: int.tryParse(pricePerKilo.text)!,
      minDeliveryPrice: int.tryParse(lowestPriceController.text)!,
      status: branchStatusController.text,
      image: imageFile,
      phoneNumber: phoneController.text,
      lat: double.tryParse(latitudeController.text)!,
      long: double.tryParse(longitudeController.text)!,
      enAddress: enAddressController.text,
      arAddress: arAddressController.text,
      workingHours: workingHoursList,
    );
    final result = await addBranchRepo.addBranch(branch);
    result.fold(
      (apiErrorModel) => emit(AddBranchFailure(apiErrorModel)),
      (_) => emit(AddBranchSuccess()),
    );
  }

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = pickedFile;
        emit(BranchImagePicked(imageFile!));
      }
    } catch (e) {
      emit(AddBranchFailure(ApiErrorHandler.handleError(e)));
    }
  }

  Future<void> updateBranch(String branchId) async {
    final pharmacyId = await SecureStorage.instance.getData(key: "id");
    final branch = UpdateBranchModel(
      pharmacyId: pharmacyId??"fc01d1d3-8e55-46f5-928e-a63a840ee90f",
      arBranchName: arBranchNameController.text,
      enBranchName: enBranchNameController.text,
      deliveryRange: int.tryParse(deliveryRange.text)!,
      pricePerKilo: double.tryParse(pricePerKilo.text)!,
      minDeliveryPrice: double.tryParse(lowestPriceController.text)!,
      status: branchStatusController.text,
      image: imageFile,
      phoneNumber: phoneController.text,
      lat: double.tryParse(latitudeController.text)!,
      long: double.tryParse(longitudeController.text)!,
      enAddress: enAddressController.text,
      arAddress: arAddressController.text,
      workingHours: [
        WorkingHours(
          start: startTimeController.text,
          end: endTimeController.text,
        )
      ],
    );

    emit(UpdateBranchLoading());
    final result = await editBranchRepo.updateBranch(branch, branchId);
    result.fold(
      (apiErrorModel) =>
          emit(UpdateBranchFailure(apiErrorModel: apiErrorModel)),
      (_) => emit(UpdateBranchSuccess()),
    );
  }

  @override
  Future<void> close() {
    pharmacyNameController.dispose();
    arBranchNameController.dispose();
    enBranchNameController.dispose();
    branchNameController.dispose();
    enAddressController.dispose();
    arAddressController.dispose();
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
