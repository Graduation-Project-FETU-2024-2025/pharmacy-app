
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_state.dart';
import '../../../../data/repo/get_branches_repo.dart';


class GetBranchesCubit extends Cubit<GetBranchesState> {
  GetBranchesCubit(this.getBranchesRepo) : super(GetBranchesInitial());
  final GetBranchesRepo getBranchesRepo;

  Future<void> fetchBranches() async {
    emit(GetBranchesLoading());
    final result = await getBranchesRepo.getAllBranches();
    result.fold(
      (message) => GetBranchesFailure(message),
      (branches) => emit(
        GetBranchesSuccess(branches: branches),
      ),
    );
  }
}
