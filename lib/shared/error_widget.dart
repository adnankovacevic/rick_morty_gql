import 'package:flutter/material.dart';
import 'package:graphql_app/data/model/error_model.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.error}) : super(key: key);

  final ErrorModel error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.error,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
