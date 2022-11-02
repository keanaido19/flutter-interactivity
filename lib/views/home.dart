import 'package:flutter/material.dart';

class FunkyHomeView extends StatefulWidget {
  const FunkyHomeView({super.key, required this.title});

  final String title;

  @override
  State<FunkyHomeView> createState() => _FunkyHomeViewState();
}

class _FunkyHomeViewState extends State<FunkyHomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
              'Get rid of boring text.',
            ),
      ),
    );
  }
}
