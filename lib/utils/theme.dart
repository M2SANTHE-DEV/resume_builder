import 'package:build_resume/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTheme {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
      primaryTextTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ),
      primaryColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 18.0, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 2, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 2, color: Colors.red)),
          errorStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 2, color: Colors.grey)),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
      textButtonTheme: const TextButtonThemeData(
      ),
      textTheme: const TextTheme(
          button: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2, fontSize: 20)),
      cardTheme: CardTheme(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        margin: const EdgeInsets.all(10.0),
      ),
    );
  }
}

