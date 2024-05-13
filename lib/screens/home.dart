// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, unnecessary_import, unused_local_variable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(scrollController: _controller),
      ),
      body: Column(
        children: [
          SearchBar(), // Calling the search bar component
          Expanded(
            child: HorizontalSwiper(),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController scrollController;

  const MyAppBar({Key? key, required this.scrollController}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prime Fitness',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                Text(
                  'Branch: Barakar',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 4),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        // Handle tap on dropdown
                      },
                    ),
                  ],
                  onChanged: (_) {}, // Dummy onChanged to make DropdownButton work
                  icon: SizedBox.shrink(), // Hide the default icon
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18), // Adjust padding
            ),
            icon: Icon(Icons.visibility), // Eye icon
            label: Text('View Listing'),
          ),
        ),
      ],
      automaticallyImplyLeading: false, // Disable back button
    );
  }
}
class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0), // Add vertical margin
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Adjust vertical padding
            hintText: 'Search for customers, bookings',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalSwiper extends StatelessWidget {
  const HorizontalSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
      itemCount: 4,
      height: 200, // Set the height of the swiper
      viewportFraction: 0.8,
      enlargeCenterPage: true, // Enlarge the center page
      aspectRatio: 16 / 9, // Set the aspect ratio
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 200,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, color: Colors.red), // Red circle icon
              SizedBox(height: 8),
              Text(
                '2 Memberships expiring today',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('Remind them now >>>'),
            ],
          ),
        );
      },
    );
  }
}


