import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/core/utils/fa_helper.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/category_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/views/resource_list_cat_page.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key, required this.viewmodel});
  final CategoryViewModel viewmodel;
  static String route() => "/categories";

  @override
  CategoryListPageState createState() => CategoryListPageState();
}

class CategoryListPageState extends State<CategoryListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewmodel.load,
        builder: (context, _) {
          return Column(
            children: [
              Expanded(
                child: widget.viewmodel.load.running
                    ? Loader()
                    : widget.viewmodel.categories.isEmpty
                    ? Center(
                        child: Text(
                          'No categories found',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : _buildCategoryList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      itemCount: widget.viewmodel.categories.length,
      itemBuilder: (context, index) {
        final category = widget.viewmodel.categories[index];
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(category.name!),
              leading: FaIcon(
                FaHelper.getIconFromName(category.icon!),
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResourceListCatPage(category: category);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
