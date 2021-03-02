import 'package:flutter/material.dart';
import 'package:store_demo_app/modules/login/login_screen.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/navigation.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class ForgotPasswordSc extends StatelessWidget {
  final TextEditingController emailCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 20.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: tChaGrey20().copyWith(
                fontSize: 28.0,
              ),
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
            SizedBox(
              height: 50.0,
            ),
            Column(
              children: [
                DefaultAppBtn(
                  width: double.infinity,
                  title: 'Send reset code',
                  borderColor: kPaleLilac(),
                  onPressed: () {},
                  color: kPrimaryDark(),
                  textStyle: tPale12(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    navigateTo(context: context, widget: LoginSc());
                  },
                  child: Text(
                    'Login',
                    style: tChaGrey14(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
