// import '../../../all_branches/data/models/working_hours_model.dart';

// class UpdateBranchResponseModel {
//   final String id;
//   final String pharmacyId;
//   final String arBranchName;
//   final String enBranchName;
//   final int deliveryRange;
//   final int pricePerKilo;
//   final int minDeliveryPrice;
//   final String status;
//   final String image;
//   final String phoneNumber;
//   final double lat;
//   final double long;
//   final String? address;
//   final List<WorkingHours> workingHours;

//   UpdateBranchResponseModel({
//     required this.id,
//     required this.pharmacyId,
//     required this.arBranchName,
//     required this.enBranchName,
//     required this.deliveryRange,
//     required this.pricePerKilo,
//     required this.minDeliveryPrice,
//     required this.status,
//     required this.image,
//     required this.phoneNumber,
//     required this.lat,
//     required this.long,
//     required this.workingHours,
//     this.address,
//   });

//   factory UpdateBranchResponseModel.fromJson(Map<String, dynamic> json) {
//     return UpdateBranchResponseModel(
//       id: json['id'],
//       pharmacyId: json['pharmacyId'],
//       arBranchName: json['aR_BranchName'],
//       enBranchName: json['eN_BranchName'],
//       deliveryRange: json['deliveryRange'],
//       pricePerKilo: json['pricePerKilo'],
//       minDeliveryPrice: json['minDeliveryPrice'],
//       status: json['status'],
//       image: json['image'],
//       phoneNumber: json['phoneNumber'],
//       lat: json['lat'].toDouble(),
//       long: json['long'].toDouble(),
//       address: json['address'],
//       workingHours: (json['workingHours'] as List)
//           .map((e) => WorkingHours.fromJson(e))
//           .toList(),
//     );
//   }
// }