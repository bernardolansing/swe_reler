import 'package:flutter/material.dart';

class AdminBooks extends StatelessWidget {
  const AdminBooks({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      ElevatedButton(
          onPressed: () {},
          child: const Text('Cadastrar livro')
      ),

      const SizedBox(height: 24),

      Table(
        border: const TableBorder(
          top: _tableBorder,
          bottom: _tableBorder,
          left: _tableBorder,
          right: _tableBorder,
          horizontalInside: _tableBorder,
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
      )
    ],
  );

  static const _tableBorder = BorderSide(
      color: Color.fromARGB(156, 77, 119, 84),
      width: 1
  );
}
