import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  Map<String, dynamic> rows;
  MyTable({super.key, required this.rows});
  @override
  Widget build(BuildContext context) {
    List<DataColumn> tableHeaders = [];
    List<DataRow> tableRows = [];

    rows.forEach((key, row) {
      switch (key) {
        case 'headers':
          {
            for (var i in row) {
              print('============i in row ${i}');
              tableHeaders.add(DataColumn(label: Text(i.toString())));
            }
          }
        case 'rows':
          {
            for (var r in row) {
              List<DataCell> tableRow = [];
              for (var item in r) {
                tableRow.add(DataCell(Text(item.toString())));
              }
              tableRows.add(DataRow(cells: tableRow));
            }
          }
      }
    });

    return DataTable(columns: tableHeaders, rows: tableRows);
  }
}
