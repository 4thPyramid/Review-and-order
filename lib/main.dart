import 'package:flutter/material.dart';
import 'package:review_app/app.dart';
import 'package:review_app/core/data/cached/cache_helper.dart';
import 'package:review_app/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}
