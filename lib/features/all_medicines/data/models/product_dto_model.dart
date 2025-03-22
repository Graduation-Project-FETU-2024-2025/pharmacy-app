class ProductDtoModel {
  final String code;
  final String arName;
  final String enName;
  final String image;
  final String type;
  final String activePrincipal;
  final String companyName;

  ProductDtoModel({
    required this.code,
    required this.arName,
    required this.enName,
    required this.image,
    required this.type,
    required this.activePrincipal,
    required this.companyName,
  });

  factory ProductDtoModel.fromJson(Map<String, dynamic> json) {
    return ProductDtoModel(
      code: json['code'],
      arName: json['aR_Name'],
      enName: json['eN_Name'],
      image: json['image'],
      type: json['type'],
      activePrincipal: json['active_principal'],
      companyName: json['company_Name'],
    );
  }
}
