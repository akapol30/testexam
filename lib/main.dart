import 'package:example1/bloc/pibloc.dart';
import 'package:example1/bloc/stepbloc.dart';
import 'package:example1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StepBloc(),
        ),
      ],
      child: const MaterialApp(home: Home()),
    );
  }
}
