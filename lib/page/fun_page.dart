import 'package:flutter/material.dart';

import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class FunPage extends StatefulWidget {
  const FunPage({super.key});

  @override
  State<FunPage> createState() => _FunPageState();
}

class _FunPageState extends State<FunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topAppBar(),
            diversifyBar(),
            modelBar(),
          ],
        ),
      ),
    );
  }

  Widget topAppBar() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text('功能',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget diversifyBar() {
    return Container();
  }

  Widget modelBar() {
    return Container();
  }
}
