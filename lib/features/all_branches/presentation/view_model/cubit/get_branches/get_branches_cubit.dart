import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_state.dart';

import '../../../../data/repo/get_branches_repo.dart';

class GetBranchesCubit extends Cubit<GetBranchesState> {
  GetBranchesCubit(this.getBranchesRepo) : super(GetBranchesInitial());
  final GetBranchesRepo getBranchesRepo;

  Future<void> fetchBranches() async {
    if (isClosed) return;
    emit(GetBranchesLoading());
    final result = await getBranchesRepo.getAllBranches();
    if (isClosed) return;
    result.fold(
      (apiErrorModel) {
        if (!isClosed) {
          emit(GetBranchesFailure(apiErrorModel: apiErrorModel));
        }
      },
      (branches) {
        if (!isClosed) {
          emit(GetBranchesSuccess(branches: branches));
        }
      },
    );
  }
}
