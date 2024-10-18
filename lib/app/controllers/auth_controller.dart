import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../utils/getx_snackbar.dart';
import '../../utils/logger.dart';
import '../data/repositories/auth_repo.dart';

class AuthController extends GetxController {
  final RxBool isLoadingLogin = false.obs;
  final RxBool obscurePassword = true.obs;
  final GlobalKey<FormState> loginGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signinGlobalKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  Future<void> authenticate() async {
    try {
      isLoadingLogin.value = true;

      final authResult =
          await AuthRepository().authenticate("email", passwordController.text);

      //save login data in model and save it in local storage
      await GetStorage().write('authModel', "authResult");
      Logger.success(authResult.toJson());

      passwordController.clear();

      isLoadingLogin.value = false;
    } catch (error) {
      isLoadingLogin.value = false;
      Logger.error(error);
      Snack.showErrorSnackBar(error);
    }
  }

  Future<void> logout() async {
    // Navigate to login page
    await GetStorage().remove('authToken');
    await GetStorage().remove('authModel');
  }

  Future<void> forgotPassword() async {
    loginGlobalKey.currentState?.reset();
  }

  @override
  void onInit() async {
    super.onInit();
    // check if user is already logged in
    final savedAuthModel = await GetStorage().read('authModel');
    if (savedAuthModel != null) {
      // assign saved auth model to authModel
    }
  }
}
