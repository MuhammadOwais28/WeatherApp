import 'package:flutter/material.dart';
import 'package:mosam/view_model/search.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SeachProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            onFieldSubmitted: (value) {
              searchProvider.searchCity(context);
              
            },
            autofocus: true,
            controller: searchProvider.searchController,
            decoration: InputDecoration(
                hintText: "Search any city",
                prefixIcon: const Icon(Icons.search_rounded),
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
        ),
      ),
    );
  }
}
