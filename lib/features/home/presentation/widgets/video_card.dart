import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/data/models/video.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final double width;

  const VideoCard({
    super.key,
    required this.video,
    this.width =
        270.0, // Default width ensures it works in Horizontal Lists & Grids
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // Using Card provides built-in elevation and rounded corners
      child: Card(
        clipBehavior: Clip.antiAlias, // Clips the image to the rounded corners
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Thumbnail Image
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/images/${video.image}', // Use video.thumbnailUrl if available
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image),
                      );
                    },
                  ),
                ),
                // Play Icon overlay
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),

            // 2. Title and Subtitle
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title ?? 'Unknown Title',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (video.description != null)
                    Text(
                      video.description!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
