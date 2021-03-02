import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_demo_app/modules/login/login_screen.dart';
import 'package:store_demo_app/modules/welcomes_screens/first/welcome.dart';
import 'package:store_demo_app/modules/welcomes_screens/fourth/certificate.dart';
import 'package:store_demo_app/modules/welcomes_screens/second/learn.dart';
import 'package:store_demo_app/modules/welcomes_screens/third/grow.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';

import 'package:store_demo_app/shared/components/navigation.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';

class SplashScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDark(),
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  WelcomeScreen(),
                  LearnScreen(),
                  GrowScreen(),
                  CertificateScreen(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(
                    40.0,
                  ),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: ExpandingDotsEffect(
                      spacing: 0.0,
                      dotWidth: 30.0,
                      dotHeight: 8.0,
                      radius: 5.0,
                      expansionFactor: 2,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    navigateAndFinish(
                      context: context,
                      widget: LoginSc(),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: tPale12(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
