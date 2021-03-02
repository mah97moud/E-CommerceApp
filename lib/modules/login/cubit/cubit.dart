import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/layouts/home/home.dart';
import 'package:store_demo_app/modules/login/cubit/states.dart';
import 'package:store_demo_app/shared/components/navigation.dart';
import 'package:store_demo_app/shared/end_points.dart';
import 'package:store_demo_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginSts> {
  LoginCubit() : super(InitLoginSt());

  static LoginCubit get(context) => BlocProvider.of(context);
  Map data = {};

  login({
    String email,
    String password,
    @required BuildContext context,
  }) {
    emit(LoadingLoginSt());
    DioHelper.postData(
      path: LOGIN_END_POINT,
      data: {
        'grant_type': 'password',
        'client_id': '1',
        'client_secret': 'UFj2FJ7X2jQfSjtptUIadua4rb0yeZjKvVaS55T9',
        'username': email,
        'password': password,
      },
    ).then((value) {
      emit(SuccessLoginSt());
      print('Success');
      data = value.data;
      // print(data);
      navigateAndFinish(context: context, widget: Home());
    }).catchError((error) {
      emit(ErrorLoginSt(error.toString()));
      DioError dioError = error;
      // print(dioError.toString());
      data = dioError.response.data;
      // print(data);
    });
  }
}
