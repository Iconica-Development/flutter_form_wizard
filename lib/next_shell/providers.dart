import 'package:flutter_form/next_shell/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final translationServiceProvider =
    Provider<TranslationService>((ref) => ShellTranslationService());
