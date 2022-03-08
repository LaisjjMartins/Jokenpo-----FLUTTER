import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha sua opção abaixo";

  void opcaoImagem(String escolhaSelecionada){
      var opcoes = ['pedra', 'papel', 'tesoura'];
      var numero = Random().nextInt(3);

      var escolhaApp = opcoes[numero];

      print("App: " + escolhaApp);
      print("User: " + escolhaSelecionada);


      switch ( escolhaApp ) {
        case "pedra":
          setState(() {
            _imagemApp = AssetImage("images/pedra.png");
          });
          break;
           case "papel":
          setState(() {
            _imagemApp = AssetImage("images/papel.png");
          });
          break;
           case "tesoura":
          setState(() {
            _imagemApp = AssetImage("images/tesoura.png");
          });
          break;
        default:
      }

      //validar o ganhador, os que ganha primeiro e depois oque perde
      if (
        (escolhaSelecionada == "pedra" && escolhaApp == "tesoura") || 
        (escolhaSelecionada == "tesoura" && escolhaApp == "papel") || 
        (escolhaSelecionada == "papel" && escolhaApp == "pedra"))
        {
           setState(() {
              _mensagem = "Parabens! Você ganhou!!";
           });
        }else if(
        (escolhaApp == "pedra" && escolhaSelecionada == "tesoura") || 
        (escolhaApp == "tesoura" && escolhaSelecionada == "papel") || 
        (escolhaApp == "papel" && escolhaSelecionada == "pedra")
        ){
          setState(() {
               _mensagem = "Tente de novo. Você perdeu!!";
          });
        
        }else{
 setState(() {
               _mensagem = "Empatamos, mais uma??";
          });
        }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Jokenpo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App:',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
           Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 60),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
            onTap: () => opcaoImagem('pedra'),
            child: Image.asset('images/pedra.png', height: 115),
          ),
            GestureDetector(
            onTap: () => opcaoImagem('papel'),
            child: Image.asset('images/papel.png', height: 115),
          ),
            GestureDetector(
            onTap: () => opcaoImagem('tesoura'),
            child: Image.asset('images/tesoura.png', height: 115),
          ),
            ],
          )
        ],
      ),
    );
  }
}
