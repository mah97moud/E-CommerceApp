import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/modules/dashboard/cubit/cubit.dart';
import 'package:store_demo_app/modules/dashboard/cubit/states.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/icons/m_h_icons_icons.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class Dashboard extends StatelessWidget {
  // final String token;
  //
  // const Dashboard({this.token});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardSts>(
      listener: (context, state) {},
      builder: (context, state) {
        var dashboardCubit = DashboardCubit.get(context);
        return ConditionalBuilder(
          condition: state is! LoadingDashboardSt,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
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
                    CourseItem(
                      course: dashboardCubit.coursesList,
                    ),
                    if (dashboardCubit.currentPage <= dashboardCubit.totalPages)
                      ConditionalBuilder(
                        condition: state is! LoadingMoreDashboardSt,
                        fallback: (context) => Spinner(
                          text: 'Loading...',
                        ),
                        builder: (BuildContext context) {
                          return DefaultAppBtn(
                            borderColor: kPrimaryLight(),
                            icon: Icon(Icons.arrow_forward_ios),
                            title: 'More',
                            onPressed: () {
                              if (dashboardCubit.currentPage <=
                                  dashboardCubit.totalPages) {
                                dashboardCubit.getMoreCourses();
                              }
                            },
                          );
                        },
                      ),
                    // if (dashboardCubit.currentPage > 1)
                    //   defaultAppBtn(
                    //     borderColor: kPaleLilac(),
                    //     color: kPrimaryLight(),
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     icon: Icon(
                    //       Icons.arrow_back_ios,
                    //       color: kWhite(),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            );
          },
          fallback: (context) => CustomProgressIndicator(),
        );
      },
    );
  }
}
