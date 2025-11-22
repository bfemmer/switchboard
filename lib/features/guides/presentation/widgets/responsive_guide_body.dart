import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'package:switchboard/features/guides/presentation/views/guide_detail_page.dart';

class ResponsiveGuideBody extends StatelessWidget {
  final GuideViewModel viewmodel;

  const ResponsiveGuideBody({super.key, required this.viewmodel});

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
        // 2. THE RESPONSIVE GRID (Using filteredGuides)
        // ---------------------------------------------------------
        Expanded(
          child: viewmodel.filteredGuides.isEmpty && viewmodel.load.completed
              ? const Center(child: Text("No guides found for this category."))
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
                          itemCount: viewmodel.filteredGuides.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(
                                  viewmodel.filteredGuides[index].name!,
                                ),
                                subtitle: Text(
                                  viewmodel.filteredGuides[index].subtitle!,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                                    'assets/images/resilience.png',
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : null,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return GuideDetailPage(
                                          guide:
                                              viewmodel.filteredGuides[index],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
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
