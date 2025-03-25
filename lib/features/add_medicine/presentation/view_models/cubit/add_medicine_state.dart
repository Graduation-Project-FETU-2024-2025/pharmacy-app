part of 'add_medicine_cubit.dart';

@immutable
sealed class AddMedicineState {}

final class AddMedicineInitial extends AddMedicineState {}

final class AddMedicineLoading extends AddMedicineState {}

final class AddMedicineSuccess extends AddMedicineState {}

final class AddMedicineFailure extends AddMedicineState {
  final ApiErrorModel apiErrorModel;

  AddMedicineFailure({required this.apiErrorModel});
}
