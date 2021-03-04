import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/modules/search/cubit/cubit.dart';
import 'package:store_demo_app/modules/search/cubit/states.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';
import 'package:store_demo_app/shared/components/icons/m_h_icons_icons.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';
import 'package:store_demo_app/shared/components/widgets.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchTextCo = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: BlocProvider(
        create: (BuildContext context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchSts>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    AppTextField(
                      type: TextInputType.text,
                      style: tPrimary14(),
                      controller: searchTextCo,
                    ),
                    InkWell(
                      onTap: () {
                        SearchCubit.get(context).searchCourses(
                          searchText: searchTextCo.text,
                        );
                      },
                      child: Container(
                        height: 55.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: kPrimaryLight(),
                        ),
                        child: Icon(
                          MHIcons.search,
                          color: kWhite(),
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: CourseItem(
                    course: SearchCubit.get(context).searchList,
                    isScrollable: true,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
