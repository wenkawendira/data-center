import 'package:ehr_mobile/model/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/main.dart';

class PemeriksaanPage extends StatefulWidget {
  final Patient patient;
  const PemeriksaanPage({super.key, required this.patient});

  @override
  State<PemeriksaanPage> createState() => _PemeriksaanPageState();
}

class _PemeriksaanPageState extends State<PemeriksaanPage> {
  @override
  Widget build(BuildContext context) {
    var widget2 = widget;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Pemeriksaan",
          style: GoogleFonts.albertSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
              height: 2), // Add spacing between app bar and container
          Center(
            child: Card(
              color: AppColor.kButtonColor,
              margin: const EdgeInsets.symmetric(horizontal: 35.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.patient.name,
                          style: GoogleFonts.albertSans(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 7.0),
                        Text(
                          widget.patient.sex,
                          style: GoogleFonts.albertSans(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          widget.patient.age.toString() + " Tahun",
                          style: GoogleFonts.albertSans(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              children: [
                Text(
                  "Informasi Pasien",
                  style: GoogleFonts.albertSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: Icon(
                    Icons.edit_rounded,
                    size: 20,
                    color: AppColor.kTextColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Main()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: _buildPatientInfoSection(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildStatusSection(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildStatusCard(),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildPatientInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow("NIK", widget.patient.nik as String),
                  _buildInfoRow("Tanggal Lahir", widget.patient.birthdate as String),
                  _buildInfoRow("ID Satu Sehat", widget.patient.satusehat as String),
                ],
              ),
            ),
            const SizedBox(width: 1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow("Nomor Telepon", widget.patient.phone),
                  _buildInfoRow("Nomor BPJS", widget.patient.bpjs as String),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: GoogleFonts.albertSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.albertSans(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Status Pasien",
          style: GoogleFonts.albertSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle add status action
            },
            icon: const Icon(Icons.add, size: 16, color: Colors.white),
            label: Text(
              "Tambah Patient",
              style: GoogleFonts.albertSans(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.kButtonColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.kButtonColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusHeader(),
              const SizedBox(height: 10),
              _buildStatusDetail(
                  "Keluhan", "Tiba-tiba tensi naik dan sakit kepala"),
              const SizedBox(height: 10),
              _buildStatusDetail("Keterangan",
                  "Tadi sudah diberikan infus, tolong dicek kembali beberapa saat lagi"),
              const SizedBox(height: 10),
              _buildStatusFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "20/05/2024",
              style: GoogleFonts.albertSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "20:10:15",
              style: GoogleFonts.albertSans(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(0.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.kButtonColor, // Set border color to blue
              width: 1.5, // Set border width
            ),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              // Handle arrow action
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatusDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.albertSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.kOffButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            value,
            style: GoogleFonts.albertSans(fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatusFooterDetail("PIC", "Angelika Alimin"),
        _buildStatusFooterDetail("Jadwal Lanjutan", "22/05/2024"),
      ],
    );
  }

  Widget _buildStatusFooterDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.albertSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10),
          width: 120,
          decoration: BoxDecoration(
            color: AppColor.kOffButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            value,
            style: GoogleFonts.albertSans(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
