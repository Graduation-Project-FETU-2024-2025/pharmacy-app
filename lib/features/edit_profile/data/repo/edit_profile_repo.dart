import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';

abstract class EditProfileRepo {
  Future<Either<ApiErrorModel, String>> editProfile({XFile? image,required String name});
}
