//@dart=2.9
import 'package:farmacia/app/domain/entities/remedio.dart';

abstract class RemedioDAO{
  save(Remedio remedio);
  remove(int id);
  Future<List <Remedio>> find();

}