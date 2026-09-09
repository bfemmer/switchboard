import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/apps/presentation/viewmodels/app_viewmodel.dart';
import 'package:switchboard/features/apps/presentation/widgets/app_card.dart';

class AppListPage extends StatefulWidget {
  const AppListPage({super.key, required this.viewmodel});
  final AppViewModel viewmodel;
  static String route() => "/apps";

  @override
  AppListPageState createState() => AppListPageState();
}

class AppListPageState extends State<AppListPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Helpful Mobile Apps'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: ListenableBuilder(
              listenable: widget.viewmodel.load,
              builder: (context, _) {
                if (widget.viewmodel.load.running) {
                  return const Loader();
                }

                if (widget.viewmodel.apps.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apps_outage,
                          size: 64,
                          color: colorScheme.onSurfaceVariant.withAlpha(100),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No mobile apps found',
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    // Responsive Grid Columns
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
                      itemCount: widget.viewmodel.apps.length,
                      itemBuilder: (context, index) {
                        return AppCard(
                          app: widget.viewmodel.apps[index],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
