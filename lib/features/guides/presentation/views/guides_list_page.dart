import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'guide_detail_page.dart';

class GuidesListPage extends StatefulWidget {
  const GuidesListPage({super.key, required this.viewmodel});
  final GuideViewModel viewmodel;
  static String route() => "/guides";

  @override
  State<GuidesListPage> createState() => _GuidesListPageState();
}

class _GuidesListPageState extends State<GuidesListPage> {
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
      appBar: AppBar(title: const Text('Quick Guides')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            return Column(
              children: [
                Expanded(
                  child: widget.viewmodel.load.running
                      ? Loader()
                      : widget.viewmodel.guides.isEmpty
                      ? Center(
                          child: Text(
                            'No frequently asked questions found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : _buildGuideList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildGuideList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      itemCount: widget.viewmodel.guides.length,
      itemBuilder: (context, index) {
        final guide = widget.viewmodel.guides[index];
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(guide.name!),
              subtitle: Text(guide.subtitle!),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/images/resilience.png',
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GuideDetailPage(guide: guide);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
