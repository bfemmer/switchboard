import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/faq/presentation/viewmodels/faq_viewmodel.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key, required this.viewmodel});
  final FaqViewModel viewmodel;
  static String route() => "/faqs";

  @override
  FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frequently Asked Questions')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            return Column(
              children: [
                Expanded(
                  child: widget.viewmodel.load.running
                      ? Loader()
                      : widget.viewmodel.faqs.isEmpty
                      ? Center(
                          child: Text(
                            'No frequently asked questions found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : _buildFaqList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFaqList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      itemCount: widget.viewmodel.faqs.length,
      itemBuilder: (context, index) {
        final faq = widget.viewmodel.faqs[index];
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(
              title: Text(faq.question!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(faq.response!),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
