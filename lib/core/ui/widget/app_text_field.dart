import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppTextField extends StatefulWidget {
  final String name;
  final String hint;
  final String? initialValue;
  final Widget? icon;
  final List<String? Function(String?)>? validators;
  final dynamic Function(String?)? valueTransformer;
  final bool isObscure;
  final bool isRequired;
  final bool isEnabled;
  final TextInputType inputType;
  final TextInputAction inputAction;

  const AppTextField({
    super.key,
    required this.name,
    required this.hint,
    this.initialValue,
    this.icon,
    this.validators,
    this.valueTransformer,
    this.isObscure = false,
    this.isRequired = true,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      enabled: widget.isEnabled,
      name: widget.name,
      initialValue: widget.initialValue,
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
      obscureText: widget.isObscure == false ? false : _isObscure,
      validator: FormBuilderValidators.compose([
        if (widget.isRequired) FormBuilderValidators.required(),
        ...?widget.validators,
      ]),
      style: Theme.of(context).textTheme.bodyMedium,
      valueTransformer: widget.valueTransformer,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.all(16),
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        prefixIcon: widget.icon,
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 48,
          maxHeight: 48,
          minWidth: 48,
        ),
        suffixIcon: widget.isObscure
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 24,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              width: 1.3, color: Theme.of(context).colorScheme.primary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              width: 1.3, color: Theme.of(context).colorScheme.error),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(width: 1, color: Theme.of(context).colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
