import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/presentation/widgets/resource_card.dart';

class ResponsiveResourceBody extends StatelessWidget {
  final List<Resource> resources;

  const ResponsiveResourceBody({super.key, required this.resources});

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
              itemCount: resources.length,
              itemBuilder: (context, index) {
                return ResourceCard(resource: resources[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
