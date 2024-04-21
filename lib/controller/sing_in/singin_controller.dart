import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/errors.dart';
import 'package:fakestore/model/network/StatusController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SingInController extends FSGetXController {
  final bool _isCompleteForm = false;
  bool _isVisibilityPass = false;
  bool _isLoading = false;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  bool get isCompleteForm => _isCompleteForm;
  bool get isVisibilityPass => _isVisibilityPass;
  bool get isLoading => _isLoading;
  // GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get controllerName => _controllerName;
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerPass => _controllerPass;

  void changePasswordVisibility() {
    _isVisibilityPass = !_isVisibilityPass;
    update(['Password']);
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter your username.";
    } else if (!GetUtils.isUsername(value)) {
      return "Enter a valid user.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter your email.";
    } else if (!GetUtils.isEmail(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter your password.";
    }
    if (value.trim().length < 8) {
      return "Tu contraseña debe tener al menos 8 digitos.";
    }
    return null;
  }

  // void onChangeUserName(String? value) {
  //   _validateBtnContinuar();
  // }

  // void onChangeEmail(String? value) {
  //   _validateBtnContinuar();
  // }

  // void onChangePass(String? value) {
  //   _validateBtnContinuar();
  // }

  // void _validateBtnContinuar() {
  //   if (_formKey.currentState!.validate()) {
  //     _isCompleteForm = true;
  //   } else {
  //     _isCompleteForm = false;
  //   }
  //   update(['BtnSingIn']);
  // }

  void onSingIn() async {
    _isLoading = true;
    update();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    JsonResponseSingIn response = await postSingIn(
      EndPoint.singIn,
      params: {
        'username': _controllerName.text.trim(),
        'password': _controllerPass.text.trim(),
        'email': _controllerEmail.text.trim(),
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar("Success",
          'Account Created Successfully id: ${response.response!.id ?? ''}');
    } else {
      Errors().errors(response.statusCode, message: 'Algun dato incorrecto.');
    }
    _isLoading = false;
    update();
  }
}
