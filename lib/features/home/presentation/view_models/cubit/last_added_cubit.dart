import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/home/data/models/last_added_model.dart';
import 'package:pharmacy_app/features/home/data/repos/last_added_repo.dart';

part 'last_added_state.dart';

class LastAddedCubit extends Cubit<LastAddedState> {
  LastAddedCubit(this.lastAddedRepo) : super(LastAddedInitial());
  static LastAddedCubit get(context) => BlocProvider.of(context);
  final LastAddedRepo lastAddedRepo;

  Future<void> getLastAdded() async {
    if (isClosed) return;
    emit(LastAddedLoading());
    final resukt = await lastAddedRepo.getLastAddedMedicines();
    if (isClosed) return;
    resukt.fold(
      (apiErrorModel) {
        if (!isClosed) {
          emit(LastAddedFailure(errorModel: apiErrorModel));
        }
      },
      (lastAddedResponseModel) {
        if (!isClosed) {
          emit(LastAddedSuccess(medicines: lastAddedResponseModel.data));
        }
      },
    );
  }
}
