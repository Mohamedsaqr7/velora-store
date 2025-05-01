import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
import 'package:velora/core/networking/dio_factory.dart';
import 'package:velora/feature/auth/login/data/model/login_request_body.dart';
import 'package:velora/feature/auth/login/logic/login/login_state.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _authRepo;
  LoginCubit(this._authRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final respone = await _authRepo.login(
        loginRequestBody: LoginRequestModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    ));

    await respone.when(
      success: (loginData) async {
        final accessToken = loginData.userData.login.accessToken ?? '';
        await SharedPref().setString(SecureKeys.accessToken, accessToken);
        await DioFactory.setTokenIntoHeaderAfterLogin(token: accessToken);
        final user = await _authRepo.userRole();
        await SharedPref().setInt(SecureKeys.userId, user.userId ?? 0);
        await SharedPref().setString(SecureKeys.userId, user.userRole ?? '');
        print("✅ Login successful, emitting Success state");
        emit(LoginState.success(user.userRole ?? ''));
        print("✅ Login successful, emitting Success state");
      },
      failure: (error) {
        emit(LoginState.failure(
            error: error.apiErrorModel.message ?? '${LangKeys.loggedError}'));
      },
    );
  }
}
