import 'package:build_resume/screens/preview_details.dart';
import 'package:build_resume/screens/resume_details.dart';
import 'package:build_resume/utils/routes.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  /// Here we'll handle all the routing
  switch (settings.name) {
    case Routes.resumeDetails:
      return MaterialPageRoute(builder: (_) => ResumeDetails());
    case Routes.previewDetails:
      return MaterialPageRoute(builder: (_) => PreviewDetails());
    default :
      return MaterialPageRoute(builder: (_) => ResumeDetails());
  }
}
