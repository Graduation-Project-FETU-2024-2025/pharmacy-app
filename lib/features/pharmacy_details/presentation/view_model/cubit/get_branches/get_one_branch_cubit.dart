import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/get_one_branch_repo.dart';
import '../../model/pharmacy_branch_model.dart';

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
