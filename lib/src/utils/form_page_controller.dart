import 'package:flutter_form/flutter_form.dart';

class ShellFormPageController {
  final List<ShellFormInputController> _controllers = [];

  void register(ShellFormInputController inputController) {
    _controllers.add(inputController);
  }

  bool _isRegisteredById(String id) {
    return _controllers.any((element) => (element.id == id));
  }

  ShellFormInputController? getController(String key) {
    if (_isRegisteredById(key)) {
      return _controllers.firstWhere((element) => element.id == key);
    }
    return null;
  }

  Map<String, dynamic> getAllValues() {
    Map<String, dynamic> values = {};

    for (ShellFormInputController controller in _controllers) {
      if (controller.value != null) {
        values.addAll({controller.id!: controller.value});
      }
    }

    return values;
  }
}
