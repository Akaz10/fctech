import 'package:fctech/controller/home_controller.dart';
import 'package:fctech/utilities/app_color.dart';
import 'package:fctech/view/user_detail_page.dart';
import 'package:fctech/widget/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>SafeArea(
        child: controller.isLoading.value
            ? const Center(child: CircularProgressIndicator(color: AppColors.primaryLight))
            : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 20.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('USERS',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) => controller.searchUser(value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search,color: Color(0xFF3D3D3D),),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: "Search",
                            fillColor: const Color(0xFFF2F2F2)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.userList.length,
                  itemBuilder: (context, index) {
                return UserListWidget(
                    name: controller.userList[index].name!,
                    bs: controller.userList[index].company!.bs,
                    index: index,
                    onClick: () {
                      Get.to(UserDetailPage(userId: controller.userList[index].id!));
                      searchController.clear();
                      controller.searchUser('');
                },);
              }),
            ],
          ),
        ),
      ),)
    );
  }
}
