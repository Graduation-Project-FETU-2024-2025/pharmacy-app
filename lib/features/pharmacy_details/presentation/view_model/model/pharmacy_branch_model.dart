import 'working_hours_model.dart';

class PharmacyBranchModel {
  final String id;
  final String pharmacyId;
  final String branchName;
  final String phoneNumber;
  final String image;
  final String status;
  final double lat;
  final double long;
  final List<WorkingHoursModel> workingHours;

  PharmacyBranchModel({
    required this.id,
    required this.pharmacyId,
    required this.branchName,
    required this.phoneNumber,
    required this.image,
    required this.status,
    required this.lat,
    required this.long,
    required this.workingHours,
  });

  factory PharmacyBranchModel.fromJson(Map<String, dynamic> json) {
    return PharmacyBranchModel(
      id: json['id'],
      pharmacyId: json['pharmacyId'],
      branchName: json['branchName'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
      status: json['status'],
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      workingHours: (json['workingHours'] as List)
          .map((item) => WorkingHoursModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pharmacyId': pharmacyId,
      'branchName': branchName,
      'phoneNumber': phoneNumber,
      'image': image,
      'status': status,
      'lat': lat,
      'long': long,
      'workingHours': workingHours.map((item) => item.toJson()).toList(),
    };
  }
}
