import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/get_medicine_repo.dart';

part 'get_medicine_state.dart';

class GetMedicineCubit extends Cubit<GetMedicineState> {
  GetMedicineCubit(this.getMedicineRepo) : super(GetMedicineInitial());
  final GetMedicineRepo getMedicineRepo;
  static GetMedicineCubit get(context) => BlocProvider.of(context);

  void getMedicine({required String branchId, required String id}) async {
    final result = await getMedicineRepo.getMedicineDetails(
      branchId: branchId,
      id: id,
    );
    result.fold(
      (apiErrorModel) => emit(
        GetMedicineFailure(apiErrorModel: apiErrorModel),
      ),
      (ifRight) => emit(
        GetMedicineSuccess(medicineBranchModel: ifRight.data!),
      ),
    );
  }
}
