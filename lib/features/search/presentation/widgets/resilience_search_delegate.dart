import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/search/data/models/suggestion.dart';

import '../../../resources/presentation/views/resource_detail_page.dart';
import '../../../../repository/resource_repository.dart';
import '../../../../repository/sqlite/sqlite_resource_repository.dart';

class ResilienceSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  String get searchFieldLabel => 'Search for...';

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
        return ListTile(title: Text(result));
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

  Future<void> _processSearchRequest(
    BuildContext context,
    String result,
  ) async {
    final navigator = Navigator.of(context);

    Category? category = await _getCategoryByName(result);

    // Check if category
    if (category != null) {
      if (context.mounted) {
        context.push(
          '/resourcesbycategory/${category.id!.toString()}/${category.name!}',
        );
      }
    }

    // Check if resource
    Resource? resource = await _getResourceByName(result);
    if (resource != null) {
      navigator.push(
        MaterialPageRoute(
          builder: (context) {
            return ResourceDetailPage(resource: resource);
          },
        ),
      );
    }

    // Check if AFRC
    if (result == "AFRC Units") {
      if (context.mounted) {
        context.push('/units');
      }
    }

    // Check if Mobile Apps
    if (result == "Mobile Apps") {
      if (context.mounted) {
        context.push('/apps');
      }
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
    List<Suggestion> suggestionList = await repository
        .getResourceAndCategoryNames();

    for (var suggestion in suggestionList) {
      suggestions.add(suggestion.name!);
    }

    suggestions.add("AFRC Units");
    suggestions.add("Mobile Apps");

    return suggestions;
  }
}
