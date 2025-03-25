part of 'get_medicine_cubit.dart';

@immutable
sealed class GetMedicineState {}

final class GetMedicineInitial extends GetMedicineState {}

final class GetMedicineLoading extends GetMedicineState {}

final class GetMedicineFailure extends GetMedicineState {
  final ApiErrorModel apiErrorModel;

  GetMedicineFailure({required this.apiErrorModel});
}

final class GetMedicineSuccess extends GetMedicineState {
  final MedicineBranchModel medicineBranchModel;

  GetMedicineSuccess({required this.medicineBranchModel});
}
