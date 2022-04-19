import 'package:build_resume/screens/resume_details.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  /// Here we'll handle all the routing
  switch (settings.name) {
    case "ViewDetails":
      return MaterialPageRoute(builder: (_) => ResumeDetails());
    default :
      return MaterialPageRoute(builder: (_) => ResumeDetails());
  }
}
