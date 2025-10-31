import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AceCard extends StatelessWidget {
  const AceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            title: const Text('Suicide Intervention Reminder'),
            subtitle: const Text('Make a difference today'),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Theme.of(context).primaryColor,
                  child: Icon(FontAwesomeIcons.question),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ask',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 160,
                    child: const Text(
                      'Directly ask the individual if they are having thoughts of death, self-harm, or suicide.',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.red,
                  child: Icon(FontAwesomeIcons.handHoldingHeart),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Care',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 160,
                    child: const Text(
                      'Care about their answer. If they hesitate, or seem uncertain, ask follow-up questions to convey that you care about their well-being.',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.green,
                    child: Icon(FontAwesomeIcons.peoplePulling),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Escort',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: const Text(
                        'If the individual is having thoughts of suicide or needs help, escort them to a qualified professional or leadership.',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
