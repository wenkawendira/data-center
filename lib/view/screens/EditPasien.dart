import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehr_mobile/model/patient/patient.dart';
import 'package:ehr_mobile/view/screens/DaftarPemeriksaan.dart';
import 'package:flutter/material.dart';
import '../components/textinputfield.dart';
import '../components/pagebutton.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/main.dart';

class Editpasien extends StatelessWidget {
  final String patientID;
  const Editpasien({super.key, required this.patientID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pasien'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Main()),
            );
          },
        ),
      ),
      body: _EditpasienScreen(patientID: patientID,),
    );
  }
}

class _EditpasienScreen extends StatefulWidget {
  final String patientID;
  const _EditpasienScreen({required this.patientID});

  @override
  __EditpasienScreenState createState() => __EditpasienScreenState();
}

class __EditpasienScreenState extends State<_EditpasienScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _bpjsController = TextEditingController();
  final TextEditingController _satuSehatController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  DateTime? _selectedDate; // Variable to store selected date

  // Function to show date picker and update selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Update the text in your TextField accordingly
        _dobController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  final TextEditingController _dobController =
      TextEditingController(); // Controller for Date of Birth

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: AppColor.kOffButtonColor,
                  child: Icon(Icons.person, size: 100, color: AppColor.kOffTextColor),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Handle change photo action
                  },
                  child:
                      Text('Ganti Foto', style: TextStyle(color: AppColor.kOffTextColor)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextInputField(
            hintText: 'Nama Lengkap',
            controller: _nameController,
          ),
          const SizedBox(height: 16),
          TextInputField(
            hintText: 'Nomor Telepon',
            controller: _phoneController,
          ),
          const SizedBox(height: 16),
          TextInputField(
            hintText: 'Jenis Kelamin',
            controller: _genderController,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    hintText: 'Tanggal Lahir',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextInputField(
                  hintText: 'Umur',
                  controller: _ageController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextInputField(
            hintText: 'NIK',
            controller: _nikController,
          ),
          const SizedBox(height: 16),
          TextInputField(
            hintText: 'Nomor BPJS',
            controller: _bpjsController,
          ),
          const SizedBox(height: 16),
          TextInputField(
            hintText: 'ID SatuSehat',
            controller: _satuSehatController,
          ),
          const SizedBox(height: 16),
          PageButton(
            onTap: () async {
              // Handle save action
              await FirebaseFirestore.instance
                  .collection('patients')
                  .doc(widget.patientID)
                  .update(
                    Patient(
                            name: _nameController.text,
                            phone: _phoneController.text,
                            sex: _genderController.text,
                            birthdate: DateTime.parse(_dobController.text),
                            age: int.parse(_ageController.text),
                            nik: int.parse(_nikController.text),
                            bpjs: int.parse(_bpjsController.text),
                            satusehat:int.parse(_satuSehatController.text),
                            image: "")
                        .toJson(),
                  )
                  .then((val) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DaftarPemeriksaan(),
                  ),
                );
              });
            },
            text: 'Simpan',
          ),
        ],
      ),
    );
  }
}
