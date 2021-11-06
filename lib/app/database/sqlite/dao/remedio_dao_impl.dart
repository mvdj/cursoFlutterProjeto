
//@dart=2.9
import 'package:farmacia/app/database/sqlite/connection.dart';
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:farmacia/app/domain/interfaces/remedio_dao.dart';
import 'package:sqflite/sqflite.dart';

class RemedioDAOImpl implements RemedioDAO{
  Database _db;

  @override
  Future<List<Remedio>> find() async{
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('remedio');
    
    List<Remedio> lista = List.generate(resultado.length, (i){
      var linha = resultado[i];
      return Remedio(
        id: linha['id'], 
        nome: linha['nome'], 
        apresentacao: linha['apresentacao'],
        imagem: linha['imagem'],
        data_lote: linha['data_lote'],
        data_validade: linha['data_validade'],
        preco: linha['preco']
      );
    }
    );
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = "DELETE FROM remedio WHERE id = ?";
    _db.rawDelete(sql,[id]);


  }

  @override
  save(Remedio remedio) async {
    _db = await Connection.get();
    var sql;
    if (remedio.id==null){
      sql = "INSERT INTO remedio (nome, apresentacao, imagem, data_lote, data_validade, preco) VALUES (?,?,?,?,?,?) ";
      _db.rawInsert(sql,[remedio.nome,remedio.apresentacao,remedio.imagem,remedio.data_lote,remedio.data_validade,remedio.preco]);
    }else{
      sql = "UPDATE remedio SET nome = ?, apresentacao=?, imagem=?, data_lote=?, data_validade=?, preco=? WHERE id = ?";
      _db.rawUpdate(sql,[remedio.nome,remedio.apresentacao,remedio.imagem,remedio.data_lote,remedio.data_validade,remedio.preco,remedio.id]);


    }


  }

}