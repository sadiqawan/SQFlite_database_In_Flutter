import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite_assign/dbs/database_halper.dart';
import 'package:sqflite_assign/models/student_model.dart';
import 'package:sqflite_assign/screens/list_screen.dart';
import 'package:sqflite_assign/util/const_file.dart';
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
        title: const Center(child: Text('Add students ')),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                      if (text.length == 11) {
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
                items: uni.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        // Save student
                        Student student = Student(
                          name: name,
                          email: email,
                          phone: phone,
                          course: _selectedValue,
                          uni: _selectedUni,
                        );

                        int result = await DatabaseHelper.instance.saveStudent(student);

                        if( result > 0 ){
                          print(result);

                          Fluttertoast.showToast(msg: 'Record Saved', backgroundColor: Colors.green);

                          formKey.currentState!.reset();
                          setState(() {

                          });
                        }else{
                          print(result);
                          Fluttertoast.showToast(msg: 'Failed', backgroundColor: Colors.red);

                        }
                      }
                    },
                    child: const Text('Save')),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StudentListScreen()));
                    }, child: const Text('View All')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
