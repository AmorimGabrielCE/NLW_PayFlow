import 'package:flutter/material.dart';
import 'package:nlw_flutter/modules/splash/splash_page.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';

import 'modules/login/login_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(primaryColor: AppColors.primary),
      home: LoginPage(),
    );
  }
}
