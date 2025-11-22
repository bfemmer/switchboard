import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';
import 'package:switchboard/features/units/presentation/widgets/unit_card.dart';

class ResponsiveUnitBody extends StatelessWidget {
  final UnitViewModel viewmodel;

  const ResponsiveUnitBody({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------------------------------------------------
        // 1. THE FILTER BAR (Ported from UnitListMobileView)
        // ---------------------------------------------------------
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).appBarTheme.backgroundColor?.withValues(alpha: .05),
            border: const Border(
              bottom: BorderSide(color: Colors.black12, width: 0.5),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  selectedColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  // Ensure visual consistency
                  backgroundColor: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected
                          ? Colors.transparent
                          : Theme.of(context).dividerColor,
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
              ? const Center(child: Text("No units found for this category."))
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
                          // IMPORTANT: Use filteredUnits here!
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
