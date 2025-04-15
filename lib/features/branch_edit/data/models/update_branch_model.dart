import 'package:image_picker/image_picker.dart';
import '../../../all_branches/data/models/working_hours_model.dart';

class UpdateBranchModel {
  final String pharmacyId;
  final String arBranchName;
  final String enBranchName;
  final int deliveryRange;
  final double pricePerKilo;
  final double minDeliveryPrice;
  final String status;
  final XFile? image;
  final String phoneNumber;
  final double lat;
  final double long;
  final String? enAddress;
  final String? arAddress;
  final List<WorkingHours> workingHours;

  UpdateBranchModel({
    required this.pharmacyId,
    required this.arBranchName,
    required this.enBranchName,
    required this.deliveryRange,
    required this.pricePerKilo,
    required this.minDeliveryPrice,
    required this.status,
    required this.image,
    required this.arAddress,
    required this.enAddress,
    required this.phoneNumber,
    required this.lat,
    required this.long,
    required this.workingHours,
  });

  // factory UpdateBranchModel.fromJson(Map<String, dynamic> json) {
  //   return UpdateBranchModel(
  //     pharmacyId: json["pharmacyId"] ?? "",
  //     arBranchName: json["aR_BranchName"] ?? "",
  //     enBranchName: json["eN_BranchName"] ?? "",
  //     deliveryRange: json["deliveryRange"] ?? 0,
  //     pricePerKilo: json["pricePerKilo"] ?? 0,
  //     minDeliveryPrice: json["minDeliveryPrice"] ?? 0,
  //     status: json["status"] ?? "",
  //     image: json["image"] ?? "",
  //     arAddress: json["AR_Address"] ?? "",
  //     enAddress: json["EN_Address"] ?? "",
  //     phoneNumber: json["phoneNumber"] ?? "",
  //     lat: (json["lat"] ?? 0).toDouble(),
  //     long: (json["long"] ?? 0).toDouble(),
  //     workingHours: (json['workingHours'] as List)
  //         .map((e) => WorkingHours.fromJson(e))
  //         .toList(),
  //   );
  // }


  Map<String, dynamic> toJson() {
    return {
      'PharmacyId': pharmacyId,
      'aR_BranchName': arBranchName,
      'eN_BranchName': enBranchName,
      'DeliveryRange': deliveryRange,
      'PricePerKilo': pricePerKilo,
      'MinDeliveryPrice': minDeliveryPrice,
      'Status': status,
      'PhoneNumber': phoneNumber,
      'Lat': lat,
      'Long': long,
      'EN_Address': enAddress,
      'AR_Address': arAddress,
      'WorkingHours':workingHours.map((e) => e.toJson(),).toList(),
    };
  }

}