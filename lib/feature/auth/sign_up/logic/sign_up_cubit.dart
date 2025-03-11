import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/feature/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:velora/feature/auth/sign_up/logic/sign_up_state.dart';

import '../data/model/sign_up_request_body.dart';
class SignUpCubit extends Cubit<SignupState> {
  SignUpCubit(this._signupRepo) : super(SignupState.initial());
  final SignUpRepo _signupRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitSignupStates({required String imageUrl}) async {
    emit(const SignupState.signupLoading());
    print("✅ Login loading, emitting Success state");
    print("✅ Login load, emitting Success state");
    final response = await _signupRepo.signUp(
      requestModel: SignUpRequestModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        avatar: imageUrl ?? 'https://api.lorem.space/image/face?w=640&h=480',
      ),
    );

    print("✅ Login load, emitting Success state${response}");
    response.when(
      success: (success) {
        emit(SignupState.signupSuccess(success));
        print("✅ Login load, emitting Success state");
      },
      failure: (error) {
        print("❌ Signup failed: ${error}");
        print("📌 Full Error Details: $error");
        emit(SignupState.signupError(
            error: error.apiErrorModel.message ?? 'unknown error'));
      },
    );
  }
}
