class BranchModel {
  final String branchName;
  final String branchLocation;
  final String branchPhone;
  final String deliveryOption;
  final String branchImagePath;

  BranchModel({
    required this.branchName,
    required this.branchLocation,
    required this.branchPhone,
    required this.deliveryOption,
    required this.branchImagePath,
  });

  //create a Branch instance from a JSON map
  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      branchName: json['branchName'] as String,
      branchLocation: json['branchLocation'] as String,
      branchPhone: json['branchPhone'] as String,
      deliveryOption: json['deliveryOption'] as String,
      branchImagePath: json['branchImagePath'] as String,
    );
  }

  //convert a Branch instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'branchName': branchName,
      'branchLocation': branchLocation,
      'branchPhone': branchPhone,
      'deliveryOption': deliveryOption,
      'branchImagePath': branchImagePath,
    };
  }
}
