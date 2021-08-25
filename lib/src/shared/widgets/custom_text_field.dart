import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.suffixText, required this.maxLength})
      : super(key: key);
  final String suffixText;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 70.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixText: suffixText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(maxLength),
        ],
      ),
    );
  }
}
