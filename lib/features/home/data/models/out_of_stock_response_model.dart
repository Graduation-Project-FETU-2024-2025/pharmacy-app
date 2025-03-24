import '../../../all_medicines/data/models/medicine_branch_model.dart';

class OutOfStockResponseModel {
  final String message;
  final int statusCode;
  final List<MedicineBranchModel> data;

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
          .map<MedicineBranchModel>(
              (item) => MedicineBranchModel.fromJson(item))
          .toList(),
    );
  }
}
