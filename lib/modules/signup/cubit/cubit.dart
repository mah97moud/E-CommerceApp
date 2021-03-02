import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/modules/signup/cubit/states.dart';
import 'package:store_demo_app/shared/end_points.dart';
import 'package:store_demo_app/shared/network/remote/dio_helper.dart';

class SignupCubit extends Cubit<SignupSts> {
  SignupCubit() : super(InitSignupSt());

  static SignupCubit get(context) => BlocProvider.of(context);

  signup({
    String firstName,
    String lastName,
    String email,
    String password,
  }) {
    emit(LoadingSignupSt());
    DioHelper.postData(
      path: SIGNUP_END_POINT,
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'city': 'cairo',
      },
    ).then((value) {
      emit(SuccessSignupSt());
      print('Success');
    }).catchError((error) {
      emit(ErrorSignupSt(error));
    });
  }
}
