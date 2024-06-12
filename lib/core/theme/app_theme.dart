import 'package:chat_using_websocket/core/theme/extension/app_typography_extension.dart';
import 'package:flutter/material.dart';

// theme extension
extension AppThemes on BuildContext {
  AppTypographyExtension get typography {
    return Theme.of(this).extension<AppTypographyExtension>()!;
  }
}
