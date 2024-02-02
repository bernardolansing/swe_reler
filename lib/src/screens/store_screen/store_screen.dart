import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/cart_button.dart';
import 'package:swe_reler/src/screens/store_screen/search_bar.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';
import 'package:swe_reler/src/screens/store_screen/book_list.dart';
import 'book.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<Genre> filterGenres = [];
  String author = '';

  @override
  Widget build(BuildContext context) => Scaffold(
      endDrawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CartButton(),
                  SizedBox(width: 20),
                  DrawerMenuButton()
                ],
              ),
              const SizedBox(height: 30),

              Expanded(child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LeftSection(
                      selectedGenres: filterGenres,
                      onGenresChanged: (updated) =>
                          setState(() => filterGenres = updated),
                      author: author,
                      onAuthorChanged: (updated) =>
                          setState(() => author = updated),
                    ),
                    const SizedBox(width: 40),

                    const VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: _borderColor
                    ),
                    const SizedBox(width: 40),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const StoreSearchBar(),
                            BookList(
                              authorFilter: author,
                              selectedGenres: filterGenres,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ]),
      )
  );
}

class _LeftSection extends StatelessWidget {
  final List<Genre> selectedGenres;
  final void Function(List<Genre>) onGenresChanged;
  final String author;
  final void Function(String) onAuthorChanged;

  const _LeftSection({
    required this.selectedGenres,
    required this.onGenresChanged,
    required this.author,
    required this.onAuthorChanged,
  });


  void switchGenre(Genre genre) {
    if (selectedGenres.contains(genre)) {
      final newList = selectedGenres.where((selected) => selected != genre)
          .toList();
      onGenresChanged(newList);
    }
    else {
      final newList = List<Genre>.from(selectedGenres)
        ..add(genre);
      onGenresChanged(newList);
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HighlightedText('loja'),
        const SizedBox(height: 24),

        const Text('Gêneros', style: _importantTextStyle),
        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: _borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _firstHalfOfGenres.map(_buildCheckbox).toList(),
                ),
              ),

              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _secondHalfOfGenres.map(_buildCheckbox).toList(),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),

        const Text('Autores', style: _importantTextStyle),
        const SizedBox(height: 8),

        TextField(
          onChanged: onAuthorChanged,
          decoration: const InputDecoration(hintText: 'Filtre por autor'),
        )
      ],
    ),
  );

  List<Genre> get _firstHalfOfGenres => Genre.values
      .sublist(0, (Genre.values.length / 2).ceil());

  List<Genre> get _secondHalfOfGenres => Genre.values
      .sublist((Genre.values.length / 2).ceil());

  Widget _buildCheckbox(Genre genre) => CheckboxListTile(
    value: selectedGenres.contains(genre),
    title: Text(genre.title),
    onChanged: (checked) => switchGenre(genre),
    dense: true,
    visualDensity: VisualDensity.compact,
    controlAffinity: ListTileControlAffinity.leading,
  );

  static const _importantTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF9B693B)
  );
}

const _borderColor = Color.fromARGB(101, 155, 105, 59);
