import 'package:flutter/material.dart';
import 'package:store_demo_app/modules/login/login_screen.dart';
import 'package:store_demo_app/modules/signup/signup_screen.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/icons/m_h_icons_icons.dart';
import 'package:store_demo_app/shared/components/navigation.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class LoginSignUpSc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'Welcome to',
                  style: tChaGrey20().copyWith(
                    fontSize: 32.0,
                  ),
                ),
                Text(
                  'Courses',
                  style: tChaGrey20().copyWith(
                    fontSize: 32.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcome-image4.png'),
                      fit: BoxFit.cover,
                    ),
                    color: kPrimaryDark(),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                DefaultAppBtn(
                  width: double.infinity,
                  title: 'Login',
                  borderColor: kPaleLilac(),
                  onPressed: () {
                    navigateTo(context: context, widget: LoginSc());
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
                  onPressed: () {},
                  child: Text(
                    'Or login with',
                    style: tChaGrey14(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    circleBtn(
                      onPressed: () {},
                      child: Icon(MHIcons.apple_icon),
                      color: kPrimaryDark(),
                      heroTag: 'appleBtn',
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    circleBtn(
                      onPressed: () {},
                      child: Icon(MHIcons.google_icon),
                      color: kPrimaryDark(),
                      heroTag: 'googleBtn',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton circleBtn({
    Color color,
    String heroTag,
    @required Function onPressed,
    Widget child,
  }) {
    return FloatingActionButton(
      backgroundColor: color,
      heroTag: heroTag,
      onPressed: onPressed,
      child: child,
    );
  }
}
