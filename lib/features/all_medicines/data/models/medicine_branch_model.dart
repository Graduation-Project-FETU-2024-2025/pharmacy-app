import 'package:pharmacy_app/features/all_medicines/data/models/product_dto_model.dart';

class MedicineBranchModel {
  final String branchId;
  final String name;
  final String systemProductCode;
  final int stock;
  final num price;
  final bool visibility;
  final ProductDtoModel productsDTO;

  MedicineBranchModel({
    required this.branchId,
    required this.name,
    required this.systemProductCode,
    required this.stock,
    required this.price,
    required this.visibility,
    required this.productsDTO,
  });

  factory MedicineBranchModel.fromJson(Map<String, dynamic> json) {
    return MedicineBranchModel(
      branchId: json['branchId'],
      name: json['name'],
      systemProductCode: json['systemProductCode'],
      stock: json['stock'],
      price: json['price'],
      visibility: json['visibility'],
      productsDTO:
          ProductDtoModel.fromJson(json['productDTO'] as Map<String, dynamic>),
    );
  }
}
