
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gerenciador_tarefas_flutter/Components/RoundedButton.dart';
import 'package:gerenciador_tarefas_flutter/Constants/Colors.dart';
import 'package:gerenciador_tarefas_flutter/Models/Tarefa.dart';
import 'package:gerenciador_tarefas_flutter/Service/TarefaService.dart';

import 'HomeTextField.dart';

class FiltrosDialog extends StatefulWidget {
  final VoidCallback listarTarefas;

  const FiltrosDialog({
    Key? key,
    required this.listarTarefas
  }) : super(key: key);

  @override
  _FiltrosDialogState createState() => _FiltrosDialogState();
}

class _FiltrosDialogState extends State<FiltrosDialog> {
  String nomeTarefa = "";
  String dataPrevistaConclusao = "";


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Adicionar uma tarefa', style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold))
          ]
      ),
      content: ConstrainedBox(
        constraints: new BoxConstraints(
          maxHeight: 120,
          maxWidth: size.width
        ),
        child: Column(
          children: [
            HomeTextField(textHint: 'Data prevista de conclusão (inicial)', onChanged: (value) {
              setState(() {
                nomeTarefa = value;
              });
            }),
            Padding(
              padding: EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 8),
              child: HomeTextField(textHint: 'Data prevista de conclusão (final)', onChanged: (value) {
                setState(() {
                  dataPrevistaConclusao = value;
                });
              }),
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                text: 'Aplicar filtros',
                onPressed: () {

                },
                width: 120,
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0, left: 27, right: 0, top: 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancelar');
                  },
                  style: TextButton.styleFrom(
                      primary: primaryColor,
                      textStyle: TextStyle(decoration: TextDecoration.underline)
                  ),
                  child: const Text('Cancelar'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}