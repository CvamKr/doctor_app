import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'doctor_card.dart';

class AppoinmentCard extends StatelessWidget {
  Color lineColor;
  AppoinmentCard({
    super.key,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showdetailModel(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 3, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset in the vertical direction
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 16, bottom: 16),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 4,
                decoration: BoxDecoration(
                  color: lineColor,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Appoinment Date",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.watch_later_outlined),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Wed Nov 20 8:00 am - 8:30am",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    DoctorCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showdetailModel(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
            height: MediaQuery.of(context).size.height /
                0.5, // Adjust the height as needed
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 50,
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Summary',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 32.0,
                    ),
                    child: DoctorCard(),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    "Doctor's Advice",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  buildAdviceTexts('Drink 4 liters of Water a Day'),
                  buildAdviceTexts('Drink 4 liters of Water a Day'),
                  buildAdviceTexts('Drink 4 liters of Water a Day'),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    "Discharge",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      buildPdfImage('File 1'),
                      buildPdfImage('File 2'),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }

  buildPdfImage(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 16),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light grey background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://play-lh.googleusercontent.com/1EgLFchHT9oQb3KME8rzIab7LrOIBfC14DSfcK_Uzo4vuK-WYFs9dhI-1kDI7J0ZNTDr', // Replace with your image URL
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAdviceTexts(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(text)
        ],
      ),
    );
  }
}
