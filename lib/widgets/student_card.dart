import 'package:flutter/material.dart';

import '../models/student_model.dart';
import 'student_info_key_value.dart';

class  StudentCardWidget extends StatelessWidget {
  final Student student;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  const StudentCardWidget({super.key, required this.student, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return
Padding(
  padding: const EdgeInsets.all(15.0),
  child: Container(
    width: double.infinity,

    decoration:  BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.red, Colors.green],
        ),
      borderRadius: BorderRadius.circular(15)
    ),
    child: Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StudentItemInfoWidget(title: 'Id', value: student.id.toString()),
        StudentItemInfoWidget(title: 'Name', value: student.name),
        StudentItemInfoWidget(title: 'Email', value: student.email),
        StudentItemInfoWidget(title: 'Phone', value: student.phone),
        StudentItemInfoWidget(title: 'Course', value: student.course),
        StudentItemInfoWidget(title: 'Uni', value: student.uni),
           Row(
             children: [
               Expanded(child: ElevatedButton(onPressed: onDelete, child: const Text('Delete'))),
               const SizedBox(width: 10,),
               Expanded(child: ElevatedButton(onPressed: onUpdate, child: const Text('Update'))),

             ],
           ),

      ],
    ),
  ),
    );
  }
}
