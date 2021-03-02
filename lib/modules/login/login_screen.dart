import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/models/login_model.dart';
import 'package:store_demo_app/modules/forgotpassword/forgot_password.dart';
import 'package:store_demo_app/modules/login/cubit/cubit.dart';
import 'package:store_demo_app/modules/signup/signup_screen.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/navigation.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

import 'cubit/states.dart';

class LoginSc extends StatelessWidget {
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Text(
          'Login',
          style: tChaGrey20().copyWith(
            fontSize: 28.0,
          ),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginSts>(
          listener: (context, state) {
            if (state is ErrorLoginSt) {
              {
                LoginModel(LoginCubit.get(context).data);
                print(LoginModel.getErrorMessage());
                showToast(message: LoginModel.getErrorMessage());
              }
            }
          },
          builder: (context, state) {
            return ConditionalBuilder(
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextField(
                          controller: emailCon,
                          labelText: 'Email',
                          labelStyle: tChaGrey12(),
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        AppTextField(
                          controller: passwordCon,
                          labelText: 'Password',
                          labelStyle: tChaGrey12(),
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        DefaultAppBtn(
                          width: double.infinity,
                          title: 'Login',
                          borderColor: kPaleLilac(),
                          onPressed: () {
                            LoginCubit.get(context).login(
                              email: emailCon.text,
                              password: passwordCon.text,
                              context: context,
                            );
                          },
                          color: kPrimaryDark(),
                          textStyle: tPale12(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        DefaultAppBtn(
                          width: double.infinity,
                          title: 'Sign Up',
                          textStyle: tPrimary12(),
                          onPressed: () {
                            navigateTo(context: context, widget: SignupSc());
                          },
                          borderColor: kPrimaryDark(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                                context: context, widget: ForgotPasswordSc());
                          },
                          child: Text(
                            'Forgot your password?',
                            style: tChaGrey14(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              condition: state is! LoadingLoginSt,
              fallback: (context) => CustomProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
