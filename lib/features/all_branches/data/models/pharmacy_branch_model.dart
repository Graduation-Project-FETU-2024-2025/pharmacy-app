import 'working_hours_model.dart';

class PharmacyBranchModel {
  final String id;
  final String pharmacyId;
  final String address;
  final String? aRAddress;
  final String? eNAddress;
  final String branchName;
  final String aRBranchName;
  final String eNBranchName;
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
    required this.aRAddress,
    required this.eNAddress,
    required this.branchName,
    required this.aRBranchName,
    required this.eNBranchName,
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
      address: json['address'].toString(),
      aRAddress: json['aR_Address'].toString(),
      eNAddress: json['eN_Address'].toString(),
      branchName: json['branchName'].toString(),
      aRBranchName: json['aR_BranchName'],
      eNBranchName: json['eN_BranchName'],
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
      'aR_Address': aRAddress,
      'eN_Address': eNAddress,
      'branchName': branchName,
      'aR_BranchName': aRBranchName,
      'eN_BranchName': eNBranchName,
      'phoneNumber': phoneNumber,
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
