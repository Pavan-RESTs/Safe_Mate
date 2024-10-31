import 'package:client/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/main/view/pages/main_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ITheme.theme,
      home: const MainPage(),
    );
  }
}
