import 'package:flutter/material.dart';
//importando pacote do flutter
import 'dart:math';
//importando pacote para gerar numeros aleatorios

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

//classe para o estado do jogo
class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  //variavel para armazenar a imagem do app
  var _mensagem = "Escolha uma opção abaixo:";
  //variavel para armazenar a mensagem do app

  final Map<String, AssetImage> _opcaoMensagem = {
    "pedra": AssetImage("imagens/pedra.png"),
    "papel": AssetImage("imagens/papel.png"),
    "tesoura": AssetImage("imagens/tesoura.png"),
    //mapeando as opções do app
  };
  //função chamada quando uma opção é selecionada
  void _opcaoSelecionada(String _escolhaUsuario) {
    final _opcoes = ["pedra", "papel", "tesoura"]; //lista de opções
    var _numero = Random().nextInt(3); //gera um numero de 0 a 2
    var _escolhaApp = _opcoes[_numero]; //escolhe uma opção aleatoria

    setState(() {
      this._imagemApp = _opcaoMensagem[_escolhaApp]!;
    });

    //validando o ganhador
    if ((_escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
        (_escolhaUsuario == "tesoura" && _escolhaApp == "papel") ||
        (_escolhaUsuario == "papel" && _escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns! Você ganhou :)";
      });
    } else if ((_escolhaUsuario == "tesoura" && _escolhaApp == "pedra") ||
        (_escolhaUsuario == "papel" && _escolhaApp == "tesoura") ||
        (_escolhaUsuario == "pedra" && _escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //montando a estrutura do app
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp), //Imagem escolhida pelo app
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "imagens/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "imagens/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "imagens/tesoura.png",
                  height: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
