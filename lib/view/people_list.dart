import 'package:flutter/material.dart';
import 'package:texon/model/street_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PeopleList extends StatelessWidget {
  final String image;
  final String address;
  final String city;
  final String state;
  final String country;
  final String email;
  final String phone;

  final StreetTest street;

  const PeopleList(
      {super.key,
      required this.image,
      required this.address,
      required this.city,
      required this.email,
      required this.phone,
      required this.state,
      required this.country,
      required this.street});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details people'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.network(image)],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'House Number : ${street.name}  Streetname : ${street.number}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'city: $city ',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('state: $state'),
          const SizedBox(
            height: 20,
          ),
          Text('country : $country'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              Uri mail = Uri.parse("mailto:$email");
              if (await launchUrl(mail)) {
                //email app opened
              } else {
                //email app is not opened
              }
            },
            child: Text(email),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(phone)
        ],
      ),
    );
  }
}
