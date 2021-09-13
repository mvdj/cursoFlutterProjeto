import 'package:farmacia/app/my_app.dart';
import 'package:flutter/material.dart';

class RemediosList extends StatefulWidget {
  @override
  State<RemediosList> createState() => _RemediosListState();
}

class _RemediosListState extends State<RemediosList> {
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
      body:   ListView(),
    );
  }
}