import 'package:flutter/material.dart';

import '../../utility/url_helper.dart';

class MediaCard extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String description;
  final String imageUrl;
  final String? linkUrl;

  const MediaCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
    required this.linkUrl,
  }) : super(key: key);

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
                )),
            title: Text(widget.title),
            subtitle: Text(
              widget.subTitle!,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Image.asset(widget.imageUrl),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              widget.description,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          if (widget.linkUrl != null)
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    UrlHelper.launchBrowser(widget.linkUrl!);
                  },
                  child: const Text(
                    'Learn more',
                  ),
                ),
              ],
            )
          else
            Container(),
        ],
      ),
    );
  }
}
