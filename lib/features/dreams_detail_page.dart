import 'package:dream_dictionary/dreams_data.dart';
import 'package:flutter/material.dart';

class DreamDetailPage extends StatefulWidget {
  final int blogId;
  const DreamDetailPage({super.key, required this.blogId});

  @override
  State<DreamDetailPage> createState() => _DreamDetailPageState();
}

class _DreamDetailPageState extends State<DreamDetailPage> {
  List<Map<String, dynamic>> _dream = [];

  void getDreamListById() async {
    final dream =
        details.where((element) => element['BlogId'] == widget.blogId).toList();
    setState(() {
      _dream = dream;
    });
  }

  @override
  void initState() {
    getDreamListById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _dream.length,
        itemBuilder: (context, index) {
          return Card(
            color: themeColor.secondary,
            child: Text(
              _dream[index]['BlogContent'],
            ),
          );
        },
      ),
    );
  }
}
