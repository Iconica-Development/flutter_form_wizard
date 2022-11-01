// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter_form/flutter_form.dart';

class FlutterFormPageController {
  List<FlutterFormInputController> _controllers = [];

  void register(FlutterFormInputController inputController) {
    _controllers.add(inputController);
  }

  clearControllers() {
    _controllers = [];
  }

  bool _isRegisteredById(String id) {
    return _controllers.any((element) => (element.id == id));
  }

  FlutterFormInputController? getController(String key) {
    if (_isRegisteredById(key)) {
      return _controllers.firstWhere((element) => element.id == key);
    }
    return null;
  }

  Map<String, dynamic> getAllValues() {
    Map<String, dynamic> values = {};

    for (FlutterFormInputController controller in _controllers) {
      if (controller.value != null) {
        values.addAll({controller.id!: controller.value});
      }
    }

    return values;
  }
}
