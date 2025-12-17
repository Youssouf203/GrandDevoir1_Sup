import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/auth_service.dart';
import 'book_details_page.dart';
import 'login_page.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  final List<Book> books = const [
    Book(
      title: "Flutter pour débutants",
      author: "Jean Dupont",
      description: "Apprendre Flutter étape par étape.",
    ),
    Book(
      title: "Dart Avancé",
      author: "Alice Martin",
      description: "Maîtriser le langage Dart.",
    ),
    Book(
      title: "Design UI/UX",
      author: "Marie Dubois",
      description: "Comprendre les principes de design.",
    ),
    Book(
      title: "Gestion d'État",
      author: "Paul Bernard",
      description: "Techniques avancées de gestion d'état dans Flutter.",
    ),
    Book(
      title: "Animations Flutter",
      author: "Sophie Laurent",
      description: "Créer des animations fluides dans Flutter.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("📚 Librairie"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.menu_book,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              title: Text(
                book.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  "Auteur : ${book.author}",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookDetailsPage(book: book),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
