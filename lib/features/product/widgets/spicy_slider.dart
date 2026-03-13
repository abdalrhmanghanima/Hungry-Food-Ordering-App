import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.image,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final String image;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Flexible(
          flex: 3,
          child: Image.network(
            widget.image,
            fit: BoxFit.contain,
            height: 220,
          ),
        ),

        const Gap(10),

        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text:
                'Customize Your Burger\nTo Your Tastes.\nUltimate Experience',
              ),

              const Gap(10),

              Slider(
                value: widget.value,
                max: 1,
                min: 0,
                onChanged: widget.onChanged,
                activeColor: AppColors.primary,
                inactiveColor: Colors.grey.shade300,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('🥶'),
                  Text('🌶'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}