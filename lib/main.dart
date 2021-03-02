import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/layouts/home/home.dart';
import 'package:store_demo_app/shared/components/themes/light.dart';
import 'package:store_demo_app/shared/network/remote/dio_helper.dart';

import 'modules/dashboard/cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DioHelper();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => DashboardCubit()..getCourses(),
        ),
      ],
      child: MaterialApp(
        title: 'Store App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: Home(),
      ),
    );
  }
}
