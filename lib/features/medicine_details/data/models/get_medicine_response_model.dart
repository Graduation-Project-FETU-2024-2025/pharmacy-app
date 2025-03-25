import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';

class GetMedicineResponseModel {
  String? message;
  int? statusCode;
  MedicineBranchModel? data;

  GetMedicineResponseModel({this.message, this.statusCode, this.data});

  GetMedicineResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null
        ? new MedicineBranchModel.fromJson(json['data'])
        : null;
  }
}
