//@dart=2.9
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:farmacia/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:farmacia/app/view/remedio_list_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class RemediosList extends StatelessWidget {
  /*@override
  final lista = [
    {'nome':'Cataflan 50mg','apresentacao':'10 drágeas','imagem':'https://www.drogariaminasbrasil.com.br/media/catalog/product/7/7/772_original.jpg','preco':'34,56'},
    {'nome':'Celestamine 2mg/5ml 0,25/5ml','apresentacao':'Xarope 120ml','imagem':'https://www.drogariaminasbrasil.com.br/media/catalog/product/3/6/3630_original.jpg','preco':'54,69'},
    {'nome':'Atroveran 1g','apresentacao':'20 comprimidos','imagem':'http://farmaciaindiana.vteximg.com.br/arquivos/ids/230667/atroveran-dip-1g-com-20-comprimidos-36b.jpg?v=637401976322670000','preco':'12,36'},
    {'nome':'Buscopam Composto','apresentacao':'20 comprimidos','imagem':'https://www.drogariaminasbrasil.com.br/media/product/f2b/buscopan-composto-com-20-comprimidos-revestidos-96f.jpg','preco':'41,96'},    
  ];
*/
final _back = RemedioListBack();

CircleAvatar circleAvatar(String url){
  try{
    return CircleAvatar(backgroundImage: NetworkImage(url));
  }catch(e){
    return CircleAvatar(child: Icon(Icons.person));
  }

}

Widget iconEditButton(Function onPressed){
  return IconButton(icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
}

Widget iconRemoveButton(BuildContext context, Function remove){
  return IconButton(
    icon: Icon(Icons.delete), 
    color: Colors.red, 
    onPressed: (){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text('Excluir'),
          content: Text('Confirma a exclusão? '),
          actions: [
            FlatButton(
              child: Text('Não'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Sim'),
              onPressed: remove,
            ),
          ],
        )
      );
    }
  );
  }

  @override 
  Widget build(BuildContext context) {
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
          body: Observer(builder:(context){
            return FutureBuilder(
      future: _back.list,
      builder: (context, futuro){
        if(!futuro.hasData){
          return CircularProgressIndicator();
        }else{
          List<Remedio> lista = futuro.data;          
          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, i){
              var remedio = lista[i];              
              return ListTile(
                leading: circleAvatar(remedio.imagem),
                title: Text(remedio.nome),
                subtitle: Text(remedio.apresentacao),            
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      iconEditButton((){
                          _back.goToForm(context, remedio);
                      }),
                      iconRemoveButton(context, (){
                        _back.remove(remedio.id);
                        Navigator.of(context).pop();
                      }),
                    ],
                  ), 
                ),
              );
            },             
          );
        }
      });            
      })
    );        
  
  }
}