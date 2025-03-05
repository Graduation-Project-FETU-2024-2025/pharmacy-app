import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_branches_state.dart';

class GetBranchesCubit extends Cubit<GetBranchesState> {
  GetBranchesCubit() : super(GetBranchesInitial());
}
