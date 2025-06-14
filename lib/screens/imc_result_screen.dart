import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  final int age;

  const ImcResultScreen({
    super.key,
    required this.age,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    double imcResult = weight / (height / 100 * height / 100);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult( context, imcResult),
    );
  }

  Padding bodyResult(BuildContext context, double imcResult) => Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        Text(
          'Tu resultado',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Spacer(flex: 1),
                  Text(
                    getImcCategory(imcResult)['category']!.toUpperCase(),
                    style: TextStyle(
                      fontSize: 30,
                      color: imcResult > 18.5 && imcResult < 25
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  Spacer(flex: 1),

                  Text(
                    imcResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 1),

                  Text(
                    getImcCategory(imcResult)['description']!,
                    style: TextStyles.bodyText,
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text('FINALIZAR', style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    ),
  );

  AppBar toolbarResult() => AppBar(
    title: Text('RESULTADO', style: TextStyles.bodyText),
    backgroundColor: AppColors.primary,
  );
}

Map<String, String> getImcCategory(double imc) {
  if (imc < 18.5) {
    return {
      'category': 'Bajo peso',
      'description': 'Tienes un peso por debajo de lo normal.',
    };
  } else if (imc < 25) {
    return {
      'category': 'Peso normal',
      'description': 'Tienes un peso saludable.',
    };
  } else if (imc < 30) {
    return {
      'category': 'Sobrepeso',
      'description': 'Estás por encima del peso normal.',
    };
  } else {
    return {
      'category': 'Obesidad',
      'description': 'Estás en un rango de obesidad.',
    };
  }
}
