// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, unnecessary_import, unused_local_variable, sort_child_properties_last
import 'package:fitness_app/screens/Overview.dart';
import 'package:flutter/material.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import './membership_reminder.dart';
import 'package:fitness_app/screens/Bottomnavigation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
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
          SearchBar(),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              top: 2.0,
              right: 18.0,
            ),
            child: MembershipReminder(),
          ),
          SizedBox(height: 15),
          QuickActionsMenu(),
          SizedBox(height: 10),
          buildOverviewAndDropDown(),
          SizedBox(height: 0),
          DashboardStats(),
        ],
      ),
      bottomNavigationBar: buildCustomBottomNavigationBar(
        selectedIndex: _selectedIndex, // Set the initial selected index
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
                  onChanged:
                      (_) {}, // Dummy onChanged to make DropdownButton work
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
          child: TextButton.icon(
            onPressed: () {
              // Handle button press
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white, // Set background color to white
              foregroundColor: Colors
                  .grey.shade700, // Set foreground color (icon & text) to black
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(40.0), // Adjust border radius
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 7, horizontal: 15), // Adjust padding
            ),
            icon: Icon(Icons.visibility), // Eye icon
            label: Text('View Listing'),
          ),
        ),
      ],
      automaticallyImplyLeading: false, // Disable back button
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Use two slightly different yellow colors for a smoother transition
            colors: [
              Color(0xFFfae03e), // Yellow color
              Color(0xFFfffaeb), // Lighter yellow color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300), // Thin grey border
        ),
        child: TextField(
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            hintText: 'Search for customers, bookings',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 35),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

/*
class HorizontalSwiper extends StatelessWidget {
  const HorizontalSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
      itemCount: 4,
      height: 100, // Set the height of the swiper
      viewportFraction: 0.8,
      enlargeCenterPage: true, // Enlarge the center page
      // Set the aspect ratio
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(3),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, color: Colors.red), // Red circle icon
              SizedBox(height: 10),
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
*/

class QuickActionsMenu extends StatelessWidget {
  const QuickActionsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          margin: EdgeInsets.only(left: 18.0, right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.5),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 0.9599,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickAction(
                    icon: Icons.person_add,
                    label: 'Add\nMember',
                  ),
                  _buildQuickAction(
                    icon: Icons.fitness_center,
                    label: 'Add\nP.T',
                  ),
                  _buildQuickAction(
                    icon: Icons.bookmark,
                    label: 'Add\nSale',
                  ),
                  _buildQuickAction(
                    icon: Icons.account_balance_wallet,
                    label: 'Add\nExpense',
                  ),
                ],
              ),
              SizedBox(height: 11),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAction({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.yellow.shade500,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 29,
              color: Colors.grey.shade900,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
