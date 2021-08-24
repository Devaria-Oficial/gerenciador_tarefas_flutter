import 'dart:convert';

import 'package:gerenciador_tarefas_flutter/Constants/Endpoints.dart';
import 'package:gerenciador_tarefas_flutter/Models/Tarefa.dart';
import 'package:gerenciador_tarefas_flutter/Models/User.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

class TarefaService {
  static final LocalStorage storage = new LocalStorage('main');

  static Future<Tarefa?> criar(Tarefa novaTarefa) async {
    Tarefa? tarefaCriada;

    var url = Uri.parse(ENDPOINT_CRIAR_TAREFA);

    var data = {
      'nome': novaTarefa.nome,
      'dataPrevistaConclusao': DateFormat('yyyy-MM-dd').format(novaTarefa.dataPrevistaConclusao)
    };

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${storage.getItem('usuarioLogado')['token']}'
    };

    var response = await http.post(url, body: jsonEncode(data), headers: headers );

    print(response.body);

    switch (response.statusCode) {
        case 201:
          final parsedBody = jsonDecode(response.body);
          tarefaCriada = Tarefa.fromJson(parsedBody);
    }

    return tarefaCriada;
  }

  static Future<List<Tarefa>> listar() async {
    List<Tarefa> tarefas = new List<Tarefa>.empty();

    var url = Uri.parse(ENDPOINT_LISTAR_TAREFA);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${storage.getItem('usuarioLogado')['token']}'
    };

    var response = await http.get(url, headers: headers );

    switch (response.statusCode) {
      case 200:
        final parsedBody = jsonDecode(response.body);
        tarefas = parsedBody.map<Tarefa>((tarefa) => Tarefa.fromJson(tarefa)).toList();
    }

    return tarefas;
  }
}