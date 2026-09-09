import 'package:flutter/material.dart';
import 'package:switchboard/features/home/presentation/widgets/video_section.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';

class ResponsiveHomeBody extends StatelessWidget {
  final ResourceViewModel viewModel;

  const ResponsiveHomeBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Center the content for Desktop so it doesn't stretch too wide
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1000,
        ), // Max width for Desktop
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            // FAP Section (Auto-adapts layout)
            VideoSection(
              title: 'Family Advocacy Program (FAP)',
              videos: viewModel.fapVideos,
            ),

            const SizedBox(height: 25),

            // Reserve Ready Section
            VideoSection(title: 'Reserve Ready', videos: viewModel.readyVideos),

            const SizedBox(height: 25),

            // CAN Section
            VideoSection(
              title: 'Community Action Network',
              videos: viewModel.canVideos,
            ),

            const SizedBox(height: 25),

            // Chill drill tools
            VideoSection(title: 'Tools', videos: viewModel.toolsVideos),
          ],
        ),
      ),
    );
  }
}
