//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmacia/app/domain/entities/remedio.dart';
import 'package:farmacia/app/domain/interfaces/remedio_dao.dart';

class RemedioDAOFirestore implements RemedioDAO{
CollectionReference remedioCollection;

RemedioDAOFirestore(){
  remedioCollection = FirebaseFirestore.instance.collection('remedio');
}

  @override
  Future<List<Remedio>> find() async {
    var result = await remedioCollection.get();
    return result.docs.map(
      (doc) => Remedio(
         id: doc.reference.id.toString(),
         nome: doc['nome'],
         apresentacao: doc['apresentacao'],
         data_lote: doc['data_lote'],
         data_validade: doc['data_validade'],
         imagem: doc['imagem'],
         preco: doc['preco'],
         telefone_fornecedor: doc['telefone_fornecedor'],
         email_fornecedor: doc['email_fornecedor']

      )
    );    
  }

  @override
  remove(id) {
    remedioCollection.doc(id).delete();
  }

  @override
  save(Remedio remedio) {
    remedioCollection.doc(remedio.id).set(
      {
        'nome': remedio.nome,
        'apresentacao': remedio.apresentacao,
        'data_lote': remedio.data_lote,
        'data_validade': remedio.data_validade,
        'imagem': remedio.imagem,
        'preco': remedio.preco,
        'telefone_fornecedor': remedio.telefone_fornecedor,
        'email_fornecedor': remedio.email_fornecedor


      }
    );
  }

}