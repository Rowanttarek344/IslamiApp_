import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/views/hadeth_views/hadethDetails.dart';

class hadethName extends StatelessWidget {
  String title;
  List<String>content;

  hadethName({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:
      Text(title, textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .primaryTextTheme
              .headline4),
      onTap: () {
        Navigator.of(context).pushNamed(hadethDetails.routeName,
            arguments: hadethDetailsArgs(title: title, content: content));
      },

    );
  }
}