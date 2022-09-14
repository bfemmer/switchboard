import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final String description;

  const InfoCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
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
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.description,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
