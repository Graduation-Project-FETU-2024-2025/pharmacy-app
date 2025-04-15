import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/branch_edit/data/repo/edit_branch_repo.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/api_error_handler.dart';
import '../../../../core/database/api/api_error_model.dart';
import '../../../../core/functions/upload_image_to_api.dart';
import '../models/update_branch_model.dart';

class EditBranchRepoImpl implements EditBranchRepo {
  final ApiConsumer apiConsumer;

  EditBranchRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, bool>> updateBranch(UpdateBranchModel branch, String branchId) async {
    try {
      log(branch.toString());
      
      final Map<String, dynamic> formData = branch.toJson();
      // formData['Image'] = await uploadImageToAPI(branch.image!);
      if (branch.image != null) {
            final imageFile = await uploadImageToAPI(branch.image!);
            formData['Image'] = imageFile;
          }
      await apiConsumer.put(
      '${EndPoints.getBranches}/$branchId', 
        data: formData,
        isFormData: true
      );
      // return Right(UpdateBranchResponseModel.fromJson(response.data));
    return Right(true);
    } catch (error) {
      return Left(ApiErrorHandler.handleError(error));
    }
  }
}