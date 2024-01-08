import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromto/app/login_view_model/states_login.dart';
import 'package:fromto/app/shared.dart';

class LoginCubit extends Cubit<LoginAppStates>{
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);



  //terms and conditional

  bool agree=false;
  void changeAgreeState(
      {
        required bool value,
      }
      ){

    agree=value;
    emit(ChangeAgreeButtonState());

  }

  bool isPassword=true;
  IconData icon=Icons.remove_red_eye;

  void changeEyePassword(){
    isPassword=!isPassword;
    icon=isPassword ? Icons.remove_red_eye:Icons.visibility_off;
    emit(ChangeEyeLoginState());
  }

  LoginAs loginAs=LoginAs.none;
  ShowMessage showMessage=ShowMessage.firstTime;

  void loginAsImporter(){
    loginAs=LoginAs.importer;
    showMessage=ShowMessage.none;
    emit(LoginAsImporterState());
  }

  void loginAsServerProvider(){
    loginAs=LoginAs.serverProvider;
    showMessage=ShowMessage.none;
    emit(LoginAsServerProviderState());

  }
  void showMessageMethod(){
    showMessage=ShowMessage.show;
    emit(ShowMessageState());

  }

}