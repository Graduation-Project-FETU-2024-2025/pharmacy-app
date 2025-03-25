class UpdateMedicineResponseModel {
  final String message;
  final int statusCode;

  UpdateMedicineResponseModel({
    required this.message,
    required this.statusCode,
  });

  factory UpdateMedicineResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateMedicineResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
