import 'package:flutter/material.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/widgets.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          splashImage(imagePath: 'assets/images/welcome-image.png'),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: [
                Text(
                  'Welcome to Courses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kYellow(),
                    fontSize: 32.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Build your overall ability with awesome courses straight on your device, anytime, anywhere by experience tutors',
                  style: TextStyle(
                    color: kPaleLilac(),
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
