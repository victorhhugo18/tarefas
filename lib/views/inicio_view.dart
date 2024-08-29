import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tarefas/views/components/card.dart';
import 'package:tarefas/views/components/espacamento_h.dart';
import 'package:intl/intl.dart';

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context, Function setState) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 51, 126, 122),
        foregroundColor: Colors.white,
        child: FaIcon(FontAwesomeIcons.plus),
        onPressed: () {
          _selectedDate = null;
          Alert(
            context: context,
            title: "Nova tarefa",
            content: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Descrição',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Prazo',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate(context, setState);
                      },
                      controller: TextEditingController(
                        text: _selectedDate == null
                            ? ''
                            : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                      ),
                    ),
                  ],
                );
              },
            ),
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Color.fromARGB(255, 51, 126, 122),
              )
            ],
          ).show();
        },
      ),
      appBar: AppBar(
        title: Center(child: Text("Gerenciador de Tarefas")),
        backgroundColor: Color.fromARGB(255, 51, 126, 122),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EspacamentoH(h: 10),
            Center(
              child: Text(
                "Bem vindo ao seu gerenciador de tarefas!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            EspacamentoH(h: 10),
            CardT(isCompleted: true),
            CardT(),
            CardT(),
            CardT(isCompleted: true),
            CardT(),
            CardT(),
            CardT(isCompleted: true),
            CardT(),
            CardT(),
          ],
        ),
      ),
    );
  }
}

