import 'package:flutter/material.dart';
import 'package:swe_reler/main.dart';
import 'package:swe_reler/src/data_types.dart';
import 'package:swe_reler/src/screens/admin/table.dart';

class AdminGifts extends StatelessWidget {
  const AdminGifts({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Cadastrar brinde'),
        ),
      ),
      const SizedBox(height: 24),

      AdminTable(
        headers: const ['nome', 'marca', 'categoria', 'preço', 'qtd'],
        rows: _mockGifts.map(_rowFromGift).toList(),
        editAction: (index) {},
        deleteAction: (index) {},
      ),
    ],
  );

  List<String> _rowFromGift(Gift g) => [g.title, g.brand, g.category,
    g.price.asPrice, g.amount.toString()];
}

const _mockGifts = [
  Gift(
      title: 'Pincel marca-texto mini',
      brand: 'Oval',
      category: 'papelaria',
      price: 21.90,
      amount: 15
  ),
  Gift(
      title: 'Pincel marca-texto mini',
      brand: 'Oval',
      category: 'papelaria',
      price: 21.90,
      amount: 15
  ),
  Gift(
      title: 'Pincel marca-texto mini',
      brand: 'Oval',
      category: 'papelaria',
      price: 21.90,
      amount: 15
  ),
];
