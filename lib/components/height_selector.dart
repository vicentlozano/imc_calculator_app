import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double height;
  final Function(double) onChange;
  const HeightSelector({super.key, required this.height, required this.onChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text('Altura'.toUpperCase(), style: TextStyles.bodyText),
            Text(
              '${widget.height.toStringAsFixed(0)} cm',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.height,
              onChanged: (value) {
               widget.onChange(value);
              },
              min: 150,
              max: 220,
              divisions: 70,
              activeColor: AppColors.primary,
              label: widget.height.toStringAsFixed(0),
            ),
          ],
        ),
      ),
    );
  }
}
