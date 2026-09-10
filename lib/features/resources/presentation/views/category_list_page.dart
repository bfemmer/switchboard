import 'package:flutter/material.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/loader.dart';
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
      appBar: AppBar(
        title: const Text('Categories'),
        elevation: 0,
        actions: buildAppBarActions(context),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            if (widget.viewmodel.load.running) {
              return const Loader();
            }
            return ResponsiveCategoryBody(
              categories: widget.viewmodel.categories,
            );
          },
        ),
      ),
    );
  }
}

