import 'package:fctech/controller/user_detail_controller.dart';
import 'package:fctech/utilities/app_color.dart';
import 'package:fctech/widget/user_detail_widge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDetailController controller = Get.put(UserDetailController());
    controller.fetchUserDetail(userId.toString());
    return Scaffold(
        body: Obx(() => SafeArea(
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator(color: AppColors.detailPurple,),)
                : Container(
              height: 100.h,
              child: Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                      color: AppColors.purpleLight,
                      height: 30.h,
                    ),
                  ),
                Positioned(
                    right: 0,
                    left: 0,
                    top: 23.h,
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                  backgroundColor: AppColors.primaryShadeLight,
                                  radius: 42.sp,
                                  child: CircleAvatar(
                                      radius: 40.sp,
                                      backgroundImage: NetworkImage('https://i.pravatar.cc/'))
                              ),
                              Positioned(
                                  bottom: 0.5.h,
                                  right: 1.w,
                                  child: Container(height: 2.5.h,width: 2.5.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryMain
                                    ),
                                    child: Center(child: Icon(Icons.add,color: Colors.white,size: 14.sp,)),))
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h,),
                        RichText(
                          text: TextSpan(
                            text: "Username: ",
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: controller.userDetail.value.username,
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9.sp)),
                            ],
                          ),
                        ),

                        SizedBox(height: 0.5.h,),
                        RichText(
                          text: TextSpan(
                            text: "Full Name: ",
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: controller.userDetail.value.name,
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9.sp)),
                            ],
                          ),
                        ),

                        SizedBox(height: 0.5.h,),
                        RichText(
                          text: TextSpan(
                            text: "Website: ",
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: controller.userDetail.value.website,
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9.sp)),
                            ],
                          ),
                        ),
                      ],
                    )),
                  Positioned(
                      left: 0,
                      top: 47.h,
                      child: UserDetailWidget(
                          companyName: controller.userDetail.value.company!.name,
                          catchPhrase: controller.userDetail.value.company!.catchPhrase,
                          phone: controller.userDetail.value.phone!,
                          email: controller.userDetail.value.email!,
                          address: "${controller.userDetail.value.address!.street}, ${controller.userDetail.value.address!.suite}, ${controller.userDetail.value.address!.city}, ${controller.userDetail.value.address!.zipcode}"))
                ],
              ),
            ))));
  }
}
