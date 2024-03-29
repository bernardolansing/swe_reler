import 'package:flutter/material.dart';
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
  String search = '';

  @override
  Widget build(BuildContext context) => Scaffold(
      endDrawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pushNamed('/cart'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.white.withAlpha(76)
                        )
                    ),
                    icon: const Icon(Icons.shopping_cart_outlined, size: 36),
                  ),

                  const SizedBox(width: 20),

                  const DrawerMenuButton()
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
                            StoreSearchBar(
                              onTextChanged: (updated) =>
                                  setState(() => search = updated),
                            ),
                            BookList(
                              authorFilter: author,
                              selectedGenres: filterGenres,
                              titleFilter: search,
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
  final void Function(String) onAuthorChanged;

  const _LeftSection({
    required this.selectedGenres,
    required this.onGenresChanged,
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

class StoreSearchBar extends StatelessWidget {
  final void Function(String) onTextChanged;

  const StoreSearchBar({super.key, required this.onTextChanged});

  @override
  Widget build(BuildContext context) => TextField(
    onChanged: onTextChanged,
    decoration: const InputDecoration(
      filled: false,
      isDense: true,
      hintText: 'busque por obra ou brinde',
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder,
      suffixIcon: Icon(Icons.search, color: Color.fromARGB(255, 206, 191, 146)),
    ),
  );

  static const _inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFD6CAA7), width: 2)
  );
}

const _borderColor = Color.fromARGB(101, 155, 105, 59);
