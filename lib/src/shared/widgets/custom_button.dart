import 'package:flutter/material.dart';
import '../exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed}) : super(key: key);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Calcular', style: TextStyles.white20),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(160.0, 50.0),
        primary: AppColors.purpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
