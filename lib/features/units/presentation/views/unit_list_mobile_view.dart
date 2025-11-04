import 'package:flutter/material.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';

import '../widgets/unit_card.dart';

class UnitListMobileView extends StatefulWidget {
  const UnitListMobileView({super.key, required this.viewmodel});

  final UnitViewModel viewmodel;

  @override
  State<UnitListMobileView> createState() => _UnitListMobileViewState();
}

class _UnitListMobileViewState extends State<UnitListMobileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Horizontal Side-Scrolling Filter Chips
        Container(
          height: 50, // Fixed height for the horizontal list
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
            itemCount: widget.viewmodel.filters.length,
            itemBuilder: (context, index) {
              final category = widget.viewmodel.filters[index];
              final isSelected = category == widget.viewmodel.selectedFilter;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      widget.viewmodel.selectFilter(category);
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
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
              );
            },
          ),
        ),

        // 2. Filtered Unit List View
        Expanded(
          child:
              widget.viewmodel.filteredUnits.isEmpty &&
                  widget
                      .viewmodel
                      .load
                      .completed // Check for loading state or no results
              ? const Center(child: Text("No units found for this category."))
              : ListView.builder(
                  itemCount: widget.viewmodel.filteredUnits.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: UnitCard(
                        unit: widget.viewmodel.filteredUnits[index],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
