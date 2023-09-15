import 'package:exibe_imagens/src/models/image_model.dart';
import 'package:exibe_imagens/src/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class App extends StatefulWidget {
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 1;
  List<ImageModel> imagens = [];

  void obterImagem() async {
    //construir a url
    // uniform resource identifier
    // mailto:email@email.com
    // tel:1996655444
    // www.google.com.br
    final url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {'query': 'people', 'page': '$numeroImagens', 'per_page': '1'},
    );
    final req = http.Request('get', url);
    req.headers.addAll({
      'Authorization':
          '563492ad6f91700001000001e00b21ab6afb45a18c1d44a759556f14',
    });
    // IO-Bound (input output)
    // CPU-Bound
    // inferno de callbacks
    //hadouken
    // async/await
    final result = await req.send();
    final response = await http.Response.fromStream(result);
    print(response.body);
    // converter de json para mapa para objeto de modelo
    final decodedJSON = json.decode(response.body);
    final imagem = ImageModel.fromJSON(decodedJSON);
    setState(() {
      numeroImagens++;
      imagens.add(imagem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(imagens),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_a_photo),
          onPressed: obterImagem,
        ),
        appBar: AppBar(
          title: const Text('Minhas imagens'),
        ),
      ),
    );
  }
}
