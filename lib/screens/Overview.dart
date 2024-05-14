import 'package:flutter/material.dart';

Widget buildOverviewAndDropDown() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 2, right: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Overview",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 21,
            color: Colors.grey.shade400,
          ),
        ),
        SizedBox(width: 20), // Added space between texts for visual balance
        DropdownButton<String>(
          icon: Icon(Icons.keyboard_arrow_down,
              color: Colors.grey, size: 16), // Adjusted arrow size and color
          underline: Container(), // Removed underline
          style: TextStyle(
              fontSize: 14,
              color: Colors
                  .grey), // Adjusted font size and color for dropdown item
          items: <String>['This Week', 'Last Week', 'Custom Range']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.grey),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Handle dropdown value change
          },
          value: "This Week", // Initial value
        ),
      ],
    ),
  );
}

class DashboardStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 18), // Left space
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Members',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 16),
                          color: Colors.grey.shade600,
                          onPressed: () {
                            // Handle button press
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '300',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Sales',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 16),
                          color: Colors.grey.shade600,
                          onPressed: () {
                            // Handle button press
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '₹25000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 18), // Right space
          ],
        ),
        SizedBox(height: 10), // Space between rows
        Row(
          children: [
            SizedBox(width: 18), // Left space
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Active PT',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 16),
                          color: Colors.grey.shade600,
                          onPressed: () {
                            // Handle button press
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '17',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gym Views',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 16),
                          color: Colors.grey.shade600,
                          onPressed: () {
                            // Handle button press
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '189',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 18), // Right space
          ],
        ),
        SizedBox(height: 20), // Space below the rows
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              // Handle view all button press
            },
            child: Text(
              'View All',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
