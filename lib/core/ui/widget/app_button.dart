import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final double? width;
  final bool isEnabled;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.width,
    this.isEnabled = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      minWidth: width ?? MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.primary,
      disabledColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        title,
        style: titleStyle ??
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
      ),
    );
  }
}
