import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../flutter_form.dart';

/// Generates a [DateTimeInputField] for DateTimes/Dates/Times/DateRanges.
/// It requires a [FlutterFormInputController], [inputType], [dateFormat], [firstDate], and [lastDate]
class DateTimeInputField extends ConsumerStatefulWidget {
  const DateTimeInputField({
    Key? key,
    required this.inputType,
    required this.controller,
    this.label,
    this.showIcon = true,
    required this.icon,
    required this.dateFormat,
    required this.firstDate,
    required this.lastDate,
    this.initialDate,
    this.initialDateTimeRange,
  }) : super(
          key: key,
        );
  final FlutterFormDateTimeType inputType;
  final FlutterFormInputController<String> controller;
  final DateFormat dateFormat;
  final bool showIcon;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final DateTimeRange? initialDateTimeRange;
  final IconData icon;
  final Widget? label;
  @override
  ConsumerState<DateTimeInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends ConsumerState<DateTimeInputField> {
  late final DateTime firstDate;
  late final DateTime lastDate;
  late final DateTime initialDate;
  late final DateTimeRange initialDateRange;

  @override
  void initState() {
    firstDate = widget.firstDate ??
        DateTime.now().subtract(
          const Duration(days: 1000),
        );
    lastDate = widget.lastDate ??
        DateTime.now().add(
          const Duration(days: 1000),
        );
    initialDate = widget.initialDate ?? DateTime.now();
    initialDateRange = widget.initialDateTimeRange ??
        DateTimeRange(
          start: DateTime.now(),
          end: DateTime.now().add(
            const Duration(days: 7),
          ),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    Future<String> getInputFromUser(FlutterFormDateTimeType inputType) async {
      String userInput = '';
      switch (inputType) {
        case FlutterFormDateTimeType.date:
          DateTime? unformatted = await showDatePicker(
            initialDate: initialDate,
            context: context,
            firstDate: firstDate,
            lastDate: lastDate,
          );
          userInput = unformatted != null
              ? widget.dateFormat.format(unformatted)
              : userInput;
          break;
        case FlutterFormDateTimeType.dateTime:
          await getInputFromUser(FlutterFormDateTimeType.date)
              .then((value) async {
            if (value != '') {
              String secondInput =
                  await getInputFromUser(FlutterFormDateTimeType.time);
              if (secondInput != '') {
                userInput = '$value $secondInput';
              }
            }
          });
          break;
        case FlutterFormDateTimeType.range:
          userInput = (await showDateRangePicker(
                      context: context,
                      firstDate: firstDate,
                      lastDate: lastDate,
                      initialDateRange: initialDateRange)
                  .then((value) {
            return value != null
                ? '${widget.dateFormat.format(value.start)} - ${widget.dateFormat.format(value.end)}'
                : '';
          }))
              .toString();
          break;
        case FlutterFormDateTimeType.time:
          userInput = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now())
              .then((value) => value == null ? '' : value.format(context));
      }
      return userInput;
    }

    return TextFormField(
      keyboardType: TextInputType.none,
      readOnly: true,
      key: Key(widget.controller.value.toString()),
      initialValue: widget.controller.value,
      onSaved: (value) {
        widget.controller.onSaved(value);
      },
      onTap: () async {
        String userInput = await getInputFromUser(widget.inputType);
        setState(() {
          widget.controller.value =
              userInput != '' ? userInput : widget.controller.value;
          widget.controller.onChanged
              ?.call(userInput != '' ? userInput : widget.controller.value);
        });
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
