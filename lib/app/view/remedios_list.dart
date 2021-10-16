//@dart=2.9
import 'package:farmacia/app/database/sqlite/script.dart';
import 'package:farmacia/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RemediosList extends StatelessWidget {
  /*@override
  final lista = [
    {'nome':'Cataflan 50mg','apresentacao':'10 drágeas','imagem':'https://www.drogariaminasbrasil.com.br/media/catalog/product/7/7/772_original.jpg','preco':'34,56'},
    {'nome':'Celestamine 2mg/5ml 0,25/5ml','apresentacao':'Xarope 120ml','imagem':'https://www.drogariaminasbrasil.com.br/media/catalog/product/3/6/3630_original.jpg','preco':'54,69'},
    {'nome':'Atroveran 1g','apresentacao':'20 comprimidos','imagem':'http://farmaciaindiana.vteximg.com.br/arquivos/ids/230667/atroveran-dip-1g-com-20-comprimidos-36b.jpg?v=637401976322670000','preco':'12,36'},
    {'nome':'Buscopam Composto','apresentacao':'20 comprimidos','imagem':'https://www.drogariaminasbrasil.com.br/media/product/f2b/buscopan-composto-com-20-comprimidos-revestidos-96f.jpg','preco':'41,96'},    
  ];
*/

Future<List<Map<String, dynamic>>> _buscar() async{
String path = join(await getDatabasesPath(),"banco");
Database db = await openDatabase(
  path,
  version: 1,
  onCreate: (db, v){
    db.execute(createTable);
    db.execute(insert1);
    db.execute(insert2);
    db.execute(insert3);
    db.execute(insert4);
  });
  return db.query("remedio");

}

  @override 
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          var lista = futuro.data;          
          return Scaffold(
          appBar: AppBar (
            title: Text('Lista de Remédios'),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: (){
                  Navigator.of(context).pushNamed(MyApp.REMEDIOS_FORM);
                }
              )
            ],
          ),
          body: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, i){
              var remedio = lista[i];
              var avatar = CircleAvatar(backgroundImage: NetworkImage(remedio['imagem']),);

              return ListTile(
                leading: avatar,
                title: Text(remedio['nome']),
                subtitle: Text(remedio['preco']),            
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.edit),onPressed:null),
                      IconButton(icon: Icon(Icons.delete),onPressed:null),
                    ],
                  ), 
                ),
              );
            },             
          )
        );
        }else{
          return Scaffold();
        }
      });
    
    
    /**/
  }
}