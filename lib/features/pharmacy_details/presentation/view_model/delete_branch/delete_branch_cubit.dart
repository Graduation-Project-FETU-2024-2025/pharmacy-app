import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/pharmacy_details/data/repo/delete_branch_repo.dart';
part 'delete_branch_state.dart';

class DeleteBranchCubit extends Cubit<DeleteBranchState> {
  DeleteBranchCubit(this.deleteRepo) : super(DeleteBranchInitial());

  final DeleteBranchRepo deleteRepo;

  Future<void> deleteBranch(String branchId) async {
    emit(DeleteBranchLoading());
    final result = await deleteRepo.deleteBranch(branchId);
    result.fold(
      (apiErrorModel) =>
          emit(DeleteBranchFailure(apiErrorModel: apiErrorModel)),
      (_) => emit(DeleteBranchSuccess()),
    );
  }
}
