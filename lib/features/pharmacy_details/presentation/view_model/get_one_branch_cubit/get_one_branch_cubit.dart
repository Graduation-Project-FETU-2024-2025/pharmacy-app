
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/pharmacy_details/data/repo/get_one_branch_repo.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view_model/get_one_branch_cubit/get_one_branch_state.dart';





class GetOneBranchCubit extends Cubit<GetOneBranchState> {
  GetOneBranchCubit(this.getOneBranchRepo, this.branchId) : super(GetOneBranchInitial());
  final GetOneBranchRepo getOneBranchRepo;
  final String branchId;

  Future<void> fetchOneBranch() async {
    emit(GetOneBranchLoading());
    final result = await getOneBranchRepo.getBranch(branchId);
    result.fold(
      (apiErrorModel) => emit(GetOneBranchFailure(apiErrorModel:apiErrorModel)),
      (branch) => emit(GetOneBranchSuccess(branch: branch)),
    );
  }
}
