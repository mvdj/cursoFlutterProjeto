
import 'package:farmacia/app/database/sqlite/dao/remedio_dao_impl.dart';
import 'package:farmacia/app/domain/interfaces/remedio_dao.dart';
import 'package:farmacia/app/domain/services/remedio_service.dart';
import 'package:get_it/get_it.dart';

setupinjection(){
  GetIt getit = GetIt.I;
  getit.registerSingleton<RemedioDAO>(RemedioDAOImpl());
  getit.registerSingleton<RemedioService>(RemedioService());
}