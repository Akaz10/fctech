import 'package:fctech/model/user_model.dart';
import 'package:fctech/service/remote_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserDetailController extends GetxController {
  var userDetail = Rx(User());
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void fetchUserDetail(String userId) async {
    try {
      isLoading(true);
      var response = await RemoteService.fetchUserDetail(userId);
      if(response != null){
        userDetail.value = response;
      }else{
        Get.snackbar("Warning",
            '',
            icon: const Icon(Icons.warning, color: Colors.white),
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 3));
      }
      isLoading(false);
    } catch (err) {
      Get.snackbar("HATA",
          '$err',
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3));
      print(err);
      isLoading(false);
    }
  }



}