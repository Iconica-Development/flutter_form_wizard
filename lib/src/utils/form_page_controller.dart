// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter_form_wizard/flutter_form.dart';

/// Controller class for managing input controllers in a Flutter form.
class FlutterFormPageController {
  /// List of input controllers.
  List<FlutterFormInputController> _controllers = [];

  /// Registers an input controller.
  void register(FlutterFormInputController inputController) {
    _controllers.add(inputController);
  }

  /// Clears all registered input controllers.
  void clearControllers() {
    _controllers = [];
  }

  /// Checks if an input controller is registered with a given ID.
  bool _isRegisteredById(String id) =>
      _controllers.any((element) => element.id == id);

  /// Retrieves the input controller associated with the provided ID.
  FlutterFormInputController? getController(String key) {
    if (_isRegisteredById(key)) {
      return _controllers.firstWhere((element) => element.id == key);
    }
    return null;
  }

  /// Retrieves all values from registered input controllers.
  Map<String, dynamic> getAllValues() {
    var values = <String, dynamic>{};

    for (var controller in _controllers) {
      if (controller.value != null) {
        values.addAll({controller.id!: controller.value});
      }
    }

    return values;
  }
}
