class Book {
  final String title;
  final String author;
  final String genre;
  final String picture;
  final String price;
  final String evaluation;
  final String resume;
  final int quantity;

  Book(
      {required this.title,
      required this.author,
      required this.genre,
      required this.picture,
      required this.price,
      required this.evaluation,
      required this.resume,
      required this.quantity});
}

List<Book> bookCardList = [
  Book(
      title: 'Água viva',
      author: 'Clarice Lispector',
      genre: 'Romance',
      picture: '/books/agua-viva.jpg',
      price: '49.99',
      evaluation: '4.0',
      resume:
          'Água viva é um lindo poema em prosa, no qual se comemora a vida de tudo o que, intensamente, é. Sem receitas para decodificar o mundo enfeitiçado da incitante narrativa, o leitor toma consciência de que já não dispõe de modelos para ler, nem para entender Clarice Lispector.',
      quantity: 4),
  Book(
      title: 'A cabana',
      author: 'William P. Young',
      genre: 'Romance, Suspense',
      picture: '/books/cabana.jpg',
      price: '45.99',
      evaluation: '4.5',
      resume:
          'Durante uma viagem de fim de semana, a filha mais nova de Mack Allen Phillips é raptada e evidências de que ela foi brutalmente assassinada são encontradas numa velha cabana. Após quatro anos vivendo numa tristeza profunda causada pela culpa e pela saudade da menina, Mack recebe um estranho bilhete, aparentemente escrito por Deus, convidando-o a voltar à cabana onde acontecera a tragédia. Apesar de desconfiado, ele vai ao local numa tarde de inverno e adentra passo a passo o cenário de seu mais terrível pesadelo. Mas o que ele encontra lá muda o seu destino para sempre. Em um mundo cruel e injusto, A cabana levanta um questionamento atemporal: se Deus é tão poderoso, por que não faz nada para amenizar nosso sofrimento? As respostas que Mack encontra vão surpreender você e podem transformar sua vida de maneira tão profunda quanto transformaram a dele. Você vai querer partilhar esse livro com todas as pessoas que ama.',
      quantity: 5),
  Book(
      title: 'Diário de um banana',
      author: 'Jeff Kiney',
      genre: 'Comédia',
      picture: '/books/diario-banana.jpg',
      price: '20.00',
      evaluation: '3.7',
      resume:
          'Não é fácil ser criança. E ninguém sabe disso melhor do que Greg Heffley, que se vê mergulhado no mundo do ensino fundamental, onde fracotes são obrigados a dividir os corredores com garotos mais altos, mais malvados e que já se barbeiam. Em Diário de um Banana, o autor e ilustrados Jeff Kinney nos apresenta um herói improvável. Como Greg diz em seu diário. Só não espere que seja todo Querido Diário isso, Querido Diário aquilo. Para nossa sorte, o que Greg Heffley diz que fará e o que ele realmente faz são duas coisas bem diferentes.',
      quantity: 8),
  Book(
      title: 'Dom Casmurro',
      author: 'Machado de Assis',
      genre: 'Romance',
      picture: '/books/dom-casmurro.jpg',
      price: '60.00',
      evaluation: '4.1',
      resume:
          'Em Dom Casmurro, o narrador Bento Santiago retoma a infância que passou na Rua de Matacavalos e conta a história do amor e das desventuras que viveu com Capitu, uma das personagens mais enigmáticas e intrigantes da literatura brasileira. Nas páginas deste romance, encontra-se a versão de um homem perturbado pelo ciúme, que revela aos poucos sua psicologia complexa e enreda o leitor em sua narrativa ambígua acerca do acontecimento ou não do adultério da mulher com olhos de ressaca, uma das maiores polêmicas da literatura brasileira.',
      quantity: 10),
  Book(
      title: 'Doutor Sono',
      author: 'Stephen King',
      genre: 'Horror, Fantasia, Mistério, Suspense',
      picture: '/books/doutor-sono.jpg',
      price: '74.99',
      evaluation: '4.2',
      resume:
          'Mais de trinta anos depois, Stephen King revela a seus leitores o que aconteceu a Danny Torrance, o garoto no centro de O iluminado, depois de sua terrível experiência no Overlook Hotel. Em Doutor Sono, King dá continuidade a essa história, contando a vida de Dan, agora um homem de meia-idade, e Abra Stone, uma menina de doze anos com um grande poder. Assombrado pelos habitantes do Overlook Hotel, onde passou um ano terrível da infância, Dan ficou à deriva por décadas, desesperado para se livrar do legado de alcoolismo e violência do pai. Por fim, ele se instala em uma cidade de New Hampshire, onde encontra abrigo em uma comunidade do Alcoólicos Anônimos que o apoia e um emprego em uma casa de repouso, onde seu poder remanescente da iluminação fornece o conforto final para aqueles que estão morrendo. Ajudado por um gato que prevê a morte dos pacientes, ele se torna o Doutor Sono. Então Dan conhece Abra Stone, uma menina com um dom espetacular, a iluminação mais forte que já se viu. Ela desperta os demônios de seu passado e Dan se vê envolvido em uma batalha pela alma e sobrevivência dela. Uma guerra épica entre o bem e o mal, uma sangrenta e gloriosa história que vai emocionar os milhões de fãs de O Iluminado e satisfazer os leitores deste novo clássico da obra de King.',
      quantity: 11),
  Book(
      title: 'Fogo e sangue',
      author: 'George R. R. Martin',
      genre: 'Fantasia',
      picture: '/books/fogo-sangue.jpg',
      price: '64.99',
      evaluation: '4.8',
      resume:
          'Séculos antes dos eventos de A guerra dos tronos, a Casa Targaryen, única família de senhores dos dragões a sobreviver à Destruição de Valíria, tomou residência em Pedra do Dragão. A história de Fogo e sangue começa com o lendário Aegon, o Conquistador, criador do Trono de Ferro, e segue narrando as gerações de Targaryen que lutaram para manter o assento, até a guerra civil que quase destruiu sua dinastia. O que realmente aconteceu durante a Dança dos Dragões? Por que era tão perigoso visitar Valíria depois da Destruição? Qual é a origem dos três ovos de dragão que chegaram a Daenerys? Essas são algumas das questões respondidas neste livro essencial, relatadas por um sábio meistre da Cidadela. Ricamente ilustrado com mais de oitenta imagens em preto e branco assinadas pelo artista Dough Wheatley, Fogo e sangue dará aos leitores uma nova e completa visão da fascinante história de Westeros, um livro imperdível para os fãs do autor',
      quantity: 0),
  Book(
      title: 'A garota do lago',
      author: 'Charlie Donlea',
      genre: 'Suspense, Mistério',
      picture: '/books/garota-lago.jpg',
      price: '29.99',
      evaluation: '3.9',
      resume:
          'Summit Lake, uma pequena cidade entre montanhas, é esse tipo de lugar, bucólico e com encantadoras casas dispostas à beira de um longo trecho de água intocada.Duas semanas atrás, a estudante de direito Becca Eckersley foi brutalmente assassinada em uma dessas casas. Filha de um poderoso advogado, Becca estava no auge de sua vida. Atraída instintivamente pela notícia, a repórter Kelsey Castle vai até a cidade para investigar o caso e logo se estabelece uma conexão íntima quando um vivo caminha nas mesmas pegadas dos mortos... E enquanto descobre sobre as amizades de Becca, sua vida amorosa e os segredos que ela guardava, a repórter fica cada vez mais convencida de que a verdade sobre o que aconteceu com Becca pode ser a chave para superar as marcas sombrias de seu próprio passado.',
      quantity: 2),
  Book(
      title: 'O hobbit',
      author: 'J. R. R. Tolkien',
      genre: 'Fantasia, Romance, Aventura',
      picture: '/books/hobbit.jpg',
      price: '52.00',
      evaluation: '4.4',
      resume:
          'Prelúdio de O Senhor dos Anéis, O Hobbit conquistou sucesso imediato quando foi publicado em 1937. Vendeu milhões de cópias em todo o mundo e estabeleceu-se como um clássico moderno e um dos livros mais influentes de nossa geração. Bilbo Bolseiro é um hobbit que leva uma vida confortável e sem ambições. Mas seu contentamento é perturbado quando Gandalf, o mago, e uma companhia de anões batem à sua porta e levam-no para uma expedição. Eles têm um plano para roubar o tesouro guardado por Smaug, o Magnífico, um grande e perigoso dragão. Bilbo reluta muito em participar da aventura, mas acaba surpreendendo até a si mesmo com sua esperteza e sua habilidade como ladrão!',
      quantity: 3),
  Book(
      title: 'O homem de giz',
      author: 'C. J. Tudor',
      genre: 'Suspense, Romance, Mistério',
      picture: '/books/homem-giz.jpg',
      price: '57.99',
      evaluation: '4.0',
      resume:
          'Em 1986, Eddie e os amigos passam a maior parte dos dias andando de bicicleta pela pacata vizinhança em busca de aventuras. Os desenhos a giz são seu código secreto: homenzinhos rabiscados no asfalto; mensagens que só eles entendem. Mas um desenho misterioso leva o grupo de crianças até um corpo desmembrado e espalhado em um bosque. Depois disso, nada mais é como antes. Em 2016, Eddie se esforça para superar o passado, até que um dia ele e os amigos de infância recebem um mesmo aviso: o desenho de um homem de giz enforcado. Quando um dos amigos aparece morto, Eddie tem certeza de que precisa descobrir o que de fato aconteceu trinta anos atrás. Alternando habilidosamente entre presente e passado, O Homem de Giz traz o melhor do suspense: personagens maravilhosamente construídos, mistérios de prender o fôlego e reviravoltas que vão impressionar até os leitores mais escaldados.',
      quantity: 1),
  Book(
      title: 'O iluminado',
      author: 'Stephen King',
      genre: 'Ação, Suspense, Mistério, Horror',
      picture: '/books/iluminado.jpg',
      price: '59.99',
      evaluation: '4.9',
      resume:
          'O romance, magistralmente levado ao cinema por Stanley Kubrick, continua apaixonando (e aterrorizando) novas gerações de leitores. A luta assustadora entre dois mundos. Um menino e o desejo assassino de poderosas forças malignas. Uma família refém do mal. Nesta guerra sem testemunhas, vencerá o mais forte. Danny Torrance não é um menino comum. É capaz de ouvir pensamentos e transportar-se no tempo. Danny é iluminado. Será uma maldição ou uma bênção? A resposta pode estar guardada na imponência assustadora do hotel Overlook. Em O iluminado, quando Jack Torrance consegue o emprego de zelador no velho hotel, todos os problemas da família parecem estar solucionados. Não mais o desemprego e as noites de bebedeiras. Não mais o sofrimento da esposa, Wendy. Tranquilidade e ar puro para o pequeno Danny livrar-se das convulsões que assustam a família. Só que o Overlook não é um hotel comum. O tempo esqueceu-se de enterrar velhos ódios e de cicatrizar antigas feridas, e espíritos malignos ainda residem nos corredores. O hotel é uma chaga aberta de ressentimento e desejo de vingança. É uma sentença de morte. E somente os poderes de Danny podem fazer frente à disseminação do mal.',
      quantity: 7),
  Book(
      title: 'Jogos vorazes',
      author: 'Suzanne Collins',
      genre: 'Ação, Romance, Suspense',
      picture: '/books/jogos-vorazes.jpg',
      price: '32.99',
      evaluation: '4.3',
      resume:
          'Na abertura dos Jogos Vorazes, a organização não recolhe os corpos dos combatentes caídos e dá tiros de canhão até o final. Cada tiro, um morto. Onze tiros no primeiro dia. Treze jovens restaram, entre eles, Katniss. Para quem os tiros de canhão serão no dia seguinte?... Após o fim da América do Norte, uma nova nação chamada Panem surge. Formada por doze distritos, é comandada com mão de ferro pela Capital. Uma das formas com que demonstra seu poder sobre o resto do carente país é com Jogos Vorazes, uma competição anual transmitida ao vivo pela televisão, em que um garoto e uma garota de doze a dezoito anos de cada distrito são selecionados e obrigados a lutar até a morte! Para evitar que sua irmã seja a mais nova vítima do programa, Katniss se oferece para participar em seu lugar. Vinda do empobrecido Distrito 12, ela sabe como sobreviver em um ambiente hostil. Peeta, um garoto que ajudou sua família no passado, também foi selecionado. Caso vença, terá fama e fortuna. Se perder, morre. Mas para ganhar a competição, será preciso muito mais do que habilidade. Até onde Katniss estará disposta a ir para ser vitoriosa nos Jogos Vorazes?',
      quantity: 14),
  Book(
      title: 'O pequeno principe',
      author: 'Antoine de Saint-Exupéry',
      genre: 'Infantil',
      picture: '/books/pequeno-principe.jpg',
      price: '30.00',
      evaluation: '5.0',
      resume:
          'Nesta história que marcou gerações de leitores em todo o mundo, um piloto cai com seu avião no deserto do Saara e encontra um pequeno príncipe, que o leva a uma aventura filosófica e poética através de planetas que encerram a solidão humana. Um livro para todos os públicos, O pequeno príncipe é uma obra atemporal, com metáforas pertinentes e aprendizados sobre afeto, sonhos, esperança e tudo aquilo que é invisível aos olhos.',
      quantity: 6),
  Book(
      title: 'O senhor dos anéis',
      author: 'J. R. R. Tolkien',
      genre: 'Fantasia, Romance, Aventura',
      picture: '/books/lord-rings.jpg',
      price: '62.00',
      evaluation: '4.7',
      resume:
          'O volume inicial de O Senhor dos Anéis, lançado originalmente em julho de 1954, foi o primeiro grande épico de fantasia moderno, conquistando milhões de leitores e se tornando o padrão de referência para todas as outras obras do gênero até hoje. A imaginação prodigiosa de J.R.R. Tolkien e seu conhecimento profundo das antigas mitologias da Europa permitiram que ele criasse um universo tão complexo e convincente quanto o mundo real. A Sociedade do Anel começa no Condado, a região rural do oeste da Terra-média onde vivem os diminutos e pacatos hobbits. Bilbo Bolseiro, um dos raros aventureiros desse povo, cujas peripécias foram contadas em O Hobbit, resolve ir embora do Condado e deixa sua considerável herança nas mãos de seu jovem parente Frodo.',
      quantity: 13),
  Book(
      title: 'Ted Bundy: Um Estranho ao Meu Lado',
      author: 'Ann Rule',
      genre: 'Crime',
      picture: '/books/ted-bundy.jpg',
      price: '74.99',
      evaluation: '4.2',
      resume:
          'Quando Ann Rule conheceu Ted Bundy em um centro de atendimento de prevenção ao suicídio, ela não fazia ideia de que aquele rapaz simpático e inteligente ― que sentava ao lado dela e de quem até chegou a receber um cartão de Natal ― se tornaria um dos serial killers mais proeminentes da história. Ted Bundy confessou ter matado ao menos 36 mulheres nos Estados Unidos durante os anos 1970. Para estudiosos do caso, a contagem final é ainda maior. Ele pode até ter salvado vidas pelo centro de prevenção, mas ceifou outras dezenas quando ninguém estava olhando. Inúmeras famílias ficaram sem respostas, e ele foi executado em 1989 na cadeira elétrica. Mas estas informações todo mundo conhece. Chegou a hora de saber mais. Ted Bundy: Um Estranho ao Meu Lado é o livro de true crime mais aguardado pelos darksiders e chega como um clássico na coleção Crime Scene®, da DarkSide® Books. Ann Rule ― que teve uma extensa carreira publicando livros e reportagens sobre casos criminais ―, divide uma experiência que ninguém, em sã consciência, gostaria de ter: a proximidade com um serial killer e a descoberta de sua verdadeira face. Em Ted Bundy: Um Estranho ao Meu Lado, mergulhamos nas memórias de Rule através de um viés inusitado e assustador. Após mudar de emprego e começar a cobrir casos criminais, Rule se viu diante de um mistério envolvendo mortes consecutivas de mulheres, até que, anos depois, quando estava escrevendo um livro sobre essas mesmas vítimas, a verdade veio à tona. Rule levou anos para aceitar e assimilar o fato de que o homem que havia causado tanto horror era o mesmo com quem havia passado sozinha os turnos da noite no trabalho. Em 2003, em uma entrevista ao Houston Chronicle, ela afirmou: “Por muito tempo eu nutri esperanças de que ele fosse inocente, de que, de alguma forma, isso tudo não passasse de um erro terrível”. Sua experiência alterou drasticamente seu projeto: ela não mais estava escrevendo sobre um assassino misterioso, e sim sobre alguém que havia conhecido pessoalmente. Equilibrando sua vivência pessoal cheia de descrenças, temores e conflitos e seu papel como repórter investigativa, Rule explora a dualidade de Bundy com uma intimidade ímpar. De um lado, um homem charmoso e carismático que dividia planos sobre reconquistar uma antiga namorada; de outro, um psicopata que nutria um ódio fervoroso por mulheres e vivia uma vida de mentira. O clássico best-seller de Ann Rule é o olhar mais profundo e detalhado sobre Ted Bundy que um leitor de veia investigativa irá encontrar.',
      quantity: 12),
  Book(
      title: 'Sapiens - Uma Breve História da Humanidade',
      author: 'Yuval Noah Harari',
      genre: 'História',
      picture: '/books/sapiens.jpg',
      price: '44.70',
      evaluation: '4.9',
      resume:
          'O que possibilitou ao Homo sapiens subjugar as demais espécies? O que nos torna capazes das mais belas obras de arte, dos avanços científicos mais impensáveis e das mais horripilantes guerras? Nossa capacidade imaginativa. Somos a única espécie que acredita em coisas que não existem na natureza, como Estados, dinheiro e direitos humanos. Partindo dessa ideia, Yuval Noah Harari, doutor em história pela Universidade de Oxford, aborda em Sapiens a história da humanidade sob uma perspectiva inovadora. Explica que o capitalismo é a mais bem-sucedida religião, que o imperialismo é o sistema político mais lucrativo, que nós, humanos modernos, embora sejamos muito mais poderosos que nossos ancestrais, provavelmente não somos mais felizes. Um relato eletrizante sobre a aventura de nossa extraordinária espécie, de primatas insignificantes a senhores do mundo.',
      quantity: 9),
  Book(
      title: 'Einstein: Biografia de um gênio imperfeito',
      author: 'David Bodanis',
      genre: 'Biografia',
      picture: '/books/einstein.jpg',
      price: '73.45',
      evaluation: '4.7',
      resume:
          'Um mergulho irresistível no lado mais humano de Einstein Acessível e absorvente, esta não é apenas mais uma biografia do maior gênio da era moderna. Escrita pelo premiado autor David Bodanis, retrata o cientista revolucionário para revelar um Albert Einstein profundamente humano em sua genialidade e em seus defeitos e imperfeições - entre eles a teimosia orgulhosa que o deixou isolado e à margem da comunidade científica nas ultimas décadas de vida. A chegada de um gênio ao ápice, seu declínio, o modo como lidou com o fracasso e a perda da confiança - esse é o mapa percorrido por Bodanis nessa reconstrução minuciosa e afetiva, mas também crítica, da vida de Einstein. Com uma narrativa cativante, o livro oferece ainda explicações científicas ao alcance do leitor não especializado - que ficará surpreso ao descobrir que é possível entender a teoria da relatividade geral.',
      quantity: 4),
  Book(
      title: 'Interestelar',
      author: 'Christopher Nolan',
      genre: 'Sci-fi',
      picture: '/books/interestelar.jpg',
      price: '44.90',
      evaluation: '4.6',
      resume:
          'INTERESTELAR é a crônica de um grupo de exploradores que se aproveita de um recém-descoberto buraco de minhoca para ultrapassar os limites das viagens espaciais tripuladas e assim conquistar as grandes distâncias de uma jornada interestelar. Enquanto viajam, estão em risco o destino do planeta Terra e o futuro da raça humana. O livro INTERESTELAR consegue explicar com clareza a teoria do físico Kip Thorne, que inspirou esta incrível história de ficção científica.',
      quantity: 13),
  Book(
      title: 'Harry Potter e a pedra filosofal',
      author: 'J. K. Rowling',
      genre: 'Ação, Aventura, Fantasia, Infantil',
      picture: '/books/harry-potter.jpg',
      price: '34.99',
      evaluation: '4.9',
      resume:
          'Harry Potter é um garoto cujos pais, feiticeiros, foram assassinados por um poderosíssimo bruxo quando ele ainda era um bebê. Ele foi levado, então, para a casa dos tios que nada tinham a ver com o sobrenatural. Pelo contrário. Até os 10 anos, Harry foi uma espécie de gata borralheira: maltratado pelos tios, herdava roupas velhas do primo gorducho, tinha óculos remendados e era tratado como um estorvo.No dia de seu aniversário de 11 anos, entretanto, ele parece deslizar por um buraco sem fundo, como o de Alice no país das maravilhas, que o conduz a um mundo mágico. Descobre sua verdadeira história e seu destino: ser um aprendiz de feiticeiro até o dia em que terá que enfrentar a pior força do mal, o homem que assassinou seus pais. O menino de olhos verde, magricela e desengonçado, tão habituado à rejeição, descobre, também, que é um herói no universo dos magos. Potter fica sabendo que é a única pessoa a ter sobrevivido a um ataque do tal bruxo do mal e essa é a causa da marca em forma de raio que ele carrega na testa. Ele não é um garoto qualquer, ele sequer é um feiticeiro qualquer, ele é Harry Potter, símbolo de poder, resistência e um líder natural entre os sobrenaturais. A fábula, recheada de fantasmas, paredes que falam, caldeirões, sapos, unicórnios, dragões e gigantes, não é, entretanto, apenas um passatempo. Harry Potter conduz a discussões metafísicas, aborda o eterno confronto entre o bem e o mal, evidencia algumas mazelas da sociedade, como o preconceito, a divisão de classes através do dinheiro e do berço, a inveja, o egoísmo, a competitividade exacerbada, a busca pelo ideal - a necessidade de aprender, nem que seja à força, que a vida é feita de derrotas e vitórias e que isso é importante para a formação básica de um adulto.',
      quantity: 10),
];
