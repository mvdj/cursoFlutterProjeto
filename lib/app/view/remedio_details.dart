//@dart=2.9
import 'package:farmacia/app/view/remedio_details_back.dart';
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:flutter/material.dart';

class RemedioDetails extends StatelessWidget {  


showModalError(BuildContext context)  {
  var alert = AlertDialog(
    title: Text('Alerta'),
    content: Text('Não foi possível encontrar um APP compatível.')
  );
  showDialog(
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );
}


  @override
  Widget build(BuildContext context) {
    var _back = RemedioDetailsBack(context);
    Remedio remedio = _back.remedio;

      return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
         var width =  constraints.biggest.width;
         var radius = width/3;
       // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(remedio.imagem).isAbsolute)?
                CircleAvatar(backgroundImage: NetworkImage(remedio.imagem),
                radius: radius
                ):
                CircleAvatar(
                  child:Icon(
                    Icons.person,
                    size: width/2),
                radius: radius
              ),
              Center(
                child: Text('${remedio.nome}',style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Apresentacao:'),
                  subtitle: Text('${remedio.apresentacao}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Data Lote:'),
                  subtitle: Text('${remedio.data_lote}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Data_Validade:'),
                  subtitle: Text('${remedio.data_validade}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Preço:'),
                  subtitle: Text('${remedio.preco}'),
                ),
              ),              
              Card(
                child: ListTile(
                  title: Text('Telefone Fornecedor:'),
                  subtitle: Text('${remedio.telefone_fornecedor}'),
                  trailing: Container(
                    width: width/4,
                    child : Row(children: [
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.message),
                        onPressed: (){
                          _back.launchSMS(showModalError);
                        }
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.phone),
                        onPressed: (){
                          _back.launchPhone(showModalError);
                        }
                      ),
                    ])
                  ),
                ),
              ),              
              Card(
                child: ListTile(
                  title: Text('Email Fornecedor:'),
                  onTap: (){
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${remedio.email_fornecedor}'),
                )
              )
          ],
        ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );

      },
    );
  }
}