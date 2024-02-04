import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/admin/table.dart';

class AdminBooks extends StatelessWidget {
  const AdminBooks({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // We put the button inside a Row in order to keep it from stretching
      // along with the table.
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: const Text('Cadastrar livro')
          ),
        ],
      ),

      const SizedBox(height: 24),

      AdminTable(
        headers: const ['título', 'autor', 'editora', 'ano', 'preço',
          'avaliação', 'qtd'],
        rows: List.generate(5, (index) => [
          'Lady Killers: Assassinas em Série',
          'Tori Telfer',
          'Darkside',
          '2019',
          '45,99',
          '4,9',
          '3'
        ]),
        editAction: (index) {},
        deleteAction: (index) {},
      ),
    ],
  );
}
