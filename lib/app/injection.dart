//@dart=2.9
import 'package:farmacia/app/database/firestore/remedio_dao_firestore.dart';
import 'package:farmacia/app/domain/interfaces/remedio_dao.dart';
import 'package:farmacia/app/domain/services/remedio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';


setupinjection() async{
  GetIt getit = GetIt.I;


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getit.registerSingleton<RemedioDAO>(RemedioDAOFirestore());
  getit.registerSingleton<RemedioService>(RemedioService());
}