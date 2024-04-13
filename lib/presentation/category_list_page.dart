import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../model/category.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/fa_helper.dart';
import 'resource_list_cat_page.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  CategoryListPageState createState() => CategoryListPageState();
}

class CategoryListPageState extends State<CategoryListPage> {
  late List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Category>>(
        future: _getCategories(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!
                .map((category) => Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(category.name!),
                          leading: FaIcon(
                            FaHelper.getIconFromName(category.icon!),
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResourceListCatPage(
                                category: category,
                              );
                            }));
                          },
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  Future<List<Category>> _getCategories() async {
    ResourceRepository repository = SqliteResourceRepository();

    categories = await repository.getCategories();
    return categories;
  }
}
