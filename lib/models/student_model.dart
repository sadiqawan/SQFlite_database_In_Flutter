import 'package:sqflite_assign/util/const_file.dart';

class Student {
  late int? id;
  late String name;
  late String email;
  late String phone;
  late String uni;
  late String course;

  Student(
      {required this.name,
      required this.email,
      required this.phone,
      required this.course,
      required this.uni,
      this.id});

  // Convert Student Object to Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      colId: id,
      colName: name,
      colEmail: email,
      colMobile: phone,
      colCourse: course,
      colUni: uni
    };

    return map;
  }
  Student.fromMap (Map<String, dynamic> map){

    id =  map[colId];
    name = map[colName];
    email= map[colEmail];
    phone = map[colMobile];
    course= map[colCourse];
    uni= map[colUni];
  }
}
