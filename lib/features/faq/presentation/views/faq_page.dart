import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/faq/presentation/viewmodels/faq_viewmodel.dart';
import 'package:switchboard/features/faq/presentation/widgets/faq_card.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key, required this.viewmodel});
  final FaqViewModel viewmodel;
  static String route() => "/faqs";

  @override
  FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ListenableBuilder(
              listenable: widget.viewmodel.load,
              builder: (context, _) {
                if (widget.viewmodel.load.running) {
                  return const Loader();
                }

                if (widget.viewmodel.faqs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help_outline,
                          size: 64,
                          color: colorScheme.onSurfaceVariant.withAlpha(100),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No frequently asked questions found',
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  itemCount: widget.viewmodel.faqs.length,
                  itemBuilder: (context, index) {
                    final faq = widget.viewmodel.faqs[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: FaqCard(
                        faq: faq,
                        index: index,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
