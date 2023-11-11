import 'package:contacts_app/app/data/model/company.dart';
import 'package:contacts_app/app/data/model/person.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../data/model/contact.dart';

class ContactInfo extends StatelessWidget {
  final Contact contact;
  const ContactInfo({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    var address = contact.address;
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(
          'https://www.google.com/maps/search/${address!.street},+${address.zipcode},+${address.city}/@-2.1228944,-79.896054,17z/data=!3m1!4b1?entry=ttu'));
    const categories = ['Phones', 'Emails', 'Address'];
    return Scaffold(
      appBar: AppBar(
        title: Text(contact is Person
            ? (contact as Person).firstName
            : (contact as Company).companyName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return TextButton(
                    onPressed: null, child: Text(categories[index]));
              },
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: WebViewWidget(controller: controller)),
          ),
        ],
      ),
    );
  }
}
