import 'package:flutter/material.dart';
import 'package:swe_reler/main.dart';
import 'package:swe_reler/src/admin.dart';
import 'package:swe_reler/src/data_types.dart';
import 'package:swe_reler/src/screens/admin/table.dart';
import 'package:swe_reler/src/widgets/app_dialog.dart';
import 'package:swe_reler/src/widgets/input.dart';

class AdminGifts extends StatefulWidget {
  const AdminGifts({super.key});

  @override
  State<AdminGifts> createState() => _AdminGiftsState();
}

class _AdminGiftsState extends State<AdminGifts> {
  void _openCreateGiftDialog() async {
    await showDialog(
        context: context,
        builder: (context) => const _GiftDialog()
    );
    setState(() {});
  }

  void _openEditGiftDialog(int index) async {
    await showDialog(
        context: context,
        builder: (context) => _GiftDialog(giftToEdit: Admin.gifts[index])
    );
    setState(() {});
  }

  void _openDeleteGiftDialog(int index) async {
    await showDialog(
      context: context,
      builder: (context) => _GiftDeletionDialog(Admin.gifts[index])
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: _openCreateGiftDialog,
          child: const Text('Cadastrar brinde'),
        ),
      ),
      const SizedBox(height: 24),

      AdminTable(
        headers: const ['nome', 'marca', 'categoria', 'preço', 'qtd'],
        rows: Admin.gifts.map(_rowFromGift).toList(),
        editAction: _openEditGiftDialog,
        deleteAction: _openDeleteGiftDialog,
      ),
    ],
  );

  List<String> _rowFromGift(Gift g) => [g.title, g.brand, g.category,
    g.price.asPrice, g.amount.toString()];
}

class _GiftDialog extends StatefulWidget {
  final Gift? giftToEdit;

  const _GiftDialog({this.giftToEdit});

  @override
  State<_GiftDialog> createState() => _GiftDialogState();
}

class _GiftDialogState extends State<_GiftDialog> {
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _amountController = TextEditingController();

  bool _nameError = false;
  bool _brandError = false;
  bool _categoryError = false;
  bool _emptyPriceError = false;
  bool _invalidPriceError = false;
  bool _emptyAmountError = false;
  bool _invalidAmountError = false;

  bool get _editing => widget.giftToEdit != null;

  void submit() {
    setState(() {
      _nameError = _nameController.text.isEmpty;
      _brandError = _brandController.text.isEmpty;
      _categoryError = _categoryController.text.isEmpty;
      _emptyPriceError = _priceController.text.isEmpty;
      _emptyAmountError = _amountController.text.isEmpty;
    });

    final emptyFieldErrors = [_nameError, _brandError, _categoryError,
      _emptyPriceError, _emptyAmountError];

    if (emptyFieldErrors.any((error) => error == true)) { return; }

    late final double price;
    late final int amount;

    try { price = double.parse(_priceController.text.replaceAll(',', '.')); }
    on FormatException { setState(() => _invalidPriceError = true); }

    try { amount = int.parse(_amountController.text); }
    on FormatException { setState(() => _invalidAmountError = true); }

    if (_invalidPriceError || _invalidAmountError) { return; }

    if (_editing) {
      final gift = widget.giftToEdit!;
      gift.title = _nameController.text;
      gift.brand = _brandController.text;
      gift.category = _categoryController.text;
      gift.price = price;
      gift.amount = amount;

      Admin.editGift(gift);
    }

    else {
      final newGift = Gift(
          title: _nameController.text,
          brand: _brandController.text,
          category: _categoryController.text,
          price: price,
          amount: amount
      );

      Admin.registerGift(newGift);
    }

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (_editing) {
      final gift = widget.giftToEdit!;
      _nameController.text = gift.title;
      _brandController.text = gift.brand;
      _categoryController.text = gift.category;
      _priceController.text = gift.price.toString();
      _amountController.text = gift.amount.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppDialog(
      content: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_dialogTitle, style: textTheme.headlineSmall),
            _spacing,

            Input(
              title: 'nome',
              controller: _nameController,
              errorMessage: _nameError ? 'O nome é obrigatório' : null,
              errorDismisser: () => setState(() => _nameError = false),
            ),
            _spacing,

            Input(
              title: 'marca',
              controller: _brandController,
              errorMessage: _brandError ? 'A marca é obrigatória' : null,
              errorDismisser: () => setState(() => _brandError = false),
            ),
            _spacing,

            Input(
              title: 'categoria',
              controller: _categoryController,
              errorMessage: _categoryError ? 'A categoria é obrigatória' : null,
              errorDismisser: () => setState(() => _categoryError = false),
            ),
            _spacing,

            Input(
              title: 'preço',
              controller: _priceController,
              errorMessage: _priceErrorMessage,
              errorDismisser: () => setState(() {
                _emptyPriceError = false;
                _invalidPriceError = false;
              }),
            ),
            _spacing,

            Input(
              title: 'quantidade',
              controller: _amountController,
              errorMessage: _amountErrorMessage,
              errorDismisser: () => setState(() {
                _emptyAmountError = false;
                _invalidAmountError = false;
              }),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('cancelar'),
        ),

        ElevatedButton(
          onPressed: submit,
          child: Text(_buttonText),
        ),
      ],
    );
  }

  String get _dialogTitle => _editing ? 'editar brinde' : 'adicionar brinde';

  String get _buttonText => _editing ? 'editar': 'adicionar';

  String? get _priceErrorMessage {
    if (_emptyPriceError) { return 'O preço é obrigatório'; }
    if (_invalidPriceError) { return 'O preço digitado não é válido'; }
    return null;
  }

  String? get _amountErrorMessage {
    if (_emptyAmountError) { return 'A quantidade é obrigatória'; }
    if (_invalidAmountError) { return 'A quantidade digitada é inválida'; }
    return null;
  }

  static const _spacing = SizedBox(height: 8);
}

class _GiftDeletionDialog extends StatelessWidget {
  final Gift _gift;

  const _GiftDeletionDialog(this._gift);

  @override
  Widget build(BuildContext context) => AppDialog(
    content: Column(
      children: [
        Text(
            'deletar brinde',
            style: Theme.of(context).textTheme.headlineSmall
        ),

        Text(_dialogText),
      ],
    ),
    actions: [
      TextButton(
        onPressed: Navigator.of(context).pop,
        child: const Text('cancelar'),
      ),

      ElevatedButton(
        onPressed: () {
          Admin.deleteGift(_gift);
          Navigator.of(context).pop();
        },
        child: const Text('deletar'),
      )
    ],
  );

  String get _dialogText => 'Você tem certeza que deseja deletar o brinde '
      '"${_gift.title}"? Essa ação não pode ser revertida.';
}
