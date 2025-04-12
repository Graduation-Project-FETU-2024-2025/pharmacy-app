import '../../../all_branches/data/models/working_hours_model.dart';

class UpdateBranchModel {
  final String pharmacyId;
  final String arBranchName;
  final String enBranchName;
  final int deliveryRange;
  final int pricePerKilo;
  final int minDeliveryPrice;
  final String status;
  final String image;
  final String arAddress;
  final String enAddress;
  final String phoneNumber;
  final double lat;
  final double long;
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

  factory UpdateBranchModel.fromJson(Map<String, dynamic> json) {
    return UpdateBranchModel(
      pharmacyId: json["pharmacyId"] ?? "",
      arBranchName: json["aR_BranchName"] ?? "",
      enBranchName: json["eN_BranchName"] ?? "",
      deliveryRange: json["deliveryRange"] ?? 0,
      pricePerKilo: json["pricePerKilo"] ?? 0,
      minDeliveryPrice: json["minDeliveryPrice"] ?? 0,
      status: json["status"] ?? "",
      image: json["image"] ?? "",
      arAddress: json["AR_Address"] ?? "",
      enAddress: json["EN_Address"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      lat: (json["lat"] ?? 0).toDouble(),
      long: (json["long"] ?? 0).toDouble(),
      workingHours: (json['workingHours'] as List)
          .map((e) => WorkingHours.fromJson(e))
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'PharmacyId': pharmacyId,
      'aR_BranchName': arBranchName,
      'eN_BranchName': enBranchName,
      'deliveryRange': deliveryRange,
      'pricePerKilo': pricePerKilo,
      'minDeliveryPrice': minDeliveryPrice,
      'status': status,
      'image': image,
      'AR_Address': arAddress,
      'EN_Address': enAddress,
      'phoneNumber': phoneNumber,
      'lat': lat,
      'long': long,
      'workingHours': workingHours.map((e) => e.toJson()).toList(),
    };
  }

}