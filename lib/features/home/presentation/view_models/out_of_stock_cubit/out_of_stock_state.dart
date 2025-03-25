part of 'out_of_stock_cubit.dart';

@immutable
sealed class OutOfStockState {}

final class OutOfStockInitial extends OutOfStockState {}

final class OutOfStockLoading extends OutOfStockState {}

final class OutOfStockSuccess extends OutOfStockState {
  final List<MedicineBranchModel> medicines;
  OutOfStockSuccess({required this.medicines});
}

final class OutOfStockFailure extends OutOfStockState {
  final ApiErrorModel errorModel;
  OutOfStockFailure({required this.errorModel});
}
