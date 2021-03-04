import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_demo_app/shared/components/text_style/text_style.dart';

import 'color/colors.dart';
import 'icons/m_h_icons_icons.dart';

Widget splashImage({
  String imagePath,
}) {
  return Container(
    width: double.infinity,
    child: Image(
      image: AssetImage(
        imagePath,
      ),
      fit: BoxFit.contain,
    ),
  );
}

class DefaultAppBtn extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final double width;
  final String title;
  final Icon icon;
  final TextStyle textStyle;
  final Function onPressed;

  const DefaultAppBtn({
    this.color,
    @required this.borderColor,
    this.width,
    this.title,
    this.icon,
    this.textStyle,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            40.0,
          ),
        ),
        onPressed: onPressed,
        child: title != null
            ? Text(
                title,
                style: textStyle,
              )
            : icon,
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final String labelText;
  final TextStyle labelStyle;
  final TextStyle style;
  final TextInputType type;
  final bool isPassword;
  final TextEditingController controller;
  final Widget suffix;
  final bool focus;

  const AppTextField({
    this.labelText,
    this.labelStyle,
    this.style,
    this.type,
    this.controller,
    this.isPassword = false,
    this.suffix,
    this.focus,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: kWhite(),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TextFormField(
        autofocus: focus ?? false,
        cursorColor: kPrimaryLight(),
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffix: suffix,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryDark(),
            ),
          ),
          labelText: labelText ?? '',
          labelStyle: labelStyle,
        ),
        style: style ?? tChaGrey16(),
        keyboardType: type,
      ),
    );
  }
}

class CourseRow extends StatelessWidget {
  final course;

  const CourseRow({this.course});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: kWhite(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleIcon(
              radius: 30.0,
              icon: MHIcons.bxs_graduation,
              iconColor: kPaleLilac(),
              iconSize: 15.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course != null ? course['title'].toString() : 'title',
                    style: tChaGrey16(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    course != null ? course['description'] : 'description',
                    style: tChaGrey12(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total ratings',
                    style: tChaGrey12(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MHIcons.star_full,
                        size: 10.0,
                        color: kYellow(),
                      ),
                      Icon(
                        MHIcons.star_full,
                        size: 10.0,
                        color: kYellow(),
                      ),
                      Icon(
                        MHIcons.star_full,
                        size: 10.0,
                        color: kYellow(),
                      ),
                      Icon(
                        MHIcons.star_full,
                        size: 10.0,
                        color: kYellow(),
                      ),
                      Icon(
                        MHIcons.star_full,
                        size: 10.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandContainer extends StatelessWidget {
  const BrandContainer({
    this.height = 150.0,
    this.width = 150.0,
    this.backgroundColor,
    @required this.brandName,
    this.icon,
    this.iconColor,
    this.iconSize = 18.0,
    this.child,
  });

  final double height;
  final double width;
  final Color backgroundColor;
  final String brandName;
  final IconData icon;
  final Widget child;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 20,
        //     offset: Offset(0, 0), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleIcon(
            icon: icon,
            child: child,
            iconColor: iconColor,
            iconSize: iconSize,
            radius: 23.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            brandName,
            style: tChaGrey16().copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    this.icon,
    @required this.iconColor,
    @required this.iconSize,
    this.radius,
    this.child,
  });

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kPrimaryLight(),
      radius: radius,
      child: icon != null
          ? Icon(
              icon,
              color: iconColor,
              size: iconSize,
            )
          : child,
    );
  }
}

void showToast({@required String message}) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

class CustomProgressIndicator extends StatelessWidget {
  final double height;
  final double width;

  const CustomProgressIndicator({this.height = 50.0, this.width = 50.0});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLight(),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}

class Spinner extends StatelessWidget {
  final String text;
  const Spinner({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              child: CircularProgressIndicator(),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              text,
              style: tChaGrey14(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppCircleAvatar extends StatelessWidget {
  final double radius;
  final double imageRadius;
  final String url;

  const AppCircleAvatar({
    this.radius = 60.0,
    this.imageRadius = 55.0,
    this.url,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: kPrimaryLight(),
      child: CircleAvatar(
        radius: imageRadius,
        backgroundImage: NetworkImage(
          url,
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  const CourseItem({
    @required this.course,
    this.isScrollable = false,
  });

  final List course;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: isScrollable
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CourseRow(
          course: course[index],
        );
      },
      separatorBuilder: (context, index) => Container(),
      itemCount: course.length,
    );
  }
}
