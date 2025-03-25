import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/home/data/repos/out_of_stock_repo.dart';

import '../../../../all_medicines/data/models/medicine_branch_model.dart';

part 'out_of_stock_state.dart';

class OutOfStockCubit extends Cubit<OutOfStockState> {
  OutOfStockCubit(this.outOfStockRepo) : super(OutOfStockInitial());
  static OutOfStockCubit get(context) => BlocProvider.of(context);
  final OutOfStockRepo outOfStockRepo;

  void getOutOfStock() async {
    emit(OutOfStockLoading());
    final result = await outOfStockRepo.getOutOfStock();
    result.fold(
      (apiErrorModel) => emit(
        OutOfStockFailure(errorModel: apiErrorModel),
      ),
      (ifRight) => emit(
        OutOfStockSuccess(
          medicines: ifRight.data,
        ),
      ),
    );
  }
  //dont forget to add ro getit func.

  //dont forget to add to endpoint.
  //static String getOutOfStock = "api/secure/Product/out-of-stock";
}
