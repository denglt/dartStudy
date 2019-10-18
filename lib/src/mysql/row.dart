import 'package:collection/collection.dart';

class Row extends DelegatingList<dynamic> {
  final Map<String, int> _fieldIndex;

  Row(List inner, this._fieldIndex) : super(inner);

  T byName<T>(String name) {
    int i = _fieldIndex[name];
    if (i == null) throw Exception("Field named $name not found in this row!");
    return this[i];
  }
}

main(){
  List<dynamic> rowData = ['denglt',17];
  print(rowData);

  Row row = Row(rowData, {'name':0,'age':1});
  print('${row[0]}');
  print('${row.byName('name')}');
  print('${row.name}');
}