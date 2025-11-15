import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/data/models/video.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Fixed width for each video card
      margin: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center, // Centers the play icon
                children: [
                  // Base image
                  Image.asset('assets/images/${video.image}'),

                  // Play icon
                  Icon(
                    Icons.play_circle_fill,
                    color: Colors.white.withValues(
                      alpha: 0.8,
                    ), // Semi-transparent white
                    size: 50.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                video.title!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                video.description!,
                style: TextStyle(fontSize: 12, color: Colors.black),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
