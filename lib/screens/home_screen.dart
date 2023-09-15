import 'package:flutter/material.dart';

import 'appoinment_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Image.network(
                "https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg"),
            buildHeaderCard(),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffFEFEFE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              buildOurSerices(),
              buildAppointmentText(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: AppoinmentCard(
                  lineColor: Colors.blue,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Padding buildAppointmentText() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Appoinment",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "See All",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Padding buildHeaderCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Center(
                  child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xffFBFEFB),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.notification_important),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Welcome! \nRajesh",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("how is it going today?"),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                label: const Text(
                  'Urgent Care',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildOurSerices() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Our Services",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildServiceCard(Icons.wind_power_rounded, "Consultations"),
                buildServiceCard(Icons.medication_outlined, "Medicines"),
                buildServiceCard(Icons.car_crash, "Ambulance"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildServiceCard(IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1.0,
                ),
              ),
              child: Icon(
                iconData,
                color: Colors.blue,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
          )
        ],
      ),
    );
  }
}
