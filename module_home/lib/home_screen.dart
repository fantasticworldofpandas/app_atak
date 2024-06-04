import 'package:commons_dependencies/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:commons/result_container.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ResultContainerState> _resultContainerKey =
      GlobalKey<ResultContainerState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: const Text('App de pesquisa Atak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<SearchProvider>(context, listen: false)
                    .updateSearchText(value);
              },
              decoration: const InputDecoration(labelText: 'Pesquisa google'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () async {
                await Provider.of<SearchProvider>(context, listen: false)
                    .search();
                _resultContainerKey.currentState?.refresh();
              },
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 16.0),
            ResultContainer(key: _resultContainerKey),
          ],
        ),
      ),
    );
  }
}
