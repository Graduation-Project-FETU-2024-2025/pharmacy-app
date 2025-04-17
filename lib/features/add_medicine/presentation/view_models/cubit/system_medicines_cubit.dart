import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/system_medicine_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/get_system_medicines_repo.dart';

part 'system_medicines_state.dart';

class SystemMedicinesCubit extends Cubit<SystemMedicinesState> {
  SystemMedicinesCubit(this.getSystemMedicinesRepo)
      : super(SystemMedicinesInitial());
  static SystemMedicinesCubit get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final GetSystemMedicinesRepo getSystemMedicinesRepo;

  void getSystemMedicines() async {
    emit(SystemMedicinesLoading());
    final result = await getSystemMedicinesRepo.getSystemMedicines();
    result.fold(
      (apiErrorModel) => emit(
        SystemMedicinesFailure(apiErrorModel: apiErrorModel),
      ),
      (right) => emit(
        SystemMedicinesSuccess(systemMedicines: right.data),
      ),
    );
  }

  void searchSystemMedicines() async {
    emit(SystemMedicinesLoading());
    final result = await getSystemMedicinesRepo.searchInSystemMedicines(
      query: searchController.text,
    );
    result.fold(
      (apiErrorModel) => emit(
        SystemMedicinesFailure(apiErrorModel: apiErrorModel),
      ),
      (right) => emit(
        SystemMedicinesSuccess(systemMedicines: right.data),
      ),
    );
  }
}
