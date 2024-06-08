import 'package:ehr_mobile/view/screens/DaftarPemeriksaan.dart';
import 'package:ehr_mobile/view/screens/ProfilePerawat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ehr_mobile/model/constraints.dart';
import '../components/navbar.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 1;
  String _selectedMonthYear = "January 2024";

  static const List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static const List<int> _years = [2022, 2023, 2024, 2025, 2026];

  late List<String> _monthYearOptions;

  @override
  void initState() {
    super.initState();
    _monthYearOptions = _generateMonthYearOptions();
  }

  List<String> _generateMonthYearOptions() {
    List<String> options = [];
    for (int year in _years) {
      for (String month in _months) {
        options.add("$month $year");
      }
    }
    return options;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _selectedIndex == 0
          ? const DaftarPemeriksaan()
          : _selectedIndex == 1
              ? Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35.0, left: 20.0),
                            child: RichText(
                              text: TextSpan(
                                text: "Hi, Perawat ",
                                style: GoogleFonts.albertSans(
                                    fontSize: 20, color: AppColor.kTextColor),
                                children: [
                                  TextSpan(
                                    text: FirebaseAuth.instance.currentUser!.displayName,
                                    style: GoogleFonts.albertSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 35.0, right: 35.0),
                              child: Icon(
                                Icons.supervised_user_circle_rounded,
                                color: AppColor.kOffButtonColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: ClipPathClass(),
                            child: SizedBox(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0).copyWith(bottom: 0.0),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColor.kButtonColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 150,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal: 5.0), // Adjusted padding
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(Icons.calendar_today,
                                                  size: 16), // Smaller icon
                                              const SizedBox(width: 2),
                                              Expanded(
                                                child: Text(
                                                  _selectedMonthYear,
                                                  style: GoogleFonts.albertSans(
                                                    fontSize: 12, // Smaller font size
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  icon: const Icon(Icons.arrow_drop_down,
                                                      size: 16), // Smaller icon
                                                  value: _selectedMonthYear,
                                                  items: _monthYearOptions
                                                      .map((String option) {
                                                    return DropdownMenuItem<String>(
                                                      value: option,
                                                      child: Text(
                                                        option,
                                                        style: GoogleFonts.albertSans(
                                                          fontSize:
                                                              12, // Smaller font size
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      _selectedMonthYear = newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 150, // Expanded height
                                        margin: const EdgeInsets.only(
                                            bottom: 16.0, top: 16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          "White box content here",
                                          style: GoogleFonts.albertSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Jumlah Pasien (Hari ini)",
                                              style: GoogleFonts.albertSans(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "10 Orang",
                                              style: GoogleFonts.albertSans(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Text(
                                      "Notifikasi",
                                      style: GoogleFonts.albertSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        5, // Change the itemCount according to your requirement
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(bottom: 16.0),
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: AppColor.kOffButtonColor,
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 65,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              // Add your image widget here
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Nama Pasien",
                                                    style: GoogleFonts.albertSans(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "No. Kamar",
                                                    style: GoogleFonts.albertSans(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Nama Dokter",
                                                    style: GoogleFonts.albertSans(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: () {
                                                    // Add your onPressed logic here
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_forward_ios_rounded,
                                                    color: Colors.black,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const Profileperawat(),
      bottomNavigationBar: Navbar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    // Define your clip path points here
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
