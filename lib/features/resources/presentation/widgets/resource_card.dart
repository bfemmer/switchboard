import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';

import '../../../../core/utils/url_helper.dart';

class ResourceCard extends StatefulWidget {
  final Resource resource;

  const ResourceCard({super.key, required this.resource});

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
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.cable,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            title: Text(widget.resource.name!),
            subtitle: Text(widget.resource.type!),
          ),
          Container(
            color: Theme.of(
              context,
            ).secondaryHeaderColor.withValues().withAlpha(128),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.resource.description!),
                  ),
                ),
              ],
            ),
          ),
          if (widget.resource.link != null)
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        UrlHelper.launchBrowser(widget.resource.link!);
                      },
                      child: const Text('Learn more'),
                    ),
                    widget.resource.video != null
                        ? IconButton(
                            onPressed: () {
                              UrlHelper.launchBrowser(widget.resource.video!);
                            },
                            icon: const FaIcon(FontAwesomeIcons.youtube),
                            color: Theme.of(context).primaryColor,
                          )
                        : Container(),
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        String subject =
                            'Resilience Resource - ${widget.resource.name!}';
                        String body = '${widget.resource.description!}\n';

                        if (widget.resource.link != null) {
                          body += '\nWeb: ${widget.resource.link!}';
                        }

                        if (widget.resource.video != null) {
                          body += '\nVideo: ${widget.resource.video!}';
                        }

                        if (widget.resource.voice != null) {
                          body += '\nPhone: ${widget.resource.voice!}';
                        }

                        if (widget.resource.sms != null) {
                          body += '\nText Message: ${widget.resource.sms!}';
                        }

                        UrlHelper.sendEmail(subject, body);
                      },
                      icon: const Icon(Icons.send),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                // //const Spacer(),
                // IconButton(
                //   onPressed: () {
                //     String subject =
                //         'Resilience Resource - ${widget.resource.name!}';
                //     String body = '${widget.resource.description!}\n';

                //     if (widget.resource.link != null) {
                //       body += '\nWeb: ${widget.resource.link!}';
                //     }

                //     if (widget.resource.voice != null) {
                //       body += '\nPhone: ${widget.resource.voice!}';
                //     }

                //     if (widget.resource.sms != null) {
                //       body += '\nText Message: ${widget.resource.sms!}';
                //     }

                //     UrlHelper.sendEmail(subject, body);
                //   },
                //   icon: const Icon(Icons.send),
                //   color: Theme.of(context).primaryColor,
                // )
              ],
            )
          else
            Container(),
        ],
      ),
    );
  }
}
