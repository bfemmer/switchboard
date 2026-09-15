import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/presentation/widgets/resource_card.dart';

class ResponsiveResourceBody extends StatelessWidget {
  final List<Resource> resources;
  final Widget? header;

  const ResponsiveResourceBody({
    super.key,
    required this.resources,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget gridContent = LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth >= 1000) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth >= 600) {
          crossAxisCount = 2;
        }

        return MasonryGridView.count(
          shrinkWrap: header != null,
          physics: header != null ? const NeverScrollableScrollPhysics() : null,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          padding: header != null ? EdgeInsets.zero : const EdgeInsets.all(16),
          itemCount: resources.length,
          itemBuilder: (context, index) {
            return ResourceCard(resource: resources[index]);
          },
        );
      },
    );

    if (resources.isEmpty) {
      gridContent = Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.phone_disabled_outlined,
                size: 64,
                color: colorScheme.onSurfaceVariant.withAlpha(100),
              ),
              const SizedBox(height: 16),
              Text(
                'No hotline resources found',
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: header != null
            ? ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  header!,
                  const SizedBox(height: 16),
                  gridContent,
                ],
              )
            : gridContent,
      ),
    );
  }
}

