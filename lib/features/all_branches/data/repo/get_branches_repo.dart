import '../data/pharmacy_branch_model.dart';

abstract class GetBranchesRepo {
  Future<List<PharmacyBranchModel>> getAllBranches();
}
