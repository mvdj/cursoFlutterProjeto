//@dart=2.9
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class RemedioDetailsBack{
  BuildContext context;
  Remedio remedio;

  RemedioDetailsBack(this.context){
    remedio = ModalRoute.of(context).settings.arguments;
  }
  
  goToBack(){
  Navigator.of(context).pop();
  }


_launchApp(String url, Function(BuildContext context) showModalError)async{
  await canLaunch(url) ? await launch(url): showModalError(context);
}

launchPhone(Function(BuildContext context) showModalError){
  _launchApp('tel:${remedio.telefone_fornecedor}',showModalError);
}

launchSMS(Function(BuildContext context) showModalError){
  _launchApp('sms:${remedio.telefone_fornecedor}',showModalError);
}

launchEmail(Function(BuildContext context) showModalError){
  _launchApp('mailto:${remedio.email_fornecedor}',showModalError);
}




/*
showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('Alerta'),
        content: Text('Não foi possível encontrar um APP compatível.'),
      );
    }
  );
*/



}