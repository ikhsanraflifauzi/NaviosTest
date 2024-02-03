import 'package:flutter/material.dart';

class InputTextFiled extends StatelessWidget {
  const InputTextFiled(
      {super.key,
      required this.hintText,
      required this.textInputType,
      required this.textEditingController,
      this.IsPass = false});
  final String hintText;
  final TextInputType textInputType;
  final bool IsPass;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: Divider.createBorderSide(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: Divider.createBorderSide(context),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: IsPass,
    );
  }
}
