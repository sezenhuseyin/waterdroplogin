import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

late GifController controller;
TextEditingController _controller = TextEditingController();

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.grey.withAlpha(50),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: CupertinoTextField(
                    style: TextStyle(fontSize: 58),
                    controller: _controller,
                    onChanged: (value) {
                      controller.animateTo(_controller.text.length / 25);
                      setState(() {});
                    },
                  )),
              Gif(
                controller: controller,
                image: AssetImage("assets/drop.gif"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
