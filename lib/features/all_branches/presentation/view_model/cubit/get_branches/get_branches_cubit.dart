import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/features/all_branches/data/data/pharmacy_branch_model.dart';
import '../../../../data/repo/get_branches_repo.dart';
part 'get_branches_state.dart';

class GetBranchesCubit extends Cubit<GetBranchesState> {
  GetBranchesCubit(this.getBranchesRepo) : super(GetBranchesInitial());
  final GetBranchesRepo getBranchesRepo;

  Future<void> fetchBranches() async {
    emit(GetBranchesInitial());

    try {
      final branches = await getBranchesRepo.getAllBranches();
      emit(GetBranchesSuccess(branches: branches));
    } catch (e) {
      emit(GetBranchesFailure(e.toString()));
    }
  }
}
