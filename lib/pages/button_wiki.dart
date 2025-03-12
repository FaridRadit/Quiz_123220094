import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/movie_model.dart';

class ButtonWikipedia extends StatelessWidget {
  final String movieUrl;

  const ButtonWikipedia({super.key, required this.movieUrl});

  void _launchURL() async {
    final Uri url = Uri.parse(movieUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $movieUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchURL,
      child: const Text("Go to Wikipedia"),
    );
  }
}