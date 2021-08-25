import 'package:flutter/material.dart';
import '../../shared/exports.dart';
import './home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void dispose() {
    controller.weightController.dispose();
    controller.heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                controller.imc == 0
                    ? Text(
                        'Adicione valores de peso e altura\n para calcular o seu IMC',
                        style: TextStyles.black20Italic,
                        textAlign: TextAlign.center,
                      )
                    : Container(
                        width: 300.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150.0),
                          border: Border.all(
                            width: 10,
                            color: controller.getColor(controller.imc),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${controller.imc.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 50.0,
                                color: controller.getColor(controller.imc),
                              ),
                            ),
                            Text(
                              '${controller.getClassification(controller.imc)}',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: controller.getColor(controller.imc),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            IconButton(
                              icon: Icon(
                                Icons.refresh_rounded,
                                color: controller.getColor(controller.imc),
                              ),
                              onPressed: () =>
                                  setState(() => controller.imc = 0),
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 32.0),
                Visibility(
                  visible: controller.imc == 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Seu peso', style: TextStyles.black16),
                          SizedBox(height: 8.0),
                          CustomTextField(
                            controller: controller.weightController,
                            action: TextInputAction.next,
                            suffixText: 'kg',
                            maxLength: 3,
                            validator: (value) =>
                                Validators().valueValidate(value!),
                          ),
                        ],
                      ),
                      SizedBox(width: 24.0),
                      Column(
                        children: [
                          Text('Sua altura', style: TextStyles.black16),
                          SizedBox(height: 8.0),
                          CustomTextField(
                            controller: controller.heightController,
                            action: TextInputAction.done,
                            suffixText: 'm',
                            maxLength: 4,
                            validator: (value) =>
                                Validators().valueValidate(value!),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Visibility(
                  visible: controller.imc == 0,
                  child: CustomButton(
                    onPressed: () => setState(() => controller.validate()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
