import 'package:flutter/material.dart';


class DefaultDropdownButtonFormField<T> extends StatelessWidget {
  final String labelText;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final FormFieldSetter<T>? onSaved;
  final FormFieldValidator<T>? validator;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool isExpanded;
  final bool isDense;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? dropdownColor;
  final double iconSize;
  final Icon? icon;
  final BorderRadius? borderRadius;
  final AutovalidateMode? autovalidateMode;
  final double elevation;
final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  const DefaultDropdownButtonFormField({
    super.key,
    required this.labelText,
    this.value,
    this.items,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.decoration,
    this.style,
    this.isExpanded = true,
    this.isDense = false,
    this.focusNode,
    this.autofocus = false,
    this.dropdownColor,
    this.iconSize = 24.0,
    this.icon,
    this.borderRadius,
    this.autovalidateMode,
    this.elevation = 8.0,
    this.enabledBorderColor,
    this.focusedBorderColor,
  });
  BorderSide _getBorderSide(Color? color) {
    // Define the border width based on the color
    final borderWidth = {
      Colors.red: 2.0,
      Colors.green: 4.0,
      Colors.blue: 1.0,
      Colors.black:1.0,
      // Add other colors and their corresponding widths here
    }[color] ?? 2; // Default width if the color is not found

    return BorderSide(
      color: color ?? Colors.black, // Default color if no color is provided
      width: borderWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InputDecorator(
      decoration: decoration ??
          InputDecoration(
            filled: true,
            labelText: labelText,
            labelStyle: theme.textTheme.labelLarge,
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),borderSide:  _getBorderSide(enabledBorderColor)
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color.fromRGBO(248, 90, 98, 1), width: 1))
            ,contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: -3),
          ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: style ?? theme.textTheme.bodyMedium,
          icon: icon ?? const Icon(Icons.arrow_drop_down),
          iconSize: iconSize,
          isExpanded: isExpanded,
          isDense: isDense,
          focusNode: focusNode,
          autofocus: autofocus,
          dropdownColor: dropdownColor,
          elevation: elevation.toInt(),
          autovalidateMode: autovalidateMode,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}