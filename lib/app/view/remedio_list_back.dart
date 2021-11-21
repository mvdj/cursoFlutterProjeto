//@dart=2.9
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:farmacia/app/domain/services/remedio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:farmacia/app/my_app.dart';

part 'remedio_list_back.g.dart';

class RemedioListBack = _RemedioListBack with _$RemedioListBack;

abstract class _RemedioListBack with Store{
  var _service = GetIt.I.get<RemedioService>();


//lista de remedios
@observable
  Future<List<Remedio>>list;  

//método para atualizar a lista de remédios
@action
refreshList([dynamic value]){
  list = _service.find();
}

_RemedioListBack(){
  refreshList();
}

//método para chamar o form para salvar/alterar
goToForm(BuildContext context, [Remedio remedio]){
  Navigator.of(context).pushNamed(MyApp.REMEDIOS_FORM, arguments: remedio).then(refreshList());
}

goToDetails(BuildContext context, Remedio remedio){
  Navigator.of(context).pushNamed(MyApp.REMEDIOS_DETAILS, arguments: remedio);
  }

//excluir

remove(dynamic id){
  _service.remove(id);
  refreshList();
}


}