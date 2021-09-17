//@dart=2.9
//import 'package:farmacia/app/my_app.dart';
//import 'package:flutter/material.dart';

/*
void main() {
  runApp(const MyApp());
}
*/

/* ATIVIDADE
(1) três exemplos de funções assíncronas e um texto explicativo do que é future, await e async 
e para que serve a programação assíncrona; e (2) a definição do script do BD (está no arquivo script.dart)


A classe "Future" funciona como algo (como exemplo: um método) poderá ser executado no futuro determinado por um tempo.
Já a palavra reservada "async" determina que terá uma função dentro do contexto que se encontra um método futuro sinalizado 
com outra palavra reservada denominada "await" na qual irá esperar este método executar por completo para poder seguir 
na execução dos comandos posteriores.

Enquanto que a programação sequencial sincronizada tem a necessidade de aguardar TODOS os comandos 
serem executados na sequência (desperdiçando tempo e recursos computacionais) parando o programa até que 
seja executados todos, na programação assíncrona pode ser executados comandos posteriores, independentemente do 
tempo a ser esperado dos comandos anteriores, ocasionando uma dinâmica mais interessante para diversos contextos.*/


void main() async{
  print("Carregando tela, logotipo e descrições...");
  tela();
  logotipos();
  await descricoesRemedios();
}

Future tela(){
  return Future.delayed(Duration(seconds: 5),() => print("Tela carregada!"));
}

Future logotipos(){
  return Future.delayed(Duration(seconds: 5),() => print("Logotipos carregados!"));
}

Future descricoesRemedios(){
  return Future.delayed(Duration(seconds: 5),() => print("Busca no BD das descrições realizadas."));
}


