import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MembershipReminder extends StatefulWidget {
  @override
  _MembershipReminderState createState() => _MembershipReminderState();
}

class _MembershipReminderState extends State<MembershipReminder> {
  int currentIndex = 0;

  final List<String> membershipItems = [
    '2 Memberships expiring today',
    '3 Memberships expiring soon',
    '1 Membership expiring soon',
    '4 Memberships expiring soon',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjusted container height
      decoration: BoxDecoration(
        color: Colors.white, // Inner background color (white)
        borderRadius: BorderRadius.circular(10.0), // Curved border
        border:
            Border.all(color: Colors.grey.shade300, width: 1.0), // Grey border
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VxSwiper.builder(
            itemCount: membershipItems.length,
            height: 50, // Keeping the original height
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle, // Circular container for icon
                    ),
                    child: Center(
                      child: Icon(
                        Icons.warning, // Bell icon
                        color: index == currentIndex
                            ? Colors.red[500]
                            : Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0), // Spacing between icon and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          membershipItems[index],
                          style: TextStyle(
                            fontSize: 17.0, // Adjusted text size
                            fontWeight: FontWeight.bold,
                            color: index == currentIndex
                                ? Colors.black
                                : Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Remind them now >>',
                          style: TextStyle(
                            fontSize: 13.0, // Adjusted text size
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 35.0, // Adjusted width for circular shape
                    height: 22.0, // Adjusted height for circular shape
                    decoration: BoxDecoration(
                      color: Colors.black, // Black background
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25), // Circular shape
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}/${membershipItems.length}',
                        style: TextStyle(
                          fontSize: 10.0, // Adjusted text size
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text color
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 0.0), // Additional spacing between swiper and dots
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              membershipItems.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                width: 5.0, // Adjusted dot size
                height: 6.0, // Adjusted dot size
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      currentIndex == index ? Colors.black : Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
