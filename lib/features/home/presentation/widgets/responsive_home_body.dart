import 'package:flutter/material.dart';
import 'package:switchboard/features/home/presentation/widgets/video_section.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';

class ResponsiveHomeBody extends StatelessWidget {
  final ResourceViewModel viewModel;

  const ResponsiveHomeBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasVideos = viewModel.fapVideos.isNotEmpty ||
        viewModel.readyVideos.isNotEmpty ||
        viewModel.canVideos.isNotEmpty ||
        viewModel.toolsVideos.isNotEmpty;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            // Hero Header Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primaryContainer,
                      colorScheme.surfaceContainerHigh,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withAlpha(35),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'MEDIA & VIDEO LIBRARY',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Resilience Videos',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Watch educational guides, Family Advocacy Program (FAP) media, Reserve Ready series, and Community Action Network tools.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.withAlpha(25),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 48,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (!hasVideos)
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.video_library_outlined,
                        size: 64,
                        color: colorScheme.onSurfaceVariant.withAlpha(100),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No resilience videos found',
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // 1. Family Advocacy Program (FAP) Section
            if (viewModel.fapVideos.isNotEmpty) ...[
              VideoSection(
                title: 'Family Advocacy Program (FAP)',
                videos: viewModel.fapVideos,
                icon: Icons.family_restroom,
                iconColor: Colors.teal,
              ),
              const SizedBox(height: 20),
            ],

            // 2. Reserve Ready Section
            if (viewModel.readyVideos.isNotEmpty) ...[
              VideoSection(
                title: 'Reserve Ready Series',
                videos: viewModel.readyVideos,
                icon: Icons.shield_outlined,
                iconColor: Colors.indigo,
              ),
              const SizedBox(height: 20),
            ],

            // 3. Community Action Network (CAN) Section
            if (viewModel.canVideos.isNotEmpty) ...[
              VideoSection(
                title: 'Community Action Network',
                videos: viewModel.canVideos,
                icon: Icons.groups_outlined,
                iconColor: Colors.purple,
              ),
              const SizedBox(height: 20),
            ],

            // 4. Tools Section
            if (viewModel.toolsVideos.isNotEmpty) ...[
              VideoSection(
                title: 'Resilience & Coping Tools',
                videos: viewModel.toolsVideos,
                icon: Icons.build_circle_outlined,
                iconColor: Colors.amber.shade800,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

