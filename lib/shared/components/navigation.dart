import 'package:flutter/material.dart';

navigateTo({@required BuildContext context, @required Widget widget}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

navigateAndFinish({@required BuildContext context, @required Widget widget}) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false);
