import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('About Switchboard')),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: Card(
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
                        title: const Text('Switchboard By The Numbers'),
                        subtitle: Text(
                          'This version provides access to ...',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '14',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              const Text('Apps'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              const Text('FAQs'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '8',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              const Text('Skills'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '14',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              const Text('Hotlines'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '26',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                                const Text('Guides'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '100',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                                const Text('Resources'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '51',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                                const Text('Units'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
