import 'package:doctor_app/screens/appoinment_card.dart';
import 'package:flutter/material.dart';

class ScheduleAppoinment extends StatelessWidget {
  const ScheduleAppoinment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                const Text(
                  "Schedule",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.notification_important),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.maxFinite, // Full width
              padding: const EdgeInsets.all(6.0), // Optional padding
              decoration: BoxDecoration(
                color: Color(0xffF7F8FD),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Center(
                      child: const Text(
                        'Upcoming',
                        style: TextStyle(
                          color: Colors.black, // Text color
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 72, vertical: 8),
                        child: Text("Past"),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 3, // Blur radius
                            offset: const Offset(
                                0, 3), // Offset in the vertical direction
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(30.0), // Rounded corners
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppoinmentCard(lineColor: Colors.green),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
