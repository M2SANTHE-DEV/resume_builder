
import 'package:build_resume/utils/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextField extends StatefulWidget {
  final String? hint;
  final String labelText;
  final TextEditingController controller;
  final Function(String?)? validator;
  final List<FilteringTextInputFormatter>? inputFormatter;
  final TextInputType? textInputType;
  final int? maxLines;
  final TextStyle? applyStyling;


  const BuildTextField(this.labelText, this.controller,
      {this.hint, this.validator, this.inputFormatter, this.textInputType,this.maxLines, this.applyStyling});

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing : 10,
      children: [
        Text(widget.labelText, style: widget.applyStyling ?? Theme.of(context).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 1),),
        buildInputField(widget.controller,
            validator: widget.validator,
            hint:widget.hint,
            regExp: widget.inputFormatter,
            keyBoardType : widget.textInputType,
            maxLines : widget.maxLines)
      ],
    );
  }

  Widget buildInputField(TextEditingController controller,
      {Function(String?)? validator,
        String? hint,dynamic regExp,
        TextInputType? keyBoardType = TextInputType.text, int? maxLines}) {
    return Stack(children: [
      maxLines != null ? CommonStyling.shadowMessageDecoration :
      CommonStyling.shadowDecoration,
      TextFormField(
        maxLines: maxLines ?? 1,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            // focusedBorder: ,
            errorMaxLines: 2,
            filled: true,
            hintText: hint),
        controller: controller,
        validator: validator != null ? (val) => validator(val) : (val) {
          return null;
        },
        inputFormatters: regExp,
        keyboardType: keyBoardType,
      ),
    ]);
  }

}
