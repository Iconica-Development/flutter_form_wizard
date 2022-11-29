// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter_form_wizard/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the [ShellTranslationService]
final translationServiceProvider =
    Provider<TranslationService>((ref) => ShellTranslationService());
