import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_model.dart';
import 'package:pharmacy_app/features/home/data/repos/out_of_stock_repo.dart';

part 'out_of_stock_state.dart';

class OutOfStockCubit extends Cubit<OutOfStockState> {
  OutOfStockCubit(this.outOfStockRepo) : super(OutOfStockInitial());
  static OutOfStockCubit get(context) => BlocProvider.of(context);
  final OutOfStockRepo outOfStockRepo;

  void getOutOfStock() async {
    if (isClosed) return;
    emit(OutOfStockLoading());
    final result = await outOfStockRepo.getOutOfStock();
    if (isClosed) return;
    result.fold(
      (apiErrorModel) {
        if (!isClosed) {
          emit(OutOfStockFailure(errorModel: apiErrorModel));
        }
      },
      (outOfStockResponseModel) {
        if (!isClosed) {
          emit(OutOfStockSuccess(medicines: outOfStockResponseModel.data));
        }
      },
    );
  }
}
