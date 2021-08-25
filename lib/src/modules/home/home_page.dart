import 'package:flutter/material.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_text_styles.dart';
import '../../shared/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150.0),
                  border: Border.all(width: 10, color: AppColors.green),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('24.22', style: TextStyles.green42),
                    Text('Peso normal', style: TextStyles.green20),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Seu peso', style: TextStyles.black16),
                      SizedBox(height: 8.0),
                      CustomTextField(suffixText: 'kg', maxLength: 2),
                    ],
                  ),
                  SizedBox(width: 24.0),
                  Column(
                    children: [
                      Text('Sua altura', style: TextStyles.black16),
                      SizedBox(height: 8.0),
                      CustomTextField(suffixText: 'm', maxLength: 3),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Calcular', style: TextStyles.white20),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.0, 50.0),
                  primary: AppColors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
