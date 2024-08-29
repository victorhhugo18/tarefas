import 'package:flutter/material.dart';
import 'package:tarefas/views/inicio_view.dart';
//import 'package:hospitop/views/consultas_view.dart';
//import 'package:hospitop/views/home_view.dart';
//import 'package:hospitop/views/medicos_view.dart';
//import 'package:hospitop/views/pacientes_view.dart';
//import 'package:hospitop/views/painel_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospitop',
      initialRoute: '/',
      routes: {
        '/': (context) => InicioView(),
        //'/painel': (context) => PainelView(),
        //'/pacientes': (context) => PacientesView(),
        //'/medicos': (context) => MedicosView(),
        //'/consultas': (context) => ConsultasView(),
      },
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
    );
  }
}
