import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/layouts/home/cubit/states.dart';
import 'package:store_demo_app/modules/courses/courses.dart';
import 'package:store_demo_app/modules/dashboard/dashboard.dart';
import 'package:store_demo_app/modules/profile/profile.dart';
import 'package:store_demo_app/modules/search/search.dart';
import 'package:store_demo_app/modules/settings/settings.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';

class HomeCubit extends Cubit<HomeSts> {
  HomeCubit() : super(InitHomeSt());

  static HomeCubit get(context) => BlocProvider.of(context);

  var screens = [
    Dashboard(),
    Search(),
    Courses(),
    Profile(),
    Settings(),
  ];

  var title = [
    Text(
      'Welcome to courses.',
      style: tChaGrey20().copyWith(
        fontSize: 28.0,
      ),
    ),
    Text(
      'Search courses',
      style: tChaGrey20().copyWith(
        fontSize: 28.0,
      ),
    ),
    Text(
      'Courses.',
      style: tChaGrey20().copyWith(
        fontSize: 28.0,
      ),
    ),
    Text(
      'Profile',
      style: tChaGrey20().copyWith(
        fontSize: 28.0,
      ),
    ),
    Text(
      'Settings',
      style: tChaGrey20().copyWith(
        fontSize: 28.0,
      ),
    ),
  ];

  int currentIndex = 0;

  changeIndex(index) {
    currentIndex = index;
    emit(IndexHomeSt());
  }
}
