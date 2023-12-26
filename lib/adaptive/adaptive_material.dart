import '../main.dart';
import 'package:flutter/material.dart';

class AdaptiveMaterial extends StatelessWidget {
  final String textMaterial;

  const AdaptiveMaterial(this.textMaterial, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: textMaterial,
      color: Colors.purple,
      theme: ThemeData(
        // primarySwatch:  Color.fromRGBO(103, 58, 183, 1),
        //errorColor: const Color.fromARGB(255, 152, 57, 50),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(103, 58, 183, 1),
        ),
        useMaterial3: true,
        fontFamily:
            'Quicksand', // as to make this happen we had to add the font file in the pub yaml file and then and only we can add the font over here
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                color: Color.fromARGB(255, 99, 32, 150),
              ),
              //button: const TextStyle(color: Color.fromARGB(255, 99, 32, 150),),
            ), // as per this will make the all the input to make in same font as the other will
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
