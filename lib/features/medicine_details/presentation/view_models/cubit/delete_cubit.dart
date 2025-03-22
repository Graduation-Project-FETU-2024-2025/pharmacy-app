import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/delete_repo.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit(this.deleteRepo) : super(DeleteInitial());
  final DeleteRepo deleteRepo;
  static DeleteCubit get(context) => BlocProvider.of(context);

  void deleteMedicine({required String branchId, required String id}) async {
    emit(DeleteLoading());
    final result = await deleteRepo.deleteMedicine(branchId: branchId, id: id);
    result.fold((errorMessage) {
      emit(DeleteFailure(errorMessage: errorMessage));
    }, (successMessage) {
      emit(DeleteSuccess(successMessage: successMessage));
    });
  }
  //don't forget to add this to EndPoints
  //  static String deleteMedicine = "api/secure/Product/";

  //don't forget to add this to ApiKeys
  //  static String lang = "lang";

  //don't forget to add the this to getit function
  // getIt.registerLazySingleton<DeleteRepo>(
  //   () => DeleteRepoImpl(apiConsumer:getIt<ApiConsumer>()),
  // );
}
