import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/cart_button.dart';
import 'package:swe_reler/src/screens/store_screen/search_bar.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';
import 'package:swe_reler/src/screens/store_screen/drop_down.dart';
import 'package:swe_reler/src/screens/store_screen/book_list.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
      endDrawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
              padding: EdgeInsets.only(top: 40, right: 40, left: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child:
                            SizedBox(),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Row(children: [
                                CartButton(),
                                SizedBox(width: 20),
                                DrawerMenuButton()
                              ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    HighlightedText('loja'),
                    SizedBox(height: 16),
                    Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 320,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Gêneros', style: _textStyle),
                                    SizedBox(height: 16),
                                    SizedBox(
                                        width: 320,
                                        height: 50,
                                        child: Dropdown(
                                            hint: 'Selecione gênero(s)',
                                            options: _genreOptions)),
                                    SizedBox(height: 16),
                                    Text('Autores', style: _textStyle),
                                    SizedBox(height: 16),
                                    SizedBox(
                                        width: 320,
                                        height: 50,
                                        child: Dropdown(
                                            options: _authorOptions,
                                            hint: 'Selecione autor(es)')),
                                    SizedBox(height: 16),
                                  ],
                                )),
                            SizedBox(width: 32),
                            Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: SizedBox(
                                    width: 2,
                                    height: double.infinity,
                                    child: ColoredBox(
                                        color: Color.fromARGB(101, 155, 105, 59)))),
                            SizedBox(width: 32),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [StoreSearchBar(), BookList()],
                                ))
                          ],
                        ))
                  ])),
        ),
      ));
}

const List<String> _genreOptions = [
  'Ação',
  'Comédia',
  'Fantasia',
  'Horror',
  'Romance',
  'Aventura',
  'Biografia',
  'Crime',
  'História',
  'Mistério',
  'Suspense',
  'Sci-fi',
  'Infantil'
];

const List<String> _authorOptions = [
  'Machado de Assis',
  'Clarice Lispector',
  'William P. Young',
  'Jeff Kiney',
  'Stephen King',
  'George R. R. Martin',
  'Charlie Donlea',
  'J. R. R. Tolkien',
  'C. J. Tudor',
  'Suzanne Collins',
  'Antoine de Saint-Exupéry',
  'Ann Rule',
  'Yuval Noah Harari',
  'David Bodanis',
  'Christopher Nolan',
  'J. K. Rowling',
];

const _textStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B)
);
