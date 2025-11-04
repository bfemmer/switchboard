import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/domain/repositories/resource_repository.dart';
import 'package:switchboard/features/search/data/models/suggestion.dart';

import '../../../resources/presentation/views/resource_detail_page.dart';

class ResilienceSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];
  final GetIt serviceLocator;

  ResilienceSearchDelegate({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    super.autocorrect,
    super.enableSuggestions,
    required this.serviceLocator,
  });

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
    ResourceRepository repository = serviceLocator<ResourceRepository>();
    Category? category;

    try {
      final result = await repository.getCategoryByName(name);
      switch (result) {
        case Ok<Category?>():
          category = result.value;
        case Error<Category?>():
          throw Exception(result);
      }
    } on Exception catch (e) {
      Exception(e);
    }

    return category;
  }

  Future<Resource?> _getResourceByName(String name) async {
    ResourceRepository repository = serviceLocator<ResourceRepository>();
    Resource? category;

    try {
      final result = await repository.getResourceByName(name);
      switch (result) {
        case Ok<Resource?>():
          category = result.value;
        case Error<Resource?>():
          throw Exception(result);
      }
    } on Exception catch (e) {
      Exception(e);
    }

    return category;
  }

  Future<List<String>> _getSearchSuggestions() async {
    ResourceRepository repository = serviceLocator<ResourceRepository>();
    List<String> suggestions = [];
    List<Suggestion> suggestionList = [];

    try {
      final result = await repository.getResourceAndCategoryNames();
      switch (result) {
        case Ok<List<Suggestion>>():
          suggestionList = result.value;

          for (var suggestion in suggestionList) {
            suggestions.add(suggestion.name!);
          }

          suggestions.add("AFRC Units");
          suggestions.add("Mobile Apps");
        case Error<List<Suggestion>>():
          throw Exception(result);
      }
    } on Exception catch (e) {
      Exception(e);
    }

    return suggestions;
  }
}
