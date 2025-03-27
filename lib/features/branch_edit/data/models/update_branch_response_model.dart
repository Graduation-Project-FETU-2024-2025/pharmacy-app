import 'update_branch_model.dart';

class UpdateBranchResponseModel {
  final String message;
  final int statusCode;
  final UpdateBranchModel? data;

  UpdateBranchResponseModel({
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory UpdateBranchResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateBranchResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'] != null ? UpdateBranchModel.fromJson(json['data']) : null,
    );
  }
}