import 'package:build_resume/utils/global_variable.dart';
import 'package:flutter/material.dart';

class CommonWidget {
  Widget buildHeaderText(String text){
    return Text(text, style: Theme.of(navigatorKey.currentContext!).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 5));
  }

  Widget buildLabelText(String text, {Color? fontColor}){
    return Text(text, style: Theme.of(navigatorKey.currentContext!).textTheme.subtitle1?.apply(color: fontColor ?? Colors.black,fontSizeDelta: 1));
  }

}