//@dart=2.9
import 'package:farmacia/app/view/remedio_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RemedioForm extends StatelessWidget {
//  const RemedioForm({ Key? key }) : super(key: key);
final _form =  GlobalKey<FormState>();

//field nome
Widget fieldNome(RemedioFormBack back){
  return TextFormField(
    validator: back.validateNome,
    onSaved: (newValue) => back.remedio.nome = newValue,
    initialValue: back.remedio.nome,
    decoration: InputDecoration(
      labelText: 'Nome do Remédio:'
    )
  );
}

//field apresentação
Widget fieldApresentacao(RemedioFormBack back){
  return TextFormField(        
    onSaved: (newValue) => back.remedio.apresentacao = newValue,
    initialValue: back.remedio.apresentacao,
    decoration: InputDecoration(
      labelText: 'Apresentação:'
    )
  );
}

//field Imagem
Widget fieldImagem(RemedioFormBack back){
  return TextFormField(    
    onSaved: (newValue) => back.remedio.imagem= newValue,
    initialValue: back.remedio.imagem,
    decoration: InputDecoration(
      labelText: 'Endereço (URL) da Foto:',
      hintText: 'http://www.site.com'
    )
  );
}

//field data do lote
Widget fieldDataLote(RemedioFormBack back){
  var mask = MaskTextInputFormatter(mask: '##/##/####');
  return TextFormField(
    validator: back.validateDataLote,
    onSaved: (newValue) => back.remedio.data_lote= newValue,
    initialValue: back.remedio.data_lote,
    inputFormatters: [mask],
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Data do Lote:',
      hintText: 'dd/mm/aaaa'

    )
  );
}

//field data de validade
Widget fieldDataValidade(RemedioFormBack back){
  var mask = MaskTextInputFormatter(mask: '##/##/####');
  return TextFormField(
    validator: back.validateDataVencimento,
    onSaved: (newValue) => back.remedio.data_validade = newValue,
    initialValue: back.remedio.data_validade,
    inputFormatters: [mask],
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Data de Validade:',
      hintText: 'dd/mm/aaaa'
    )
  );
}

//field preço
Widget fieldPreco(RemedioFormBack back){
  return TextFormField(    
    onSaved: (newValue) => back.remedio.preco = newValue,
    initialValue: (back.remedio.preco).toString(),    
    keyboardType: TextInputType.number,
    decoration: InputDecoration(      
      labelText: 'Preço em R\$:'
    )
  );
}

//field Telefone Fornecedor
Widget fieldTelefoneFornecedor(RemedioFormBack back){
  return TextFormField(    
    onSaved: (newValue) => back.remedio.telefone_fornecedor= newValue,
    initialValue: (back.remedio.telefone_fornecedor).toString(),    
    keyboardType: TextInputType.number,
    decoration: InputDecoration(      
      labelText: 'Telefone Fornecedor:'
    )
  );
}

//field preço
Widget fieldEmailFornecedor(RemedioFormBack back){
  return TextFormField(    
    onSaved: (newValue) => back.remedio.email_fornecedor = newValue,
    initialValue: (back.remedio.email_fornecedor).toString(),        
    decoration: InputDecoration(      
      labelText: 'Email Fornecedor:',
      hintText: 'email@email.com.br'
    )
  );
}

    @override
  Widget build(BuildContext context) {
    var _back = RemedioFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Remédio: '),
        actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid){
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldNome(_back),
              fieldApresentacao(_back),
              fieldImagem(_back),
              fieldDataLote(_back),
              fieldDataValidade(_back),
              fieldPreco(_back),
              fieldTelefoneFornecedor(_back),
              fieldEmailFornecedor(_back)
            ]
          )
        )
      ),      
    );
  }
}