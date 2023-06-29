import 'package:fctech/model/user_model.dart';
import 'package:fctech/service/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var users = <User>[].obs;
  var userList = <User>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchUser();
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

  void fetchUser() async {
    try {
      isLoading(true);
      var response = await RemoteService.fetchUser();
      if(response != null){
        users.value = response;
        userList.value = response;
        print(response);
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

  searchUser(String userName) {
    List<User> results = [];
    if (userName.isEmpty) {
      userList.value = users;
    } else {
      results = users
          .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(userName.toLowerCase()))
          .toList();
      print(results);
      userList.value = results;
    }
  }
}