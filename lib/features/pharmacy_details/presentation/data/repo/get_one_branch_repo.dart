
import '../../view_model/model/pharmacy_branch_model.dart';

abstract class GetOneBranchRepo {
  Future<PharmacyBranchModel> getBranch(String branchId);
}
