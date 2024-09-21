import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/utils/app_colors.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.tooltipText,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText,
      child: FloatingActionButton(
        elevation: 10.0,
        shape: const CircleBorder(),
        backgroundColor: Colors.white.withOpacity(0.9),
        onPressed: () => onPressed(),
        child: Icon(
          icon,
          size: 35.0,
          color: AppColors.orangeCard,
        ),
      ),
    );
  }
}
