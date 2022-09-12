import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/resource.dart';
import '../../utility/url_helper.dart';

class ResourceCard extends StatefulWidget {
  final Resource resource;

  const ResourceCard({
    Key? key,
    required this.resource,
  }) : super(key: key);

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
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
            title: Text(widget.resource.name!),
            subtitle: Text(
              widget.resource.type!,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Container(
            color: Colors.blue.shade50,
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.resource.description!,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.resource.link != null)
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    UrlHelper.launchBrowser(widget.resource.link!);
                  },
                  child: const Text(
                    'Learn more',
                  ),
                ),
                widget.resource.voice != null
                    ? IconButton(
                        onPressed: () {
                          UrlHelper.makePhoneCall(widget.resource.voice!);
                        },
                        icon: const FaIcon(FontAwesomeIcons.phone),
                        color: Colors.blue.shade800,
                      )
                    : Container(),
                widget.resource.sms != null
                    ? IconButton(
                        onPressed: () {
                          UrlHelper.textMessage(widget.resource.sms!);
                        },
                        icon: const FaIcon(FontAwesomeIcons.commentSms),
                        color: Colors.blue,
                      )
                    : Container(),
              ],
            )
          else
            Container(),
        ],
      ),
    );
  }
}
