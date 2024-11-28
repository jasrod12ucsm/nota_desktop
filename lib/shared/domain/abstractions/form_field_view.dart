import 'package:flutter/material.dart';

abstract class FormFieldView {
  FormField<String> render({
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    bool obscureText = false,
    String obscuringCharacter = '•',
    bool autocorrect = true,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    bool? enabled,
    bool readOnly = false,
    bool autofocus = false,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    TextStyle? style,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
  });
}
