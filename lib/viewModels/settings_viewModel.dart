import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../settings/LanguageBottomSheet.dart';
import '../settings/ThemeBottomSheet.dart';

class settings_viewModel{

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },);
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },);
  }
}