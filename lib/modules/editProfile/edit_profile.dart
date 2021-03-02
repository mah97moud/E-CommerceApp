import 'package:flutter/material.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/icons/m_h_icons_icons.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            MHIcons.chevron_left,
            size: 20.0,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              MHIcons.notification_bell,
              size: 20.0,
              color: kCharcoalGrey(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AppCircleAvatar(
                    url:
                        'https://us.123rf.com/450wm/srckomkrit/srckomkrit1607/srckomkrit160702624/60234575-sfondo-rosso-solido-o-carta-rossa-con-texture-di-sfondo-per-la-progettazione-san-valentino-o-sfondo-.jpg?ver=6',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: kPaleLilac(),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Column(
                children: [
                  AppTextField(
                    labelText: 'First name',
                    labelStyle: tChaGrey16(),
                    style: tPrimary16(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AppTextField(
                    labelText: 'Last name',
                    labelStyle: tChaGrey16(),
                    style: tPrimary16(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AppTextField(
                    labelText: 'Email',
                    labelStyle: tChaGrey16(),
                    style: tPrimary16(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  DefaultAppBtn(
                    width: double.infinity,
                    borderColor: kPaleLilac(),
                    color: kPrimaryLight(),
                    onPressed: () {},
                    title: 'Update Profile',
                    textStyle: tPale16(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryDark(),
        unselectedItemColor: kCharcoalGrey(),
        currentIndex: 3,
        onTap: (index) {},
        iconSize: 23.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MHIcons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(MHIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
