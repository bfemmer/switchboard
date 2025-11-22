import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/category_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/widgets/responsive_category_body.dart';

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
          return ResponsiveCategoryBody(
            categories: widget.viewmodel.categories,
          );
        },
      ),
    );
  }
}
