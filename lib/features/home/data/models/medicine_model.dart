class MedicineModel {
  final int id;
  final String medicineName;
  final String img;
  final String form;
  final int quantity;
  final String company;
  final String description;
  final double price;
  final double dosage;
  final String dosageForm;
  final String activeSubstance;

  MedicineModel({
    required this.id,
    required this.medicineName,
    required this.img,
    required this.form,
    required this.quantity,
    required this.company,
    required this.description,
    required this.price,
    required this.dosage,
    required this.dosageForm,
    required this.activeSubstance,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        id: json['id'] as int,
        medicineName: json['medicineName'] as String,
        img: json['img'] as String,
        form: json['form'] as String,
        quantity: json['quantity'] as int,
        company: json['company'] as String,
        description: json['description'] as String,
        price: json['price'] as double,
        dosage: json['dosage'] as double,
        dosageForm: json['dosageForm'] as String,
        activeSubstance: json['activeSubstance'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicineName': medicineName,
        'img': img,
        'form': form,
        'quantity': quantity,
        'company': company,
        'description': description,
        'price': price,
        'dosage': dosage,
        'dosageForm': dosageForm,
        'activeSubstance': activeSubstance,
      };
}
