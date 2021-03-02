import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/layouts/home/cubit/cubit.dart';
import 'package:store_demo_app/layouts/home/cubit/states.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/icons/m_h_icons_icons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeSts>(
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          int curIndex = homeCubit.currentIndex;

          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              titleSpacing: 20.0,
              title: homeCubit.title[curIndex],
            ),
            body: homeCubit.screens[curIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kPrimaryDark(),
              unselectedItemColor: kCharcoalGrey(),
              backgroundColor: kWhite(),
              elevation: 1.0,
              currentIndex: curIndex,
              onTap: (index) {
                homeCubit.changeIndex(index);
              },
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
        },
        listener: (context, state) {},
      ),
    );
  }
}
