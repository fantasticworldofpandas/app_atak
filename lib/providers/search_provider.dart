import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchProvider extends ChangeNotifier {
  String _searchText = '';
  String _title = '';
  String _link = '';
  bool _isLoading = false;

  String get title => _title;
  String get link => _link;
  bool get isLoading => _isLoading;

  get searchText => null;

  Future<void> search() async {
    try {
      _isLoading = true;
      notifyListeners();

      var dio = Dio();
      var response = await dio.get('http://127.0.0.1:5000/api/pesquisa/$_searchText');

      print('resposta da API: $response');

      if (response.statusCode == 200) {
        _title = response.data['titulo'] ?? 'titulo indisponivel';
        _link = response.data['link'] ?? 'link indisponivel';
      } else {
        _title = 'erro de pesquisa';
        _link = 'erro de pesquisa';
        if (response.statusCode == 404) {
          _title = 'sem resultados';
        } else {
          _title = 'erro de pesquisa: ${response.statusCode}';
        }
      }
    } catch (error) {
      _title = 'erro de pesquisa';
      _link = '';
      print('erro de pesquisa: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateSearchText(String value) {
    _searchText = value;
  }
}
