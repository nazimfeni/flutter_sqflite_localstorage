import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sqflite_localstorage/constants.dart';


final Uri _fburl = Uri.parse('https://www.facebook.com/nazimmamun');
final Uri _inurl = Uri.parse('https://www.linkedin.com/in/mdnazimuddin77');


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);


  Future<void> _fblaunchUrl() async {
    if (!await launchUrl(_fburl)) {
      throw Exception('Could not launch $_fburl');
    }
  }

  Future<void> _inlaunchUrl() async {
    if (!await launchUrl(_inurl)) {
      throw Exception('Could not launch $_inurl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text('Follow Us'),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextButton(
                    onPressed: _fblaunchUrl,
                    child: const Text('Facebook'),
                  ),





                  TextButton(
                    onPressed: _inlaunchUrl,
                    child: const Text('Linkedin'),
                  ),

                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text(
                'Version: $version',

              ),
            ),
          ),

        ],
      ),




    );
  }
}
