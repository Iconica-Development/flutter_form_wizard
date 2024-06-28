import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

class FlutterFormInputDropdown extends FlutterFormInputWidget<Object> {
  const FlutterFormInputDropdown({
    required super.controller,
    required this.validationMessage,
    this.items,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    this.onChanged,
    this.onTap,
    this.elevation = 8,
    this.style,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight,
    this.focusColor,
    this.autofocus = false,
    this.dropdownColor,
    this.decoration,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = Alignment.centerLeft,
    this.borderRadius,
    this.padding,
    super.key,
    super.focusNode,
    super.label,
  });

  final List<DropdownMenuItem<Object?>>? items;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Object? value;
  final Widget? hint;
  final Widget? disabledHint;
  final void Function(Object?)? onChanged;
  final void Function()? onTap;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final Color? focusColor;
  final bool autofocus;
  final Color? dropdownColor;
  final InputDecoration? decoration;
  final void Function(Object?)? onSaved;
  final String? Function(Object?)? validator;
  final AutovalidateMode? autovalidateMode;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final String validationMessage;

  @override
  Widget build(BuildContext context) {
    super.registerController(context);
    return input.FlutterFormInputDropdown(
      items: items,
      selectedItemBuilder: selectedItemBuilder,
      value: value,
      hint: hint,
      disabledHint: disabledHint,
      onChanged: controller.onChanged,
      onTap: () => onTap?.call(),
      elevation: elevation,
      style: style,
      icon: icon,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      iconSize: iconSize,
      isDense: isDense,
      isExpanded: isExpanded,
      itemHeight: itemHeight,
      focusColor: focusColor,
      focusNode: focusNode,
      autofocus: autofocus,
      dropdownColor: dropdownColor,
      decoration: decoration,
      onSaved: controller.onSaved,
      validator: validator ??
          (value) => controller.onValidate(
                value,
                validationMessage,
              ),
      autovalidateMode: autovalidateMode,
      menuMaxHeight: menuMaxHeight,
      enableFeedback: enableFeedback,
      alignment: alignment,
      borderRadius: borderRadius,
      padding: padding,
    );
  }
}

class FlutterFormInputDropdownController
    implements FlutterFormInputController<Object> {
  FlutterFormInputDropdownController({
    required this.id,
    this.mandatory = false,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.onChanged,
    this.onSubmit,
  });

  @override
  String? id;

  @override
  Object? value;

  @override
  bool mandatory;

  @override
  String Function(Object? value)? checkPageTitle;

  @override
  String Function(Object? value)? checkPageDescription;

  @override
  void Function(Object? value)? onChanged;

  @override
  void Function(Object? value)? onSubmit;

  @override
  void onSaved(Object? value) {
    this.value = value;
  }

  @override
  String? onValidate(
    Object? value,
    String validationMessage,
  ) {
    if (mandatory) {
      if (value == null) {
        return validationMessage;
      }
    }

    return null;
  }
}
