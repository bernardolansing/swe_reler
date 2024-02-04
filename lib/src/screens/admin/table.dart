import 'package:flutter/material.dart';

class AdminTable extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final void Function(int)? editAction;
  final void Function(int)? deleteAction;

  const AdminTable({
    super.key,
    required this.headers,
    required this.rows,
    this.editAction,
    this.deleteAction,
  });

  @override
  Widget build(BuildContext context) => DataTable(
    columns: _tableHeaders,
    rows: _tableRows,
    border: const TableBorder(
      top: _tableBorder,
      bottom: _tableBorder,
      left: _tableBorder,
      right: _tableBorder,
      horizontalInside: _tableBorder,
    ),
    headingRowHeight: 28,
    headingTextStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white
    ),
    headingRowColor: const MaterialStatePropertyAll(_mainColor),
  );

  List<DataColumn> get _tableHeaders {
    final headers = List.from(this.headers);
    if (editAction != null) { headers.add(''); }
    if (deleteAction != null) { headers.add(''); }
    return headers.map((h) => DataColumn(label: Text(h))).toList();
  }

  List<DataRow> get _tableRows {
    final rows = this.rows.map(_buildTableRow).toList();
    const buttonColor = Color(0xFF9B693B);

    if (editAction != null) {
      for (final row in rows) {
        row.cells.add(DataCell(IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit, color: buttonColor),
        )));
      }
    }

    if (deleteAction != null) {
      for (final row in rows) {
        row.cells.add(DataCell(IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete, color: buttonColor),
        )));
      }
    }

    return rows;
  }

  DataRow _buildTableRow(List<String> row) => DataRow(
      cells: row.map((cell) => DataCell(Text(cell))).toList()
  );

  static const _mainColor = Color.fromARGB(156, 77, 119, 84);

  static const _tableBorder = BorderSide(color: _mainColor, width: 1);
}
