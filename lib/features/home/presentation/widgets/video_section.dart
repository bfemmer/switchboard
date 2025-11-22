import 'package:flutter/material.dart';
import 'package:switchboard/features/home/presentation/widgets/video_card.dart';
import 'package:switchboard/features/resources/data/models/video.dart';

class VideoSection extends StatelessWidget {
  final String title;
  final List<Video> videos;

  const VideoSection({super.key, required this.title, required this.videos});

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) return const SizedBox.shrink();

    // Use LayoutBuilder to decide layout at the section level
    return LayoutBuilder(
      builder: (context, constraints) {
        // If we have less than 600px (Mobile), use horizontal scroll.
        // If we have more (Tablet/Desktop), use a Wrap/Grid.
        final isMobile = constraints.maxWidth < 600;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (isMobile)
              _buildHorizontalList()
            else
              _buildResponsiveGrid(constraints.maxWidth),
          ],
        );
      },
    );
  }

  Widget _buildHorizontalList() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () => _launchUrl(videos[index].url),
              child: VideoCard(video: videos[index]), // Your existing card
            ),
          );
        },
      ),
    );
  }

  Widget _buildResponsiveGrid(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        // On Tablet/Desktop, items wrap naturally
        children: videos.map((video) {
          return InkWell(
            onTap: () => _launchUrl(video.url),
            child: VideoCard(video: video),
          );
        }).toList(),
      ),
    );
  }

  void _launchUrl(String? url) {
    // Your UrlHelper logic
  }
}
