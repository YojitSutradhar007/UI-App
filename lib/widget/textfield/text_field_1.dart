import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/services.dart';

// this is the text Field which are  using in login, Signup and Forget Password fields

class NormalTextField extends StatelessWidget {
  final TextEditingController? textCtrl;
  final String hintText;
  final Function(String)? onChanged;
  final double? topMargin;
  final int? fieldLength;
  final TextInputType? keyboardType;
  final InputBorder? enabledInputBorder;

  const NormalTextField({
    super.key,
    this.textCtrl,
    this.topMargin,
    required this.hintText,
    this.onChanged,
    this.fieldLength,
    this.keyboardType,
    this.enabledInputBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin??0).r,
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: [
          LengthLimitingTextInputFormatter(fieldLength ?? 100),
        ],
        textInputAction: TextInputAction.next,
        onChanged: onChanged,
        cursorColor: ColorManager.black87Color,
        cursorRadius: const Radius.circular(10),
        cursorWidth: 2,
        cursorHeight: 25,
        controller: textCtrl,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          enabledBorder: enabledInputBorder,
          focusedBorder: enabledInputBorder,
          contentPadding: const EdgeInsets.only(left: 10).r,
        ),
      ),
    );
  }
}
