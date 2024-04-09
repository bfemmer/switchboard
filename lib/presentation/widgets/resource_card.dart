import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/resource.dart';
import '../../utility/url_helper.dart';

class ResourceCard extends StatefulWidget {
  final Resource resource;

  const ResourceCard({
    super.key,
    required this.resource,
  });

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
            leading: const CircleAvatar(
                child: Icon(
              Icons.cable,
            )),
            title: Text(widget.resource.name!),
            subtitle: Text(
              widget.resource.type!,
            ),
          ),
          Container(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.resource.description!,
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
                        color: Theme.of(context).primaryColor,
                      )
                    : Container(),
                widget.resource.sms != null
                    ? IconButton(
                        onPressed: () {
                          UrlHelper.textMessage(widget.resource.sms!);
                        },
                        icon: const FaIcon(FontAwesomeIcons.commentSms),
                        color: Theme.of(context).primaryColor,
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
