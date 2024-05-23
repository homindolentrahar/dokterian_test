import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension FormStateExtension on GlobalKey<FormBuilderState> {
  void setFieldValue<T>({required String name, required T value}) {
    return currentState?.fields['${name}_field']?.didChange(value);
  }

  bool get isValidForm {
    return (currentState?.saveAndValidate() == true);
  }

  bool get isInvalidForm {
    return !isValidForm;
  }

  void clear() {
    if (currentState != null) {
      for (var field in currentState!.fields.keys) {
        setFieldValue(name: field, value: null);
      }
    }
  }

  Map<String, dynamic> getFormData([List<String> fields = const []]) {
    Map<String, dynamic> temp = {};
    final names = fields.isEmpty ? currentState?.fields.keys.toList() : fields;

    names?.removeWhere((element) => element.contains('_field'));

    currentState?.value.forEach((key, value) {
      if (names?.isEmpty ?? true) {
        temp[key] = value;
      } else {
        if (names?.contains(key) ?? false) {
          temp[key] = value;
        }
      }
    });

    return temp;
  }
}
