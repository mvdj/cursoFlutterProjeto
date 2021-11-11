//@dart=2.9
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:farmacia/app/domain/services/remedio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class RemedioFormBack{

Remedio remedio;
var _service = GetIt.I.get<RemedioService>();
bool _nomeIsValid;
bool _dataLoteIsValid;
bool _dataValidadeIsValid;


bool get isValid => _nomeIsValid && _dataLoteIsValid && _dataValidadeIsValid;

// diferenciar novo com alteração 
RemedioFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    remedio = (parameter == null) ? Remedio() : parameter;
  }



//salvar
save() async {
  await  _service.save(remedio);
}

//validações

String validateNome(String nome){
  try {
    _service.validateNome(nome);
    _nomeIsValid = true;
    return null;
  } catch (e) {
    _nomeIsValid = false;
    return e.toString();
  }
}

String validateDataLote(String dataLote){
  try {
    _service.validateDataLote(dataLote);
    _dataLoteIsValid = true;
    return null;
  } catch (e) {
    _dataLoteIsValid = false;
    return e.toString();
  }
}


String validateDataVencimento(String dataVencimento){
  try {
    _service.validateDataValidade(dataVencimento);
    _dataValidadeIsValid = true;
    return null;
  } catch (e) {
    _dataValidadeIsValid = false;
    return e.toString();
  }
}


}