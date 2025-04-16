import 'package:pharmacy_app/features/home/data/models/last_added_model.dart';

class LastAddedResponseModel {
  final String message;
  final int statusCode;
  final List<LastAddedModel> data;

  LastAddedResponseModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory LastAddedResponseModel.fromJson(Map<String, dynamic> json) {
    return LastAddedResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
      data: (json['data'] as List<dynamic>)
          .map<LastAddedModel>((item) => LastAddedModel.fromJson(item))
          .toList(),
    );
  }
}
