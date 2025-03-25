import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_response_model.dart';

abstract class OutOfStockRepo {
  Future<Either<String, OutOfStockResponseModel>> getOutOfStock();
}
