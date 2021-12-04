import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutModal extends StatelessWidget {
  const AboutModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'About IP2Location',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(),
          const Text(
            'Free, Fast and Reliable IP Geolocation API for commercial and '
            'non-commercial usage. Easy to use and available in JSON',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          const Text(
            'Feel free to check our website',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          const Text(
            'https://freeipapi.com',
            style: TextStyle(fontSize: 15, height: 1.5, color: Colors.blue),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              child: const Text('OK!'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
