import 'package:flutter/material.dart';

class LoadingWidget extends Center {
  const LoadingWidget({Key? key = defaultKey})
      : super(key: key, child: const CircularProgressIndicator());

  static const Key defaultKey = Key('spinner');
}
