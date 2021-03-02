import 'package:flutter/material.dart';
import 'package:store_demo_app/modules/editProfile/edit_profile.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/icons/m_h_icons_icons.dart';
import 'package:store_demo_app/shared/components/navigation.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          AppCircleAvatar(
            url:
                'https://www.gravatar.com/avatar/19bc7253102000b3a64c290f74f3ae83.jpg?s=80&d=mm&r=g',
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Allie Grater',
                style: tChaGrey20().copyWith(
                  fontSize: 28.0,
                ),
              ),
              IconButton(
                icon: Icon(MHIcons.edit),
                onPressed: () {
                  navigateTo(
                    context: context,
                    widget: EditProfile(),
                  );
                },
                color: kPrimaryLight(),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'alliegrater@gmail.com',
            style: tChaGrey14().copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 20.0,
            ),
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              children: [
                BrandContainer(
                  brandName: 'My Courses',
                  backgroundColor: kWhite(),
                  child: Text(
                    '4',
                    style: tPale20Bold().copyWith(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                BrandContainer(
                  brandName: 'My Favourites',
                  backgroundColor: kWhite(),
                  icon: MHIcons.heart,
                  iconColor: kPaleLilac(),
                ),
                BrandContainer(
                  brandName: 'My Cart',
                  backgroundColor: kWhite(),
                  icon: Icons.shopping_cart,
                  iconColor: kPaleLilac(),
                ),
                BrandContainer(
                  brandName: 'My Reviews',
                  backgroundColor: kWhite(),
                  icon: MHIcons.star_half,
                  iconColor: kPaleLilac(),
                ),
                BrandContainer(
                  brandName: 'Invite a friend',
                  backgroundColor: kWhite(),
                  icon: MHIcons.share,
                  iconColor: kPaleLilac(),
                ),
                BrandContainer(
                  brandName: 'Help & Support',
                  backgroundColor: kWhite(),
                  icon: Icons.help_outline,
                  iconSize: 25.0,
                  iconColor: kPaleLilac(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
