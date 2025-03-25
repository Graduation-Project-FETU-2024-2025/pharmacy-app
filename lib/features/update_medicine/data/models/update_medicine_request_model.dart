class UpdateMedicineRequestModel {
  final String branchId;
  final String systemProductCode;
  final int stock;
  final num price;
  final bool visibility;

  UpdateMedicineRequestModel({
    required this.branchId,
    required this.systemProductCode,
    required this.stock,
    required this.price,
    required this.visibility,
  });

  Map<String, dynamic> toJson() => {
        'branchId': branchId,
        'systemProductCode': systemProductCode,
        'stock': stock,
        'price': price,
        'visibility': visibility,
      };
}
