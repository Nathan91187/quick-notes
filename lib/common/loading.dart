import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color(0xFF172554),
        child: SpinKitChasingDots(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
    );
  }
}
