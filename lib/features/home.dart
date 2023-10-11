import 'package:dream_dictionary/dreams_data.dart';
import 'package:dream_dictionary/features/dreams_detail_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: blogHeader.length,
        itemBuilder: (BuildContext context, int index) {
          final getContent = blogHeader[index]['BlogTitle'].toString();
          final getFirstLetter = getContent.split('နှင့်').first;
          final getSecondPhrase = getContent.split('နှင့်').last;
          final rp =
              getFirstLetter.replaceAll(RegExp(r'[#*)(@!,^&%.$\s]+'), "");
          final capitalLetter = rp[1];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (cxt) =>
                      DreamDetailPage(blogId: blogHeader[index]['BlogId'])));
            },
            child: Card(
              color: themeColor.secondaryContainer,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      capitalLetter,
                      style: textTheme.headlineMedium,
                    ),
                    Text(getSecondPhrase),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
