import 'package:flutter/material.dart';

class SearchScreenUijkbndsvdsv extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  void performSearch(String query) {
    print("Searching for: $query");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => performSearch(searchController.text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
