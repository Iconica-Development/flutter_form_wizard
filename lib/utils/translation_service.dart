// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

abstract class TranslationService {
  TranslationService._();

  String translate(
    BuildContext context,
    String key, {
    List<String>? params,
  });

  String number(double value);
}

typedef Translator = String Function(
  String, {
  List<String>? params,
});

class ShellTranslationService implements TranslationService {
  @override
  String number(double value) => value.toStringAsFixed(2);

  @override
  String translate(BuildContext context, String key, {List<String>? params}) =>
      key;
}

Translator getTranslator(BuildContext context) {
  try {
    var translator = ShellTranslationService().translate;
    return (
      String key, {
      List<String>? params,
    }) =>
        translator(context, key, params: params);
  } on Exception catch (_) {
    return (
      String key, {
      List<String>? params,
    }) =>
        key;
  }
}
