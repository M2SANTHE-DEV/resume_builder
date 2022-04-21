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
    return Container(
        width: MediaQuery.of(navigatorKey.currentContext!).size.width/1.2,
        child: Text(text, style: Theme.of(navigatorKey.currentContext!).primaryTextTheme.subtitle1?.apply(color: fontColor ?? Colors.black,fontSizeDelta: 2)));
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
                  Text(
                    Labels.done,
                      style: Theme.of(navigatorKey.currentContext!).primaryTextTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 2, fontWeightDelta: 2)
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.all(0),
              content: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child:  RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: <TextSpan>[
                                 TextSpan(
                                    text: Labels.successMessage, style: Theme.of(navigatorKey.currentContext!).primaryTextTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 2),
                      ),
                              ]))))),
        );
      },
    );
  }

  buildSubmitButton() {
    return Center(child: OutlinedButton(
        onPressed: () {
                  Provider.of<ResumeProvider>(navigatorKey.currentContext!,
                          listen: false)
                      .clearAllDetails();
                  Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!, Routes.resumeDetails, (Route<dynamic> route) => false,);
    }, child: Text(Labels.okay.toUpperCase(), style: Theme.of(navigatorKey.currentContext!).primaryTextTheme.subtitle1?.apply(color: Colors.blue,fontWeightDelta: 3,fontSizeDelta: 2))));
  }


}