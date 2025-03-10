import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  final String title;

  const ThirdScreen({super.key, required this.title});

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  String searchQuery = ''; // Holds the current search text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white24,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // SearchBar w AppBar (Material 3)
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 70,
            scrolledUnderElevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 70,
                child: SearchBar(
                  hintText: 'Search posts...',
                  leading: const Icon(Icons.search),
                  onChanged: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                ),
              ),
            ),
          ),

          // Główna zawartość ekranu (scrollowalna)
          SliverList(
            delegate: SliverChildListDelegate(const [
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  'Dummy post',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              _PostWidget(), // Post
              Divider(),
              _BottomList(), // Lista pod postem
            ]),
          ),
        ],
      ),
    );
  }
}

class _BottomList extends StatelessWidget {
  const _BottomList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: const Text(
                'Categories:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Tworzymy listę ręcznie zamiast ListView.builder
        ...List.generate(10, (index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade200,
              child: Text('${index + 1}'),
            ),
            title: Text('Element ${index + 1}'),
            subtitle: Text(
              'To jest przykładowy element listy o indeksie $index',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          );
        }),
      ],
    );
  }
}

class _PostWidget extends StatelessWidget {
  const _PostWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Margines wokół ramki
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Tło ramki
          borderRadius: BorderRadius.circular(16), // Zaokrąglone rogi
          boxShadow: [
            // Efekt cienia
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4), // Cień pod ramką
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nagłówek posta (zdjęcie profilowe + nazwa użytkownika)
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/sample-picture.webp', // Zdjęcie profilowe
                ),
              ),
              title: const Text(
                'username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.more_vert),
            ),

            // Zdjęcie posta
            Image.asset(
              'assets/sample-picture.webp',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            // Ikony interakcji
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Liczba polubień
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '1000 likes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // Opis posta
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'username ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'This is an example post caption. #Flutter'),
                  ],
                ),
              ),
            ),

            // Sekcja komentarzy
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'View all 120 comments',
                style: TextStyle(color: Colors.grey),
              ),
            ),

            // Data posta
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '2 hours ago',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
