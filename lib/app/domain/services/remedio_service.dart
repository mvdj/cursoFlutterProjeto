//@dart=2.9
import 'package:farmacia/app/database/sqlite/dao/remedio_dao_impl.dart';
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:farmacia/app/domain/exception/domain_layer_exception.dart';
import 'package:farmacia/app/domain/interfaces/remedio_dao.dart';
import 'package:get_it/get_it.dart';

class RemedioService{
 
  var _dao = GetIt.I.get<RemedioDAO>();

  save(Remedio remedio){
    validateNome(remedio.nome);
    validateDataLote(remedio.data_lote);
    validateDataValidade(remedio.data_validade);
    _dao.save(remedio);
  }

  remove(dynamic id){
    _dao.remove(id);
  }


  Future<List<Remedio>>find(){
    return _dao.find();

  }

// Regra de negógio --> nome = seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50 
  validateNome(String nome){
    var min = 3;
    var max =  50;

    if (nome==null){
      throw new DomainLayerException("O nome é obrigatório!");
    }else if(nome.length<min){
      throw new DomainLayerException("O nome deve possuir pelo menos $min caracteres");
    }else if (nome.length>max){
      throw new DomainLayerException("O nome deve possuir no máximo $max caracteres");
    }
  }

  //Regra de negócio data_lote--> seja obrigatório e tenha o formato dd/mm/aaaa
validateDataLote(String data_lote){
  var formato = RegExp(r'^[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/20[0-9]{2}$');
  if (data_lote == null){
    throw new DomainLayerException("A data do lote é obrigatório!");    
  }else if (!formato.hasMatch(data_lote)){
    throw new DomainLayerException("Formato Inválido! O formato deve ser dd/mm/aaaa");    
  }

}


  //Regra de negócio data_validade--> seja obrigatório e tenha o formato dd/mm/aaaa
validateDataValidade(String data_validade){
  var formato = RegExp(r'^[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/20[0-9]{2}$');
  if (data_validade == null){
    throw new DomainLayerException("A data da validade é obrigatório!");    
  }else if (!formato.hasMatch(data_validade)){
    throw new DomainLayerException("Formato Inválido! O formato deve ser dd/mm/aaaa");    
  }

}



}