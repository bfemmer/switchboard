import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AceCard extends StatelessWidget {
  const AceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      //margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/images/resilience.png',
                )),
            title: const Text(
                'Ask, Care, and Escort (ACE) - Suicide Intervention Tips'),
            subtitle: Text(
              'Make a difference today',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.blue,
                  child: Icon(
                    FontAwesomeIcons.question,
                    // color: Colors.blue,
                  ),
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
                        'Directly ask the individual if they are having thoughts of death, self-harm, or suicide.'),
                  )
                ],
              )
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
                  child: Icon(
                    FontAwesomeIcons.handHoldingHeart,
                    // color: Colors.blue,
                  ),
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
                        'Care about their answer. If they hesitate, or seem uncertain, ask follow-up questions to convey that you care about their well-being.'),
                  )
                ],
              )
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
                    child: Icon(
                      FontAwesomeIcons.peoplePulling,
                      // color: Colors.blue,
                    ),
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
                          'If the individual is having thoughts of suicide or needs help, escort them to a qualified professional or leadership.'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
