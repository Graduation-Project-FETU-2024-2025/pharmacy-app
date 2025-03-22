import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';

class GetBranchProductsModel {
  final String message;
  final int statusCode;
  final List<MedicineBranchModel> data;

  GetBranchProductsModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory GetBranchProductsModel.fromJson(Map<String, dynamic> json) {
    return GetBranchProductsModel(
      message: json['message'],
      statusCode: json['statusCode'],
      data: (json['data'] as List<dynamic>)
          .map<MedicineBranchModel>(
              (item) => MedicineBranchModel.fromJson(item))
          .toList(),
    );
  }
}
