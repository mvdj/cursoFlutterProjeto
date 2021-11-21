//@dart=2.9
import 'package:farmacia/app/injection.dart';
import 'package:farmacia/app/my_app.dart';
import 'package:flutter/material.dart';

  
void main() async{
  setupinjection();
  runApp(MyApp());
}

/*
AVALIAÇÃO FINAL:

No início do curso, foi aprendido desde a instalação das ferramentas até a configuração do GIT no VS Code, sendo trabalhado posteriormente, com as características das linguagem Dart (desde as variáveis, estruturas de controle, funções etc) e as particularidades do framework Flutter (State Full e Less, Rotas etc).

Foi desenvolvida inicialmente a persitência local com o banco SQLite e depois sendo trabalhada com um banco NoSQL, a partir do Firebase, no qual dá uma ampla poder de contexto.

Foi aprendido no projeto a divisão através do padrão DAO, sendo trabalhado também a gerência de estado com MobX e chamada de APP externa (como serviço de telefone, sms e email)

No tocante ao banco de NoSQL, no qual foi desenvolvido uma coleção no cloud Firestore do Firebase (google), foi mostrado que os dados são armazenados a partir de documentos.

Por fim, o curso foi bastante produtivo e significativo para o meu conhecimento como um todo sobre a produção de um projeto mobile, sendo abordados conteúdos capazes de implementar um projeto completo.
*/