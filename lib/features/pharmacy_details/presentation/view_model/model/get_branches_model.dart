// import 'pharmacy_branch_model.dart';

// class GetBranchesModel {
//   final String message;
//   final int statusCode;
//   final List<PharmacyBranchModel> data;

//   GetBranchesModel({
//     required this.message,
//     required this.statusCode,
//     required this.data,
//   });

//   factory GetBranchesModel.fromJson(Map<String, dynamic> json) {
//     return GetBranchesModel(
//       message: json['message'],
//       statusCode: json['statusCode'],
//       data: (json['data'] as List)
//           .map((item) => PharmacyBranchModel.fromJson(item))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'statusCode': statusCode,
//       'data': data.map((item) => item.toJson()).toList(),
//     };
//   }
// }