import 'package:flutter/material.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class CertificateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          splashImage(
            imagePath: 'assets/images/welcome-image4.png',
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Certificate',
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
                  'Leave with a certificate, more knowledgeable, wiser, more experienced right in the app.',
                  style: TextStyle(
                    color: kPaleLilac(),
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                DefaultAppBtn(
                  textStyle: tPale14(),
                  borderColor: kPaleLilac(),
                  onPressed: () {},
                  title: 'Get Started',
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
