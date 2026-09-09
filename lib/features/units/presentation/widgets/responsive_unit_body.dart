import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';
import 'package:switchboard/features/units/presentation/widgets/unit_card.dart';

class ResponsiveUnitBody extends StatelessWidget {
  final UnitViewModel viewmodel;

  const ResponsiveUnitBody({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        // ---------------------------------------------------------
        // 1. THE FILTER BAR
        // ---------------------------------------------------------
        Container(
          height: 54,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHigh.withAlpha(80),
            border: Border(
              bottom: BorderSide(
                color: colorScheme.outlineVariant.withAlpha(60),
                width: 1,
              ),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            itemCount: viewmodel.filters.length,
            itemBuilder: (context, index) {
              final category = viewmodel.filters[index];
              final isSelected = category == viewmodel.selectedFilter;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      viewmodel.selectFilter(category);
                    }
                  },
                  selectedColor: colorScheme.primary,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 13,
                  ),
                  backgroundColor: colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected
                          ? Colors.transparent
                          : colorScheme.outlineVariant,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // ---------------------------------------------------------
        // 2. THE RESPONSIVE GRID (Using filteredUnits)
        // ---------------------------------------------------------
        Expanded(
          child: viewmodel.filteredUnits.isEmpty && viewmodel.load.completed
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 56,
                        color: colorScheme.onSurfaceVariant.withAlpha(100),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'No units found for this category.',
                        style: TextStyle(
                          fontSize: 15,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        // Responsive Logic
                        int crossAxisCount = 1;
                        if (constraints.maxWidth >= 1000) {
                          crossAxisCount = 3;
                        } else if (constraints.maxWidth >= 600) {
                          crossAxisCount = 2;
                        }

                        return MasonryGridView.count(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          padding: const EdgeInsets.all(16),
                          itemCount: viewmodel.filteredUnits.length,
                          itemBuilder: (context, index) {
                            return UnitCard(
                              unit: viewmodel.filteredUnits[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
