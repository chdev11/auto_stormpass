import 'dart:io';

import 'package:auto_stormpass/app/app_module.dart';
import 'package:auto_stormpass/app/app_widget.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setWindowSize(const Size(500, 500));

    await DesktopWindow.setMinWindowSize(const Size(400, 400));
    await DesktopWindow.setMaxWindowSize(const Size(800, 800));
  }
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
