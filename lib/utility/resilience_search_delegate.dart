import 'package:flutter/material.dart';
import 'package:switchboard/model/suggestion.dart';

import '../model/category.dart';
import '../model/resource.dart';
import '../presentation/app_list_page.dart';
import '../presentation/resource_detail_page.dart';
import '../presentation/resource_list_cat_page.dart';
import '../presentation/unit_list_page.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';

class ResilienceSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  String get searchFieldLabel => 'Search for...';

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   return Theme.of(context).copyWith(
  //     primaryColor:
  //         MaterialHelper.getMaterialColorForColor(Colors.blue.shade800),
  //     accentColor: Colors.white,
  //   );
  // }

  // Clear search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // Pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // Show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    if (searchTerms.isEmpty) {
      _getSearchSuggestions().then((result) {
        searchTerms = result.cast<String>().toList();
      });
    }

    for (var suggestion in searchTerms) {
      if (suggestion.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(suggestion);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // Show querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    if (searchTerms.isEmpty) {
      _getSearchSuggestions().then((result) {
        searchTerms = result.cast<String>().toList();
      });
    }

    for (var suggestion in searchTerms) {
      if (suggestion.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(suggestion);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            _processSearchRequest(context, result);
          },
        );
      },
    );
  }

  _processSearchRequest(BuildContext context, String result) async {
    final navigator = Navigator.of(context);

    Category? category = await _getCategoryByName(result);

    // Check if category
    if (category != null) {
      navigator.push(MaterialPageRoute(builder: (context) {
        return ResourceListCatPage(
          category: category,
        );
      }));
    }

    // Check if resource
    Resource? resource = await _getResourceByName(result);
    if (resource != null) {
      navigator.push(MaterialPageRoute(builder: (context) {
        return ResourceDetailPage(
          resource: resource,
        );
      }));
    }

    // Check if AFRC
    if (result == "AFRC Units") {
      navigator.push(MaterialPageRoute(builder: (context) {
        return const UnitListPage();
      }));
    }

    // Check if Mobile Apps
    if (result == "Mobile Apps") {
      navigator.push(MaterialPageRoute(builder: (context) {
        return const AppListPage();
      }));
    }
  }

  Future<Category?> _getCategoryByName(String name) async {
    ResourceRepository repository = SqliteResourceRepository();

    return await repository.getCategoryByName(name);
  }

  Future<Resource?> _getResourceByName(String name) async {
    ResourceRepository repository = SqliteResourceRepository();

    return await repository.getResourceByName(name);
  }

  Future<List<String>> _getSearchSuggestions() async {
    ResourceRepository repository = SqliteResourceRepository();
    List<String> suggestions = [];
    List<Suggestion> suggestionList =
        await repository.getResourceAndCategoryNames();

    for (var suggestion in suggestionList) {
      suggestions.add(suggestion.name);
    }

    suggestions.add("AFRC Units");
    suggestions.add("Mobile Apps");

    return suggestions;
  }
}
