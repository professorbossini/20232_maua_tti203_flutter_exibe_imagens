import 'package:exibe_imagens/src/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'widgets/image_list.dart';

class App extends StatefulWidget {
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 0;
  List<ImageModel> imagens = [];

  void obterImagem() async {
    // uniform resource identifier
    // mailto:meuemail@email.com
    // tel:919191919
    // www.google.com.br
    final url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {'query': 'people', 'page': '1', 'per_page': '1'},
    );
    final req = http.Request('get', url);
    req.headers.addAll({
      'Authorization':
          '563492ad6f91700001000001e00b21ab6afb45a18c1d44a759556f14'
    });
    // IO-Bound
    // Future
    //inferno de callbacks
    // hadouken
    // async/await
    // StreamedResponse
    final result = await req.send();
    // converter de StreamedResponse para Response
    final response = await http.Response.fromStream(result);
    final decodedJSON = json.decode(response.body);
    final imagem = ImageModel.fromJSON(decodedJSON);
    setState(() {
      imagens.add(imagem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(imagens),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_a_photo), onPressed: obterImagem),
        appBar: AppBar(
          title: const Text('Minhas imagens'),
        ),
      ),
    );
  }
}
