import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: const PostWidget(),
          ),
          const Divider(),
          Expanded(
            flex: 3,
            child: const BottomList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BottomList extends StatelessWidget {
  const BottomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              const Text(
                'Text',
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button'),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Text('Hello'),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade200,
                          child: Text('${index + 1}'),
                        ),
                        title: Text('Element ${index + 1}'),
                        subtitle: Text('To jest przykładowy element listy o indeksie $index'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      );
                    },
                  ),
                )
              ],
            ),
          )
          // Add more widgets here if needed
        ],
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nagłówek posta (zdjęcie profilowe + nazwa użytkownika)
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'assets/group-of-success.webp', // Zdjęcie profilowe
              ),
            ),
            title: const Text('username', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.more_vert), // Ikona opcji
          ),

          // Zdjęcie posta
          Image.asset(
            'assets/group-of-success.webp',
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
            child: Text('1000 likes', style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}
