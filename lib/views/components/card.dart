import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickalert/quickalert.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CardT extends StatefulWidget {
  final bool isCompleted;
  const CardT({super.key, this.isCompleted = false});

  @override
  _CardTState createState() => _CardTState();
}

class _CardTState extends State<CardT> {
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
    return GestureDetector(
      onDoubleTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          title: 'Atenção!',
          text: 'Deseja excluir a tarefa?',
          confirmBtnText: 'Sim',
          cancelBtnText: 'Não',
          confirmBtnColor: const Color.fromARGB(255, 37, 120, 131),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        child: Container(
          width: 330.0,
          height: 100.0,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Título',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            Text(
                              'Descrição curta...',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                            FaIcon(
                              widget.isCompleted
                                  ? FontAwesomeIcons.checkCircle
                                  : FontAwesomeIcons.clock,
                              color: widget.isCompleted
                                  ? Colors.green
                                  : Colors.orange,
                              size: 16.0,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _selectedDate = null;
                                Alert(
                                  context: context,
                                  title: "Editar tarefa",
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
                                              suffixIcon:
                                                  Icon(Icons.calendar_today),
                                            ),
                                            readOnly: true,
                                            onTap: () {
                                              _selectDate(context, setState);
                                            },
                                            controller: TextEditingController(
                                              text: _selectedDate == null
                                                  ? ''
                                                  : DateFormat('dd/MM/yyyy')
                                                      .format(_selectedDate!),
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
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      color: Color.fromARGB(255, 51, 126, 122),
                                    )
                                  ],
                                ).show();
                              },
                              label: FaIcon(
                                FontAwesomeIcons.penToSquare,
                                color: const Color.fromARGB(255, 187, 170, 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 0,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            ElevatedButton.icon(
                              onPressed: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  title: 'Atenção!',
                                  text: 'Deseja excluir a tarefa?',
                                  confirmBtnText: 'Sim',
                                  cancelBtnText: 'Não',
                                  confirmBtnColor:
                                      const Color.fromARGB(255, 37, 120, 131),
                                );
                              },
                              label: FaIcon(
                                FontAwesomeIcons.circleXmark,
                                color: const Color.fromARGB(255, 168, 37, 27),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
