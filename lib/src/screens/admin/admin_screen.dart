import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'package:swe_reler/src/widgets/highlighted_text.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: const DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Align(
              alignment: Alignment.centerRight,
              child: DrawerMenuButton(),
            ),
            const HighlightedText('administração'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Livros'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Brindes'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('BOKS'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Usuários'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Relatórios'),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text('Cadastrar livro')),
                      Padding(
                          padding: const EdgeInsets.all(40),
                          child: Table(
                            border: const TableBorder(
                              top: BorderSide(
                                  color: Color.fromARGB(156, 77, 119, 84),
                                  width: 1),
                              bottom: BorderSide(
                                  color: Color.fromARGB(156, 77, 119, 84),
                                  width: 1),
                              left: BorderSide(
                                  color: Color.fromARGB(156, 77, 119, 84),
                                  width: 1),
                              right: BorderSide(
                                  color: Color.fromARGB(156, 77, 119, 84),
                                  width: 1),
                              horizontalInside: BorderSide(
                                  color: Color.fromARGB(156, 77, 119, 84),
                                  width: 1),
                            ),
                            children: [
                              TableRow(children: [
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("capa",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("título",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("autor",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("editora",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("ano",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("preço",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("avaliação",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("qtd",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  color: const Color.fromARGB(156, 77, 119, 84),
                                  child: const Text("   ",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ]),
                              TableRow(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          'assets/admin/lady-killers.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                      "Lady Killers: Assassinas em Série"),
                                  const Text("Tori Telfer"),
                                  const Text("Darkside"),
                                  const Text("2019"),
                                  const Text("45,99"),
                                  const Text("4,9"),
                                  const Text("3"),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/edit.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/delete.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          'assets/admin/lady-killers.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                      "Lady Killers: Assassinas em Série"),
                                  const Text("Tori Telfer"),
                                  const Text("Darkside"),
                                  const Text("2019"),
                                  const Text("45,99"),
                                  const Text("4,9"),
                                  const Text("3"),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/edit.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/delete.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          'assets/admin/lady-killers.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                      "Lady Killers: Assassinas em Série"),
                                  const Text("Tori Telfer"),
                                  const Text("Darkside"),
                                  const Text("2019"),
                                  const Text("45,99"),
                                  const Text("4,9"),
                                  const Text("3"),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/edit.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/delete.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          'assets/admin/lady-killers.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                      "Lady Killers: Assassinas em Série"),
                                  const Text("Tori Telfer"),
                                  const Text("Darkside"),
                                  const Text("2019"),
                                  const Text("45,99"),
                                  const Text("4,9"),
                                  const Text("3"),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/edit.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Image.asset(
                                                  'assets/admin/delete.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      );
}
