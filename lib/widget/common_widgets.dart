import 'package:build_resume/providers/resume_provider.dart';
import 'package:build_resume/utils/global_variable.dart';
import 'package:build_resume/utils/labels.dart';
import 'package:build_resume/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonWidget {
  Widget buildHeaderText(String text){
    return Text(text, style: Theme.of(navigatorKey.currentContext!).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 6,fontSizeFactor: 1.2, fontWeightDelta: 2));
  }

  Widget buildLabelText(String text, {Color? fontColor}){
    return Text(text, style: Theme.of(navigatorKey.currentContext!).textTheme.subtitle1?.apply(color: fontColor ?? Colors.black,fontSizeDelta: 1));
  }

  void successDialogBox(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: [
                buildSubmitButton()
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.verified_user_outlined,
                      color: Colors.green,
                    ),
                  ),
                  const Text(
                    'Done',
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.all(0),
              content: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Successfully Submitted Resume Good Luck."),
                              ]))))),
        );
      },
    );
  }

  buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(child: OutlinedButton(onPressed: () {
                    Provider.of<ResumeProvider>(navigatorKey.currentContext!,
                            listen: false)
                        .clearAllDetails();
                    Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!, Routes.resumeDetails, (Route<dynamic> route) => false,);
      }, child: Text(Labels.okay.toUpperCase()))),
    );
  }


}