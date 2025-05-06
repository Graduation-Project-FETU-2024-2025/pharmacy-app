import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/widgets/add_delete_button.dart';
import 'package:pharmacy_app/core/widgets/error_api_widget.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/product_dto_model.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/delete_repo.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/view_models/delete_cubit/delete_cubit.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/view_models/get_medicine/get_medicine_cubit.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/views/widgets/delete_button_consumer.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'all_info_medicine.dart';

class MedicineDetailsViewBody extends StatelessWidget {
  const MedicineDetailsViewBody({
    super.key,
    required this.branchId,
    required this.id,
  });
  final String branchId, id;

  @override
  Widget build(BuildContext context) {
    final cubit = GetMedicineCubit.get(context);
    return BlocBuilder<GetMedicineCubit, GetMedicineState>(
      builder: (context, state) {
        if (state is GetMedicineSuccess) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 360.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            state.medicineBranchModel.productsDTO.image,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 35.h,
                      left: MediaQuery.sizeOf(context).width * 0.38.w,
                      child: Container(
                        width: 80.w,
                        height: 10,
                        decoration: ShapeDecoration(
                          color: AppColors.black.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      top: 16.h,
                      start: 16.w,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                            ? SvgPicture.asset(
                                AppIcons.iconsBack,
                              )
                            : SvgPicture.asset(
                                AppIcons.iconsBackRight,
                              ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16.h,
                  ),
                  child: AllIfoMedicine(
                    medicineBranchModel: state.medicineBranchModel,
                  ),
                ),
                Spacer(),
                BlocProvider(
                  create: (context) => DeleteCubit(
                    getIt<DeleteRepo>(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35.h,
                        width: 120.w,
                        child: AddDeleteButton(
                          title: S.of(context).update,
                          color: AppColors.primaryColor,
                          onpressed: () async {
                            final result = await Navigator.pushNamed(
                                context, Routing.updateMedicine,
                                arguments: {
                                  'medicineBranchModel':
                                      state.medicineBranchModel,
                                  'branchId': state.medicineBranchModel.branchId
                                });
                            if (result == true) {
                              cubit.getMedicine(
                                branchId: branchId,
                                id: id,
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 35.h,
                        width: 120.w,
                        child: DeleteButtonConsumer(
                          medicineBranchModel: state.medicineBranchModel,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          );
        } else if (state is GetMedicineFailure) {
          return Center(
            child: ErrorApiWidget(message: state.apiErrorModel.message!),
          );
        } else {
          return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkGray
                  : AppColors.lightGray,
            ),
            enabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 360.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16.h,
                  ),
                  child: AllIfoMedicine(
                    medicineBranchModel: MedicineBranchModel(
                      branchId: branchId,
                      name: 'kcdj',
                      systemProductCode: '12345678',
                      stock: 0,
                      price: 0,
                      visibility: true,
                      productsDTO: ProductDtoModel(
                        code: "123456789",
                        arName: 'arName',
                        enName: 'enName',
                        image: 'image',
                        type: 'type',
                        activePrincipal: '',
                        companyName: 'companyName',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
