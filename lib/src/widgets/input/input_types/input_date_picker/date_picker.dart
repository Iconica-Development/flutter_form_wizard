import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../flutter_form.dart';

/// Generates a [TextFormField] for passwords. It requires a [FlutterFormInputController]
/// as the [controller] parameter and an optional [Widget] as [label]
class DateInputField extends ConsumerStatefulWidget {
  const DateInputField(
      {Key? key,
      required this.controller,
      this.label,
      this.showIcon = true,
      this.icon = Icons.calendar_today,
      required this.dateFormat})
      : super(
          key: key,
        );
  final FlutterFormInputController controller;
  final DateFormat dateFormat;
  final bool showIcon;
  final IconData icon;
  final Widget? label;
  @override
  ConsumerState<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends ConsumerState<DateInputField> {
  @override
  Widget build(BuildContext context) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    return TextFormField(
      key: Key(widget.controller.value.toString()),
      initialValue: widget.controller.value,
      onSaved: (value) {
        widget.controller.onSaved(value);
      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 2000),
          ),
        );
        if (pickedDate != null) {
          widget.controller.value = widget.dateFormat.format(pickedDate);
          setState(() {});
        }
      },
      validator: (value) => widget.controller.onValidate(value, _),
      decoration: InputDecoration(
        suffixIcon: widget.showIcon ? Icon(widget.icon) : null,
        focusColor: Theme.of(context).primaryColor,
        label: widget.label ?? const Text("Date"),
      ),
    );
  }
}
