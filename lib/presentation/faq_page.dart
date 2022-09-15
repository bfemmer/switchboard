import 'package:flutter/material.dart';

import '../model/faq.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {
  late List<Faq> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frequently Asked Questions')),
      body: SafeArea(
        child: FutureBuilder<List<Faq>>(
          future: getQuestions(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data!
                  .map((resource) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ExpansionTile(
                            title: Text(resource.question!),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(resource.response!),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  Future<List<Faq>> getQuestions() async {
    ResourceRepository repository = SqliteResourceRepository();

    questions = await repository.getFaqs();
    return questions;
  }
}
