import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/model/patient/patient.dart';
import 'package:ehr_mobile/view/screens/TambahPasien.dart';
import 'package:ehr_mobile/view/screens/pemeriksaan.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DaftarPemeriksaan extends StatelessWidget {
  static const Color kButtonColor = Color(0xFF003CC0);

  const DaftarPemeriksaan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Daftar Pemeriksaan'),
        titleTextStyle: GoogleFonts.albertSans(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: _DaftarPemeriksaanScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahPasien(),
            ),
          );
        },
        backgroundColor: kButtonColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _DaftarPemeriksaanScreen extends StatefulWidget {
  @override
  __DaftarPemeriksaanScreenState createState() =>
      __DaftarPemeriksaanScreenState();
}

class __DaftarPemeriksaanScreenState extends State<_DaftarPemeriksaanScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> doctors = [
    {
      "name": "Andrea Notokusumo",
      "gender": "Perempuan",
      "specialization": "Gizi, Umum"
    },
    {
      "name": "Kyle Abii",
      "gender": "Laki-laki",
      "specialization": "Umum, Anak, THT"
    },
    {
      "name": "Andreas Notokusumo",
      "gender": "Laki-laki",
      "specialization": "Ortodonsia, THT"
    },
    {"name": "Catherine Abii", "gender": "Perempuan", "specialization": "THT"},
  ];

  String? _selectedSpecialization;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusColor: AppColor.kButtonColor,
              labelText: 'Nama Pasien, NIK, No. BPJS, ID SatuSehat',
              labelStyle: GoogleFonts.albertSans(color: AppColor.kTextColor),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.kButtonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedSpecialization,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColor.kBackgroundColor,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColor.kButtonColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.medical_information_rounded,
                          color: AppColor.kBackgroundColor),
                    ),
                  ),
                  dropdownColor: AppColor.kButtonColor,
                  style: GoogleFonts.albertSans(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: AppColor.kBackgroundColor,
                    ),
                  ),
                  iconEnabledColor: Colors.white,
                  hint: Center(
                    child: Text(
                      "Spesialisasi",
                      style: GoogleFonts.albertSans(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: AppColor.kBackgroundColor,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  items: <String>['Anak', 'Gigi', 'Gizi', 'Umum', 'THT']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSpecialization = newValue;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColor.kBackgroundColor,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColor.kButtonColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:
                          Icon(Icons.person, color: AppColor.kBackgroundColor),
                    ),
                  ),
                  dropdownColor: AppColor.kButtonColor,
                  style: GoogleFonts.albertSans(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: AppColor.kBackgroundColor,
                    ),
                  ),
                  iconEnabledColor: Colors.white,
                  hint: Center(
                    child: Text(
                      "Gender",
                      style: GoogleFonts.albertSans(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: AppColor.kBackgroundColor,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  items: <String>['Laki-laki', 'Perempuan'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: FirestoreListView(
              query: FirebaseFirestore.instance.collection('patients'),
              itemBuilder: (context, snap) {
                final data = Patient.fromJson(snap.data());

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PemeriksaanPage(
                          patient: data
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15), // Add spacing between items
                    child: Container(
                      height: 114, // Increased height for the container
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.kOffButtonColor,
                      ), // Set background color here
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 65, // Set the width of the square
                              height: 82, // Increased height for the white box
                              decoration: BoxDecoration(
                                color: AppColor.kBackgroundColor,
                                borderRadius:
                                    BorderRadius.circular(6), // Rounded edges
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.name,
                                    style: GoogleFonts.albertSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    data.sex,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.albertSans(
                                      fontSize: 14,
                                      color: AppColor.kTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(
                                  6), // Adjust padding as needed
                              decoration: BoxDecoration(
                                color: AppColor
                                    .kBackgroundColor, // White background color
                                shape: BoxShape.circle, // Circular shape
                              ),
                              child: Icon(Icons.chevron_right,
                                  color: AppColor.kTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
