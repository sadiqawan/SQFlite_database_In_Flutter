import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite_assign/dbs/database_halper.dart';
import 'package:sqflite_assign/models/student_model.dart';
import 'package:sqflite_assign/util/const_file.dart';
import 'package:sqflite_assign/util/datastore_dropdown_litms.dart';
import 'package:sqflite_assign/widgets/text_form_fild.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.student});

  final Student student;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String _selectedValue = course[0];
  String _selectedUni = uni[0];
  late String name, email, phone;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _selectedUni = widget.student.uni;
    _selectedValue = widget.student.course;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb6d084),
      appBar: AppBar(
        title: const Text('Update data'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              CustomTextField(
                  initilaValue: widget.student.name,
                  keybordType: TextInputType.text,
                  hintText: 'Enter Student Name',
                  labelText: 'Name',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter Student name';
                    } else {
                      name = text.trim();
                      return null;
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  initilaValue: widget.student.email,
                  keybordType: TextInputType.emailAddress,
                  hintText: 'Enter your Email',
                  labelText: 'Email',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter your email';
                    } else {
                      email = text.trim();
                      return null;
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  initilaValue: widget.student.phone,
                  keybordType: TextInputType.phone,
                  hintText: 'Phone No',
                  labelText: 'Phone',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter phone No';
                    } else {
                      if (text.length <= 10) {
                        return 'Provide valid No';
                      } else {
                        phone = text.trim();
                        return null;
                      }
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
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
                decoration: const InputDecoration(border: OutlineInputBorder()),
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

                        int result = await DatabaseHelper.instance
                            .updateStudent(student);

                        if (result > 0) {
                          Fluttertoast.showToast(
                              msg: 'Record Updated',
                              backgroundColor: Colors.green);
                          Navigator.pop(context, true);
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Failed', backgroundColor: Colors.red);
                        }
                      }
                    },
                    child: const Text('Update')),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
