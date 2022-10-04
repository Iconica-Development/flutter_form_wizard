import 'package:flutter/widgets.dart';
import 'package:form_example/example_pages/thanks_page.dart';
import 'package:form_example/form_example.dart';
import 'package:form_example/main.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => const FormsExample(),
    '/form': (context) => const FormExample(),
    '/thanks': (context) => const ThanksPage(),
  };
}
