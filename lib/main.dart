//@dart=2.9
import 'package:farmacia/app/injection.dart';
import 'package:farmacia/app/my_app.dart';
import 'package:flutter/material.dart';
  
void main() {
  setupinjection();
  runApp(const MyApp());
}


/* ATIVIDADE  

Envie o link do GitHub do projeto com o commit intitulada como "camada de domínio" que possua: 
(1) injeção de dependência;  OK
(2) camada de domínio; OK
(3) um texto explicativo do objetivo da injeção de dependência e da camada de domínio.

A injeção de dependẽncia foi desenvolvida, com o padrão de projeto Singleton para ficar independente do DAO, 
sendo executado apenas uma vez por requisição, otimizando o tempo de resposta.

setupinjection(){
  GetIt getit = GetIt.I;
  getit.registerSingleton<RemedioDAO>(RemedioDAOImpl());
}

A camada de domínio foi desenvolvida com as entidades (Remedio), as exceções,  interfaces e services, 
sendo independente do DAO.


*/