import 'working_hours_model.dart';

class PharmacyBranchModel {
  final String id;
  final String pharmacyId;
  final String address;
  final String branchName;
  final String phoneNumber;
  final String image;
  final String status;
  final int deliveryRange;
  final double pricePerKilo;
  final double minDeliveryPrice;
  final double lat;
  final double long;
  final List<WorkingHours> workingHours;

  PharmacyBranchModel({
    required this.id,
    required this.pharmacyId,
    required this.address,
    required this.branchName,
    required this.phoneNumber,
    required this.image,
    required this.status,
    required this.deliveryRange,
    required this.pricePerKilo,
    required this.minDeliveryPrice,
    required this.lat,
    required this.long,
    required this.workingHours,
  });

  factory PharmacyBranchModel.fromJson(Map<String, dynamic> json) {
    return PharmacyBranchModel(
      id: json['id'],
      pharmacyId: json['pharmacyId'],
      address: json['address'] ?? "",
      branchName: json['branchName'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
      status: json['status'],
      deliveryRange: json['deliveryRange'],
      pricePerKilo: (json['pricePerKilo'] as num).toDouble(),
      minDeliveryPrice: (json['minDeliveryPrice'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      workingHours: (json['workingHours'] as List)
          .map((e) => WorkingHours.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pharmacyId': pharmacyId,
      'address': address,
      'branchName': branchName,
      'phoneNumber': phoneNumber,
      'image': image,
      'status': status,
      'deliveryRange': deliveryRange,
      'pricePerKilo': pricePerKilo,
      'minDeliveryPrice': minDeliveryPrice,
      'lat': lat,
      'long': long,
      'workingHours': workingHours.map((e) => e.toJson()).toList(),
    };
  }
}
