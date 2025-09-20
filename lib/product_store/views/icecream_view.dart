import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IceCreamView extends StatelessWidget {
  const IceCreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Icecreams')),
        body: Consumer<AppStateModel>(builder: (context, value, child) {}));
  }
}
