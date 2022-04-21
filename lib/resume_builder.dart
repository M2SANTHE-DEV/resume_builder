import 'package:build_resume/providers/resume_provider.dart';
import 'package:build_resume/router.dart';
import 'package:build_resume/screens/resume_details.dart';
import 'package:build_resume/utils/global_variable.dart';
import 'package:build_resume/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResumeBuilder extends StatelessWidget {
  const ResumeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResumeProvider()),
      ],
      child: MaterialApp(
          key: const Key('material_app'),
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: CustomTheme.theme(context),
          home: const ResumeDetails(),
          onGenerateRoute: generateRoute),
    );
  }
}
