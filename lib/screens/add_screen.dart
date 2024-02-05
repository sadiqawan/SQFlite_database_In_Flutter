import 'package:flutter/material.dart';
import 'package:sqflite_assign/util/datastore_dropdown_litms.dart';
import 'package:sqflite_assign/widgets/text_form_fild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = course[0];
  String _selectedUni = uni[0];
  late String name, email, phone;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add students '),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              CustomTextField(
                  keybordType: TextInputType.text,
                  hintText: 'Enter Student Name',
                  labelText: 'Name',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter Student name';
                    } else {
                      name = text;
                      return null;
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  keybordType: TextInputType.emailAddress,
                  hintText: 'Enter your Email',
                  labelText: 'Email',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter your email';
                    } else {
                      email = text;
                      return null;
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  keybordType: TextInputType.phone,
                  hintText: 'Phone No',
                  labelText: 'Phone',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter phone No';
                    } else {
                      if (text.length < 11) {
                        return 'Provide valid No';
                      } else {
                        phone = text;
                        return null;
                      }
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                value: _selectedValue,
                hint: const Text(
                  'choose one',
                ),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "can't empty";
                  } else {
                    return null;
                  }
                },
                items: course.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                value: _selectedUni,
                hint: const Text(
                  'choose one',
                ),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _selectedUni = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _selectedUni = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "can't empty";
                  } else {
                    return null;
                  }
                },
                items: course.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                width: double.infinity,
                height: 25,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text('Save')),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 25,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('View All')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
