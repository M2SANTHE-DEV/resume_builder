import 'package:flutter/material.dart';

class CommonStyling {

  static Widget get shadowDecoration {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(168, 168, 168, 0.3),
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(
                    5.0,
                    5.0
                )
            ),
            BoxShadow(
                color: Color.fromRGBO(168, 168, 168, 0.3),
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(
                    5.0,
                    5.0
                )
            )
          ]
      ),
    );
  }

  static Widget get shadowMessageDecoration {
    return  Container(
      height: 115,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(168,168,168,0.3),
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(
                    5.0,
                    5.0
                )
            ),
            BoxShadow(
                color: Color.fromRGBO(168,168,168,0.3),
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(
                    5.0,
                    5.0
                )
            )
          ]
      ),
    );
  }

}