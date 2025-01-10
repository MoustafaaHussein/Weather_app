// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weatherapp2/Widgets/SearchWidget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const Searchwidget(),
    );
  }
}
