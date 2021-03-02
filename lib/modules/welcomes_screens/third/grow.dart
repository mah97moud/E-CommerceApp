import 'package:flutter/material.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/widgets.dart';


class GrowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          splashImage(
            imagePath: 'assets/images/welcome-image3.png',
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Grow',
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
                  'Keeping growing with new courses as they are added.',
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
