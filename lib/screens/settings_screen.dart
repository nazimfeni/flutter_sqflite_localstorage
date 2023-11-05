import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Follow Us'),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.facebook.com/your_facebook_page');
                    },
                    child: Text('Facebook'),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.linkedin.com/your_linkedin_page');
                    },
                    child: Text('Linkedin'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
