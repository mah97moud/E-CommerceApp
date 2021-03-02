import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/modules/forgotpassword/forgot_password.dart';
import 'package:store_demo_app/modules/signup/cubit/cubit.dart';
import 'package:store_demo_app/modules/signup/cubit/states.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/navigation.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class SignupSc extends StatelessWidget {
  final TextEditingController firstNameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Text(
          'Sign up',
          style: tChaGrey20().copyWith(
            fontSize: 28.0,
          ),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => SignupCubit(),
        child: BlocConsumer<SignupCubit, SignupSts>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTextField(
                      controller: firstNameCon,
                      labelText: 'First name',
                      labelStyle: tChaGrey12(),
                      type: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      controller: lastNameCon,
                      labelText: 'Last name',
                      labelStyle: tChaGrey12(),
                      type: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
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
                      title: 'Sign up',
                      borderColor: kPaleLilac(),
                      onPressed: () {
                        SignupCubit.get(context).signup(
                          firstName: firstNameCon.text,
                          lastName: lastNameCon.text,
                          email: emailCon.text,
                          password: passwordCon.text,
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
                      title: 'Login',
                      textStyle: tPrimary12(),
                      onPressed: () {},
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
          listener: (context, state) {},
        ),
      ),
    );
  }
}
