import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/store_screen/cart_button.dart';
import 'package:swe_reler/src/screens/store_screen/search_bar.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';
import 'package:swe_reler/src/screens/store_screen/dropdown.dart';
import 'package:swe_reler/src/screens/store_screen/book.dart';

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
                      width: double.infinity, // Ocupar toda a largura da tela
                      child: Row(
                        children: [
                          Expanded(
                            child:
                                SizedBox(), // Widget vazio que ocupa todo o espaço disponível
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
                    SizedBox(height: 40),
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
                                        generoOptions, 'Selecione gênero(s)')),
                                SizedBox(height: 16),
                                Text('Autores', style: _textStyle),
                                SizedBox(height: 16),
                                SizedBox(
                                    width: 320,
                                    height: 50,
                                    child: Dropdown(
                                        autorOptions, 'Selecione autor(es)')),
                                SizedBox(height: 16),
                              ],
                            )),
                        SizedBox(width: 32),
                        SizedBox(
                            width: 2,
                            height: 500,
                            child: ColoredBox(
                                color: Color.fromARGB(101, 155, 105, 59))),
                        SizedBox(width: 32),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StoreSearchBar(),
                            Wrap(
                              spacing: 60,
                              children: [
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book(),
                                Book()
                              ],
                            )
                          ],
                        ))
                      ],
                    ))
                  ])),
        ),
      ));
}

const List<String> generoOptions = [
  'Ação',
  'Animação',
  'Comédia',
  'Fantasia',
  'Horror',
  'Romance',
  'Aventura',
  'Biografia',
  'Crime',
  'História',
  'Mistério',
  'Sci-fi'
];

const List<String> autorOptions = [
  'Machado de Assis',
  'Clarice Lispector',
  'Cecília Meirelles',
  'Carlos Drummond de Andrade',
  'José de Alencar',
  'Mario Quintana',
  'Guimarães Rosa',
  'Luis Fernando Veríssimo'
];

const _textStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF9B693B));
