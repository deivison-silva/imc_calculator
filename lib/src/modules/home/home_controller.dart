import 'package:flutter/material.dart';
import '../../shared/exports.dart';

class HomeController {
  double imc = 0;
  late String classification;
  late Color resultColor;

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      calculate();
    }
  }

  void calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    imc = weight / (height * height);
    weightController.text = '';
    heightController.text = '';
  }

  String getClassification(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc > 18.5 && imc <= 24.9) {
      return 'Peso ideal';
    } else if (imc > 24.9 && imc <= 29.9) {
      return 'Sobrepeso';
    } else if (imc > 29.9 && imc <= 34.9) {
      return 'Obesidade (Grau I)';
    } else if (imc > 34.9 && imc <= 39.9) {
      return 'Obesidade (Grau II)';
    } else if (imc > 39.9) {
      return 'Obesidade (Grau III)';
    }
    return classification;
  }

  Color getColor(double imc) {
    if (imc < 18.5) {
      return AppColors.blue;
    } else if (imc > 18.5 && imc <= 24.9) {
      return AppColors.green;
    } else if (imc > 24.9 && imc <= 29.9) {
      return AppColors.corvette;
    } else if (imc > 29.9 && imc <= 34.9) {
      return AppColors.orange;
    } else if (imc > 34.9 && imc <= 39.9) {
      return AppColors.redAccent;
    } else if (imc > 39.9) {
      return AppColors.red;
    }
    return resultColor;
  }
}
