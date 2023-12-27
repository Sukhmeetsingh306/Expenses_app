// import 'package:expenses_app/adaptive/adaptive_appBar.dart';
import 'package:expenses_app/adaptive/adaptive_material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // SystemChrome.setPreferredOrientations(
//   //   [
//   //     DeviceOrientation.portraitUp,
//   //     DeviceOrientation.portraitDown,
//   //   ],
//   // ); // to fix rotation
//   runApp(const MyApp());
// } // This is made to fix the device orientation to the one side only

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveMaterial('Personal Expenses');
  }
}
