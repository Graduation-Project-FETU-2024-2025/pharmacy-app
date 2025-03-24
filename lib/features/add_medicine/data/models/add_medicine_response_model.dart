class AddMedicineResponseModel {
  final String message;
  final int statusCode;

  AddMedicineResponseModel({
    required this.message,
    required this.statusCode,
  });

  factory AddMedicineResponseModel.fromJson(Map<String, dynamic> json) {
    return AddMedicineResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
