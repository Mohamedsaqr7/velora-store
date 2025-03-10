import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/networking/api_result.dart';
import 'package:velora/feature/auth/login/data/model/login_request_body.dart';
import 'package:velora/feature/auth/login/data/model/user_role_response.dart';
import 'package:velora/feature/auth/login/data/repo/login_repo.dart';
import 'package:velora/feature/auth/login/logic/login/login_state.dart';

import '../../../../../core/constants/secure_storage.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/dio_factory.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo _authRepo;
  LoginCubit(this._authRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final respone = await _authRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    await respone.when(
      success: (loginData) async {
        // await saveUserToken(userRole.data.login.accessToken ?? '');
        // emit(LoginState.success(userRole));
        final accessToken = loginData.data.login.accessToken ?? '';
        log("access token : $accessToken");
        await SharedPref().setString(SecureKeys.accessToken, accessToken);
        await DioFactory.setTokenIntoHeaderAfterLogin(token: accessToken);
        final user = await _authRepo.userRole();
        await SharedPref().setInt(SecureKeys.userId, user.userId ?? 0);
        await SharedPref().setString(SecureKeys.userId, user.userRole ?? '');
        emit(LoginState.success(user.userRole ?? ''));
        
      },
      failure: (error) {
        emit(LoginState.failure(
            error: error.apiErrorModel.message ?? '${LangKeys.loggedError}'));
      },
    );
  }
}
