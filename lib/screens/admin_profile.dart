import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taasa_life/screens/main_screen.dart';

import '../decortaions/styles.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  bool? _checkBox = false;
  bool? _checkBox2 = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final healthController = TextEditingController();

  String? _index = '';
  final List countries = [
    'Doctor',
    'Nurse',
    'Dentist',
    'Pharmacist',
    'Nutritionist',
    'Gym Trainer',
    'Mid Wife',
    'Surgeon',
    'Veterinarian',
    'Physician',
    'Home health Aid',
    'Psychiatrist'
  ];
  _AdminProfileScreenState() {
    _index = countries[0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: Decorations.bgDecoration,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_backspace_rounded,
                  size: 30,
                ),
                label: const Text(''),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                      child: TextFormField(
                    controller: nameController,
                    decoration: Decorations.decoration
                        .copyWith(label: const Text('Names')),
                    validator: (value) =>
                        value!.isEmpty ? 'Please provide full names' : null,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            child: Text('Male'),
                          ),
                          SizedBox(
                            child: Checkbox(
                                activeColor: Colors.white,
                                side: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 45, 103, 129),
                                  strokeAlign: 2,
                                ),
                                checkColor:
                                    const Color.fromARGB(255, 45, 103, 129),
                                value: _checkBox,
                                onChanged: (val) {
                                  setState(() {
                                    _checkBox = val;
                                  });
                                }),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            child: Text('Female'),
                          ),
                          SizedBox(
                            child: Checkbox(
                                activeColor: Colors.white,
                                side: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 45, 103, 129),
                                  strokeAlign: 2,
                                ),
                                checkColor:
                                    const Color.fromARGB(255, 45, 103, 129),
                                value: _checkBox2,
                                onChanged: (val2) {
                                  setState(() {
                                    _checkBox2 = val2;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      child: IntlPhoneField(
                    controller: phoneController,
                    decoration: Decorations.decoration
                        .copyWith(label: const Text('Phone Number')),
                    validator: (value) => value!.completeNumber.isEmpty
                        ? 'Please provide phone number'
                        : null,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      child: TextFormField(
                    controller: addressController,
                    decoration: Decorations.decoration
                        .copyWith(label: const Text('Address')),
                    validator: (value) =>
                        value!.isEmpty ? 'Provide Address' : null,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: Text(
                          'Profession',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 45, 103, 129)),
                        ),
                      ),
                      SizedBox(
                        child: DropdownButton(
                          alignment: Alignment.topRight,
                          value: _index,
                          underline: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(style: BorderStyle.none))),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          icon: const Icon(Icons.arrow_drop_down),
                          dropdownColor: const Color.fromARGB(0, 24, 24, 24),
                          items: countries
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _index = val as String;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      child: TextFormField(
                    controller: healthController,
                    decoration: Decorations.decoration
                        .copyWith(label: const Text('Health center type?')),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainScreen(profession: _index)));
                        },
                        child: const Text('Continue')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
