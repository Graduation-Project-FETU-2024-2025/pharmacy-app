import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/delete_repo.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit(this.deleteRepo) : super(DeleteInitial());
  final DeleteRepo deleteRepo;
  static DeleteCubit get(context) => BlocProvider.of(context);

  void deleteMedicine({required String branchId, required String id}) async {
    emit(DeleteLoading());
    final result = await deleteRepo.deleteMedicine(branchId: branchId, id: id);
    result.fold((apiErrorModel) {
      emit(DeleteFailure(apiErrorModel: apiErrorModel));
    }, (successMessage) {
      emit(DeleteSuccess(successMessage: successMessage));
    });
  }
}
