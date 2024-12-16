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
}
