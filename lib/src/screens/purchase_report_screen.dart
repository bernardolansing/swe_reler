import 'package:flutter/material.dart';
import 'package:swe_reler/main.dart';
import 'package:swe_reler/src/data_types.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import '../user.dart';

class PurchaseReportScreen extends StatelessWidget {
  const PurchaseReportScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    endDrawer: const DrawerMenu(),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0x4CFFFFFF))
            ),
          ),

          SizedBox(
            width: 650,
            child: Column(
              children: AppUser.purchases
                  .map((purchase) => _PurchaseCard(purchase))
                  .toList(),
            ),
          ),

          const DrawerMenuButton(),
        ],
      ),
    ),
  );
}

class _PurchaseCard extends StatelessWidget {
  final Purchase _purchase;

  const _PurchaseCard(this._purchase);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_purchase.id, style: textTheme.headlineLarge),
            Text(formattedDate),
            const SizedBox(height: 16),

            ..._purchase.books.map((book) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\u2022 ${book.title}', style: textTheme.bodyLarge),

                Row(
                  children: [
                    const SizedBox(width: 24),
                    Text('valor unitário: ${book.unitPrice.asPrice}'),
                  ],
                )
              ],
            )),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                  _purchase.totalPrice.asPrice,
                  style: textTheme.headlineLarge
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get formattedDate {
    final date = _purchase.date;
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }
}
