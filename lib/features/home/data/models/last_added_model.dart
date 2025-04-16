import 'package:pharmacy_app/features/all_medicines/data/models/product_dto_model.dart';

class LastAddedModel {
  final String branchId;
  final String branchName;
  final String name;
  final String systemProductCode;
  final int stock;
  final num price;
  final bool visibility;
  final ProductDtoModel productsDTO;

  LastAddedModel({
    required this.branchId,
    required this.branchName,
    required this.name,
    required this.systemProductCode,
    required this.stock,
    required this.price,
    required this.visibility,
    required this.productsDTO,
  });

  factory LastAddedModel.fromJson(Map<String, dynamic> json) {
    return LastAddedModel(
      branchId: json['branchId'],
      branchName: json['branchName'],
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
