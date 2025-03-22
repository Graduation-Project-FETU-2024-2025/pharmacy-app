class DeleteResponseModel {
  final String message;
  final int statusCode;

  DeleteResponseModel({
    required this.message,
    required this.statusCode,
  });

  factory DeleteResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
