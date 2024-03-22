import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hyper_ui/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  Widget mainView = LoginView();

  //save Login
  if (FirebaseAuth.instance.currentUser != null) {
    mainView = MainNavigationView();
  }

  mainStorage = await Hive.openBox('mainStorage');

  await ProductService.loadDataFromDB();
  await PurchaseOrderService.loadDataFromDB();
  await SalesOrderService.loadDataFromDB();

  runApp(MaterialApp(
    title: 'POS',
    navigatorKey: Get.navigatorKey,
    debugShowCheckedModeBanner: false,
    theme: getDefaultTheme(),
    home: mainView,
  ));
}

Future<void> initialize() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize Hive
  if (!kIsWeb) {
    var appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }
}
