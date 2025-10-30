import 'package:flutter/material.dart';

import '../../../../core/utils/url_helper.dart';

class MediaCard extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String description;
  final String imageUrl;
  final String? linkUrl;

  const MediaCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
    this.linkUrl,
  });

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/resilience.png',
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).primaryColor
                    : null,
              ),
            ),
            title: Text(widget.title),
            subtitle: Text(widget.subTitle!),
          ),
          Image.asset(widget.imageUrl),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(widget.description),
          ),
          if (widget.linkUrl != null)
            OverflowBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    UrlHelper.launchBrowser(widget.linkUrl!);
                  },
                  child: const Text('Learn more'),
                ),
              ],
            )
          else
            const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
