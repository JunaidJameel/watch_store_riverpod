import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watch_store/const/app_theme.dart';
import 'package:watch_store/view/bottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return ProviderScope(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Watch Store',
              theme: AppTheme.lightTheme,
              home: MainScreen(),
            ),
          );
        });
  }
}
