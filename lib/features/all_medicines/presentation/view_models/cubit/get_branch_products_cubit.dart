import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:pharmacy_app/features/all_medicines/data/repos/get_last_added_branch_repo.dart';
import 'package:pharmacy_app/features/all_medicines/data/repos/get_out_of_stock_branch_repo.dart';
import 'package:pharmacy_app/features/home/data/models/last_added_model.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_model.dart';

import '../../../data/repos/get_branch_products_repo.dart';

part 'get_branch_products_state.dart';

class GetBranchProductsCubit extends Cubit<GetBranchProductsState> {
  GetBranchProductsCubit(
      {required this.getOutOfStockBranchRepo,
      required this.getBranchProductsRepo,
      required this.getLastAddedBranchRepo})
      : super(GetBranchProductsInitial());
  static GetBranchProductsCubit get(context) => BlocProvider.of(context);
  final GetBranchProductsRepo getBranchProductsRepo;
  final GetOutOfStockBranchRepo getOutOfStockBranchRepo;
  final GetLastAddedBranchRepo getLastAddedBranchRepo;
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
    if (searchController.text == "") {
      getBranchProducts(branchId: currentBranchId!);
      return;
    }
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

  void fetechOutOfStock({required String branchId}) async {
    emit(GetBranchProductsLoading());
    final result = await getOutOfStockBranchRepo.fetechOutOfStockBranch(
      branchId: branchId,
    );
    result.fold(
      (apiErrorModel) => emit(
        GetBranchProductsFailure(apiErrorModel: apiErrorModel),
      ),
      (right) => emit(
        GetOutOfStockBranchsSuccess(medicines: right.data),
      ),
    );
  }

  void fetechLastAdded({required String branchId}) async {
    emit(GetBranchProductsLoading());
    final result = await getLastAddedBranchRepo.fetchLastAddedBranch(
      branchId: branchId,
    );
    result.fold(
      (apiErrorModel) => emit(
        GetBranchProductsFailure(apiErrorModel: apiErrorModel),
      ),
      (right) => emit(
        GetLastAddedBranchsSuccess(medicines: right.data),
      ),
    );
  }

  void selectBranch() {
    emit(GetBranchProductsSelectBranch());
  }
}
