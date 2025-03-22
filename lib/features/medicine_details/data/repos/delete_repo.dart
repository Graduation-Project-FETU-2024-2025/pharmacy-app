import 'package:dartz/dartz.dart';

abstract class DeleteRepo {
  Future<Either<String, String>> deleteMedicine(
      {required String branchId, required String id});
}
