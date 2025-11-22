import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/core/utils/fa_helper.dart';
import 'package:switchboard/features/resources/data/models/category.dart';

class ResponsiveCategoryBody extends StatelessWidget {
  final List<Category> categories;

  const ResponsiveCategoryBody({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    // Center/Constrain for large desktops so it doesn't stretch too wide
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate columns based on available width
            int crossAxisCount = 1;
            if (constraints.maxWidth >= 1000) {
              crossAxisCount = 3;
            } else if (constraints.maxWidth >= 600) {
              crossAxisCount = 2;
            }

            // Use MasonryGridView for ALL sizes.
            // When crossAxisCount is 1, it behaves exactly like a ListView.
            return MasonryGridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12, // Increased slightly for better visuals
              padding: const EdgeInsets.all(
                16,
              ), // Handles padding for all sides
              itemCount: categories.length,
              itemBuilder: (context, index) {
                // return UnitCard(unit: units[index]);
                return Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(categories[index].name!),
                    leading: FaIcon(
                      FaHelper.getIconFromName(categories[index].icon!),
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorLight,
                    ),
                    onTap: () {
                      context.push(
                        '/resourcesbycategory/${categories[index].id!.toString()}/${categories[index].name!}',
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
