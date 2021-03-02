import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/modules/dashboard/cubit/states.dart';
import 'package:store_demo_app/shared/end_points.dart';
import 'package:store_demo_app/shared/network/remote/dio_helper.dart';

class DashboardCubit extends Cubit<DashboardSts> {
  DashboardCubit() : super(InitDashboardSt());

  static DashboardCubit get(context) => BlocProvider.of(context);

  var coursesList = [];
  int currentPage = 1;
  int totalPages = 0;
  // {@required String token}
  void getCourses() {
    emit(LoadingDashboardSt());
    DioHelper.postData(
      path: GET_COURSES_END_POINT,
      query: {
        'page': currentPage,
      },
      token:
          ' eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjUwMzQ0NWRmNzNhZDBhYTQwMTg1MGQwZTE2MmFjZTQ5OGM0YjhlNDIzMzcwNmNlNDc2YmIxY2FmODJkYWNiYzA1N2YyMGQwODg2YzA5OThhIn0.eyJhdWQiOiIxIiwianRpIjoiNTAzNDQ1ZGY3M2FkMGFhNDAxODUwZDBlMTYyYWNlNDk4YzRiOGU0MjMzNzA2Y2U0NzZiYjFjYWY4MmRhY2JjMDU3ZjIwZDA4ODZjMDk5OGEiLCJpYXQiOjE2MTQ1NDMyMTksIm5iZiI6MTYxNDU0MzIxOSwiZXhwIjoxNjQ2MDc5MjE5LCJzdWIiOiI1MzIiLCJzY29wZXMiOltdfQ.TpvZ9ZJSINdTLjBB1ZdcSgdNSW_mMMKbl0gLMo0AUPWbOCnta0ZZy7MJH4wDpjPNEuoZNBgih-RCrxIRf9GuHGTMJBrPwa-s7ArpBBnvwg2_EvS8uHh2U9Yxo24u1k4PzKcu9fF5so6Cy1yxej9lOS4wHenrnzx3Pbsi0rUlTm2W_Ph3AY3BcKLGD_O9evEke8qaKYzDQ3MYTydrr8SwOa1t6RvO8nzZxzZKShBVnxA4Wj2k117vJ28adwkS0DPbatAb6WTH4CBbt432guPvH0PjbpOfW5A-gc8UhnvIeFT7sjVi8OlN2bs4qjejy34O48V5Nbf8Kc-Y0r6hw7QXEaBRmE7ax-LPlCjeOBs99Kk94L15eZlzUiVz8Qr3WMww2ynAK-tVhh6DLBLkowVH4r1XnSZOUA3ADmKLNr9hlG-F2Yy_MShPACZtRqK6GXcKLqQlonqKfC9jPchycdoTwr44DfjFgbVpw6a3W3wg1YNgDyDsQBeql-r3TZT41H-qdvDUIp7oHj9Mt5gzjrOLC1tHNXleyv6H0zuEtzxAiOZYs1tq9tQX7yT1R21zDEGoXVif7agr4I_XLb9y81GejRIkZXZ6yGYlHLeAJ7yfLApo_aX0KBKmWFSoDSlHoiNuR6nYxJoOCi_FF69fdcSqZT5yXvzoJLp8R0JabWcqCao',
    ).then((value) {
      emit(SuccessDashboardSt());
      print(value.data);
      coursesList = value.data['result']['data'];
      print(coursesList[0]['title']);
      totalPages = value.data['result']['last_page'];
      currentPage++;
    }).catchError((error) {
      emit(ErrorGetDashboardSt());
      print(error.toString());
    });
  }

  void getMoreCourses() {
    emit(LoadingMoreDashboardSt());
    DioHelper.postData(
      path: GET_COURSES_END_POINT,
      query: {
        'page': currentPage,
      },
      token:
          ' eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjUwMzQ0NWRmNzNhZDBhYTQwMTg1MGQwZTE2MmFjZTQ5OGM0YjhlNDIzMzcwNmNlNDc2YmIxY2FmODJkYWNiYzA1N2YyMGQwODg2YzA5OThhIn0.eyJhdWQiOiIxIiwianRpIjoiNTAzNDQ1ZGY3M2FkMGFhNDAxODUwZDBlMTYyYWNlNDk4YzRiOGU0MjMzNzA2Y2U0NzZiYjFjYWY4MmRhY2JjMDU3ZjIwZDA4ODZjMDk5OGEiLCJpYXQiOjE2MTQ1NDMyMTksIm5iZiI6MTYxNDU0MzIxOSwiZXhwIjoxNjQ2MDc5MjE5LCJzdWIiOiI1MzIiLCJzY29wZXMiOltdfQ.TpvZ9ZJSINdTLjBB1ZdcSgdNSW_mMMKbl0gLMo0AUPWbOCnta0ZZy7MJH4wDpjPNEuoZNBgih-RCrxIRf9GuHGTMJBrPwa-s7ArpBBnvwg2_EvS8uHh2U9Yxo24u1k4PzKcu9fF5so6Cy1yxej9lOS4wHenrnzx3Pbsi0rUlTm2W_Ph3AY3BcKLGD_O9evEke8qaKYzDQ3MYTydrr8SwOa1t6RvO8nzZxzZKShBVnxA4Wj2k117vJ28adwkS0DPbatAb6WTH4CBbt432guPvH0PjbpOfW5A-gc8UhnvIeFT7sjVi8OlN2bs4qjejy34O48V5Nbf8Kc-Y0r6hw7QXEaBRmE7ax-LPlCjeOBs99Kk94L15eZlzUiVz8Qr3WMww2ynAK-tVhh6DLBLkowVH4r1XnSZOUA3ADmKLNr9hlG-F2Yy_MShPACZtRqK6GXcKLqQlonqKfC9jPchycdoTwr44DfjFgbVpw6a3W3wg1YNgDyDsQBeql-r3TZT41H-qdvDUIp7oHj9Mt5gzjrOLC1tHNXleyv6H0zuEtzxAiOZYs1tq9tQX7yT1R21zDEGoXVif7agr4I_XLb9y81GejRIkZXZ6yGYlHLeAJ7yfLApo_aX0KBKmWFSoDSlHoiNuR6nYxJoOCi_FF69fdcSqZT5yXvzoJLp8R0JabWcqCao',
    ).then((value) {
      emit(SuccessMorDashboardSt());
      coursesList.addAll(value.data['result']['data']);
      currentPage++;
    }).catchError((error) {
      emit(ErrorGetMoreDashboardSt());
      print(error.toString());
    });
  }
}
