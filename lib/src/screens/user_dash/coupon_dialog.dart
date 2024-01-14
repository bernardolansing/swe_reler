import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swe_reler/src/widgets/app_dialog.dart';

class CouponDialog extends StatelessWidget {
  final String code;
  final String benefit;

  const CouponDialog({super.key, required this.code, required this.benefit});

  void _copyCodeToClipboard(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(_couponCodeCopiedSnackbar);
    Clipboard.setData(ClipboardData(text: code));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => AppDialog(
      title: 'Resgate seu cupom',
      content: Column(
        children: [
          Text(benefit),
          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16)
            ),
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(code, style: _textStyle),

                  IconButton(
                      onPressed: () => _copyCodeToClipboard(context),
                      icon: const Icon(
                          Icons.copy,
                          color: Colors.black,
                          size: 32
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Ok')
        )
      ]
  );

  static const _couponCodeCopiedSnackbar = SnackBar(
    content: Text('O código do cupom foi copiado!'),
  );

  static const _textStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
