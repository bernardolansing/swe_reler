import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';
import 'package:swe_reler/src/widgets/app_dialog.dart';

class BookList extends StatelessWidget {
  final List<Genre> selectedGenres;
  final String authorFilter;
  
  const BookList({
    super.key,
    required this.selectedGenres,
    required this.authorFilter
  });
  
  bool _bookMatchesFilter(Book book) {
    if (authorFilter.isNotEmpty) {
      final authorMatches = book.author.toLowerCase()
          .contains(authorFilter.toLowerCase());
      if (! authorMatches) { return false; }
    }
    
    return selectedGenres.every((genre) => book.genres.contains(genre));
  }

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 40,
    children: bookCardList
        .where(_bookMatchesFilter)
        .map((book) => BookCard(book))
        .toList(growable: false),
  );
}

class BookCard extends StatefulWidget {
  final Book book;

  const BookCard(this.book, {super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => showDialog(
        context: context,
        builder: (context) => _BookDialog(widget.book)
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 120),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Image(image: AssetImage(widget.book.picture)),
            const SizedBox(height: 7),
            Text(widget.book.title, style: _titleTextStyle),
            const SizedBox(height: 7),
            Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 20, color: Color(0xFF718E76)),
                  Text(widget.book.evaluation, style: _bookDetailsTextStyle),
                  const SizedBox(width: 10),
                  Text('R\$${widget.book.price}', style: _bookDetailsTextStyle)
                ]
            ),
          ],
        ),
      ),
    ),
  );

  static const _titleTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF9B693B)
  );

  static const _bookDetailsTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
      color: Colors.black
  );
}

class _BookDialog extends StatelessWidget {
  final Book _book;

  const _BookDialog(this._book);

  @override
  Widget build(BuildContext context) => AppDialog(
    content: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 700),
      child: Column(
        children: [
          Image(
            image: AssetImage(_book.picture),
            width: 250,
            height: 400,
          ),

          _summary,
          const Divider(),

          Text(_book.resume, textAlign: TextAlign.justify),
          const Divider(),

          _purchaseInfo,
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: Navigator.of(context).pop,
        child: const Text('Fechar'),
      ),

      ElevatedButton(
        onPressed: () {},
        child: const Text('Adicionar ao carrinho'),
      ),
    ],
  );

  Widget get _summary => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const Text('Título: ', style: _highlightedTextStyle),
          Text(_book.title)
        ],
      ),

      Row(
        children: [
          const Text('Autor: ', style: _highlightedTextStyle),
          Text(_book.author)
        ],
      ),

      Row(
        children: [
          const Text('Gênero: ', style: _highlightedTextStyle),
          Text(_book.genres.map((g) => g.title).join(', '))
        ],
      ),
    ],
  );

  Widget get _purchaseInfo => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const Text('Exemplares disponíveis: ', style: _highlightedTextStyle),
          Text(_book.quantity.toString())
        ],
      ),

      Row(
        children: [
          const Icon(Icons.star, size: 30, color: Color(0xFF718E76)),
          Text('${_book.evaluation} - R\$ ${_book.price}')
        ],
      )
    ],
  );

  static const _highlightedTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF9B693B)
  );
}
