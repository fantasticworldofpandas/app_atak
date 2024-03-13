
import 'package:app_atak/providers/search_provider.dart';
import 'package:app_atak/widgets/result_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  final GlobalKey<ResultContainerState> _resultContainerKey = GlobalKey<ResultContainerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de pesquisa Atak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<SearchProvider>(context, listen: false).updateSearchText(value);
              },
              decoration: const InputDecoration(labelText: 'Pesquisa google'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await Provider.of<SearchProvider>(context, listen: false).search();
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