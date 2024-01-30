class Book {
  final String title;
  final String author;
  final String genre;
  final String picture;
  final String price;
  final String evaluation;
  final int quantity;

  Book(
      {required this.title,
      required this.author,
      required this.genre,
      required this.picture,
      required this.price,
      required this.evaluation,
      required this.quantity});
}

List<Book> bookCardList = [
  Book(
      title: 'Água viva',
      author: '',
      genre: '',
      picture: '/books/agua-viva.jpg',
      price: 'R\$49.99',
      evaluation: '4.0',
      quantity: 5),
  Book(
      title: 'A cabana',
      author: '',
      genre: '',
      picture: '/books/cabana.jpg',
      price: 'R\$45.99',
      evaluation: '4.5',
      quantity: 5),
  Book(
      title: 'Diário de um banana',
      author: '',
      genre: '',
      picture: '/books/diario-banana.jpg',
      price: 'R\$20.00',
      evaluation: '3.7',
      quantity: 5),
  Book(
      title: 'Dom Casmurro',
      author: '',
      genre: '',
      picture: '/books/dom-casmurro.jpg',
      price: 'R\$60.00',
      evaluation: '4.1',
      quantity: 5),
  Book(
      title: 'Doutor Sono',
      author: '',
      genre: '',
      picture: '/books/doutor-sono.jpg',
      price: 'R\$74.99',
      evaluation: '4.2',
      quantity: 5),
  Book(
      title: 'Fogo e sangue',
      author: '',
      genre: '',
      picture: '/books/fogo-sangue.jpg',
      price: 'R\$64.99',
      evaluation: '4.8',
      quantity: 5),
  Book(
      title: 'A garota do lago',
      author: '',
      genre: '',
      picture: '/books/garota-lago.jpg',
      price: 'R\$29.99',
      evaluation: '3.9',
      quantity: 5),
  Book(
      title: 'O hobbit',
      author: '',
      genre: '',
      picture: '/books/hobbit.jpg',
      price: 'R\$52.00',
      evaluation: '4.4',
      quantity: 5),
  Book(
      title: 'O homem de giz',
      author: '',
      genre: '',
      picture: '/books/homem-giz.jpg',
      price: 'R\$57.99',
      evaluation: '4.0',
      quantity: 5),
  Book(
      title: 'O iluminado',
      author: '',
      genre: '',
      picture: '/books/iluminado.jpg',
      price: 'R\$59.99',
      evaluation: '4.9',
      quantity: 5),
  Book(
      title: 'Jogos vorazes',
      author: '',
      genre: '',
      picture: '/books/jogos-vorazes.jpg',
      price: 'R\$32.99',
      evaluation: '4.3',
      quantity: 5),
  Book(
      title: 'O pequeno principe',
      author: '',
      genre: '',
      picture: '/books/pequeno-principe.jpg',
      price: 'R\$30.00',
      evaluation: '5.0',
      quantity: 5),
  Book(
      title: 'O senhor dos anéis',
      author: '',
      genre: '',
      picture: '/books/lord-rings.jpg',
      price: 'R\$62.00',
      evaluation: '4.7',
      quantity: 5),
];
