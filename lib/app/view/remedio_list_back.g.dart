// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'remedio_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RemedioListBack on _RemedioListBack, Store {
  final _$listAtom = Atom(name: '_RemedioListBack.list');

  @override
  Future<List<Remedio>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Remedio>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_RemedioListBackActionController =
      ActionController(name: '_RemedioListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_RemedioListBackActionController.startAction(
        name: '_RemedioListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_RemedioListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
