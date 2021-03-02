import 'package:flutter/material.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/icons/m_h_icons_icons.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                BrandContainer(
                  backgroundColor: kWhite(),
                  icon: MHIcons.branding,
                  brandName: 'Branding',
                  iconColor: kPaleLilac(),
                ),
                Spacer(),
                BrandContainer(
                  backgroundColor: kWhite(),
                  icon: MHIcons.design,
                  brandName: 'Design',
                  iconColor: kPaleLilac(),
                  iconSize: 15.0,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: true
                    ? BouncingScrollPhysics()
                    : NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CourseRow();
                },
                separatorBuilder: (context, index) => Container(
                  height: 1.0,
                  color: Colors.grey[300],
                ),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
