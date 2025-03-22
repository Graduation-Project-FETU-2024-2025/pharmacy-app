import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/features/all_branches/data/data/pharmacy_branch_model.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/data/repo/get_one_branch_repo.dart';



part 'get_one_branch_state.dart';

class GetOneBranchCubit extends Cubit<GetOneBranchState> {
  GetOneBranchCubit(this.getOneBranchRepo, this.branchId) : super(GetOneBranchInitial());
  final GetOneBranchRepo getOneBranchRepo;
  final String branchId;

  Future<void> fetchOneBranch() async {
    emit(GetOneBranchLoading());

    try {
      final branch = await getOneBranchRepo.getBranch(branchId);
      emit(GetOneBranchSuccess(branch: branch));
    } catch (e) {
      emit(GetOneBranchFailure(e.toString()));
    }
  }
}
