import 'package:pharmacy_app/features/home/data/models/out_of_stock_model.dart';

class OutOfStockResponseModel {
  final String message;
  final int statusCode;
  final List<OutOfStockModel> data;

  OutOfStockResponseModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory OutOfStockResponseModel.fromJson(Map<String, dynamic> json) {
    return OutOfStockResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
      data: (json['data'] as List<dynamic>)
          .map<OutOfStockModel>((item) => OutOfStockModel.fromJson(item))
          .toList(),
    );
  }
}
