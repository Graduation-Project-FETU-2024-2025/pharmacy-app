import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/core/functions/upload_image_to_api.dart';
import 'package:pharmacy_app/features/add_branch/data/models/add_branch_model_response.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../models/add_branch_model.dart';
import 'add_branch_repo.dart';

class AddBranchRepoImpl implements AddBranchRepo {
  final ApiConsumer apiConsumer;

  AddBranchRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, AddBranchModelResponse>> addBranch(
      AddBranchModel branch) async {
    try {
      final Map<String, dynamic> formData = branch.toJson();
      formData['Image'] = await uploadImageToAPI(branch.image!);

      await apiConsumer.post(EndPoints.getBranches,
          data: formData, isFormData: true);
     
      // final branchModel =
      //     AddBranchModelResponse.fromJson(response.data['data']);
      return Right(AddBranchModelResponse(id: '5', pharmacyId: 'pharmacyId', arBranchName: 'arBranchName', enBranchName: 'enBranchName', deliveryRange: 5, pricePerKilo: 5, minDeliveryPrice: 5, status: 'status', image: 'image', phoneNumber: 'phoneNumber', lat: 5, long: 5, workingHours: []));
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
