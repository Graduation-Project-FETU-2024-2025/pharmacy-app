

import 'package:image_picker/image_picker.dart';
import 'package:pharmacy_app/features/all_branches/data/models/working_hours_model.dart';

class AddBranchModel {
  final String pharmacyId;
  final String arBranchName;
  final String enBranchName;
  final int deliveryRange;
  final int pricePerKilo;
  final int minDeliveryPrice;
  final String status;
  final XFile? image;
  final String phoneNumber;
  final double lat;
  final double long;
  final String? enAddress;
  final String? arAddress;
  final List<WorkingHours> workingHours;

  AddBranchModel({
    required this.pharmacyId,
    required this.arBranchName,
    required this.enBranchName,
    required this.deliveryRange,
    required this.pricePerKilo,
    required this.minDeliveryPrice,
    required this.status,
    required this.image,
    required this.phoneNumber,
    required this.lat,
    required this.long,
    required this.workingHours,
    this.arAddress,
    this.enAddress,
  });

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