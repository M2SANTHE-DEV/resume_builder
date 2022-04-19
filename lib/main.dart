import 'package:build_resume/resume_builder.dart';
import 'package:flutter/material.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  // );

  runApp(ResumeBuilder());
}
