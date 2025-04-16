import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';

import '../../../data/repos/get_branch_products_repo.dart';

part 'get_branch_products_state.dart';

class GetBranchProductsCubit extends Cubit<GetBranchProductsState> {
  GetBranchProductsCubit(this.getBranchProductsRepo)
      : super(GetBranchProductsInitial());
  static GetBranchProductsCubit get(context) => BlocProvider.of(context);
  final GetBranchProductsRepo getBranchProductsRepo;
  final TextEditingController searchController = TextEditingController();
  String? currentBranchId;

  void getBranchProducts({required String branchId}) async {
    {
      currentBranchId = branchId;
      emit(GetBranchProductsLoading());
      final result = await getBranchProductsRepo.getBranchProducts(
        branchId: branchId,
      );
      result.fold(
        (apiErrorModel) => emit(
          GetBranchProductsFailure(apiErrorModel: apiErrorModel),
        ),
        (right) => emit(
          GetBranchProductsSuccess(
            medicines: right.data,
          ),
        ),
      );
    }
  }

  void searchInBranchProducts() async {
    emit(GetBranchProductsLoading());
    final result = await getBranchProductsRepo.searchInBranchProducts(
      branchId: currentBranchId!,
      query: searchController.text,
    );
    result.fold(
      (apiErrorModel) => emit(
        GetBranchProductsFailure(apiErrorModel: apiErrorModel),
      ),
      (right) => emit(
        SearchBranchProductsSuccess(
          medicines: right.data,
        ),
      ),
    );
  }

  void selectBranch() {
    emit(GetBranchProductsSelectBranch());
  }
}
