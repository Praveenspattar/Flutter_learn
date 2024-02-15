import 'package:flutter/material.dart';
import 'package:flutter_learn/iceceram/model/icecream.dart';

class IcecreamDetailView extends StatelessWidget {
  const IcecreamDetailView({super.key, required this.icecream});

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(icecream.flavor),
        elevation: 0,
      ),
      body: Column(
        children: [
        Image.network(
          icecream.image!,
          fit: BoxFit.cover,
          width: MediaQuery.sizeOf(context).width,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  icecream.flavor,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "\$${icecream.price.toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}