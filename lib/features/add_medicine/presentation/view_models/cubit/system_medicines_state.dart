part of 'system_medicines_cubit.dart';

@immutable
sealed class SystemMedicinesState {}

final class SystemMedicinesInitial extends SystemMedicinesState {}

final class SystemMedicinesLoading extends SystemMedicinesState {}

final class SystemMedicinesSuccess extends SystemMedicinesState {
  final List<SystemMedicineModel> systemMedicines;
  SystemMedicinesSuccess({required this.systemMedicines});
}

final class SystemMedicinesFailure extends SystemMedicinesState {
  final String errorMessage;
  SystemMedicinesFailure({required this.errorMessage});
}
