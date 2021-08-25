import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.suffixText,
    required this.maxLength,
    required this.controller,
    required this.action,
    required this.validator,
  }) : super(key: key);

  final String suffixText;
  final int maxLength;
  final TextEditingController controller;
  final TextInputAction action;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: TextFormField(
        controller: controller,
        textInputAction: action,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixText: suffixText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp('[-]')),
          LengthLimitingTextInputFormatter(maxLength),
        ],
        validator: validator,
      ),
    );
  }
}
