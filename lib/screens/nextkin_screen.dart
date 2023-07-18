import 'package:flutter/material.dart';
import 'package:taasa_life/screens/insurance.dart';

import '../decortaions/styles.dart';
import '../providers/profile.dart';

class NextKinScreen extends StatefulWidget {
  const NextKinScreen({super.key});

  @override
  State<NextKinScreen> createState() => _NextKinScreenState();
}

class _NextKinScreenState extends State<NextKinScreen> {
  final List<Profile> listedNames = [
    Profile(name: 'Name', phone: 'Number', address: 'Address'),
  ];

  addMember(String names, String phoneNumber, String addresses) {
    final newMember =
        Profile(name: names, phone: phoneNumber, address: addresses);
    setState(() {
      listedNames.add(newMember);
    });
  }

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: const Center(
        //     child: Text('Profile'),
        //   ),
        // ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: Decorations.bgDecoration,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_rounded),
                          label: const Text('Back')),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const SizedBox(
                      child: Text('Next Of Kin'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Form(
                    child: Column(children: [
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 50,
                              width: 150,
                              child: TextField(
                                controller: _nameController,
                                decoration: Decorations.decoration2
                                    .copyWith(label: const Text('Names')),
                              )),
                          SizedBox(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: TextField(
                                    controller: _phoneController,
                                    decoration: Decorations.decoration2
                                        .copyWith(label: const Text('Number')),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: TextField(
                                    controller: _addressController,
                                    decoration: Decorations.decoration2
                                        .copyWith(label: const Text('Address')),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  addMember(
                                      _nameController.text,
                                      _phoneController.text,
                                      _addressController.text);
                                  _nameController.clear();
                                  _phoneController.clear();
                                  _addressController.clear();
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ))
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: listedNames.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 360,
                              child: Card(
                                color: const Color.fromARGB(255, 63, 123, 151),
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/eme.png'),
                                    radius: 40,
                                  ),
                                  title: Text(listedNames[index].name),
                                  subtitle: Text(
                                    listedNames[index].phone,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 1),
                            SizedBox(
                              child: IconButton(
                                  iconSize: 30,
                                  color: Colors.red,
                                  onPressed: () {
                                    setState(() {
                                      listedNames.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete_outline)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const InsuranceScreen()));
                        },
                        child: const Text('Continue')),
                  )
                ]))
              ],
            )));
  }
}
