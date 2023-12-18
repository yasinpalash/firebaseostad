import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseStudentApp extends StatelessWidget {
  const FirebaseStudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StudentList(),
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  List<Student> studentsList=[];

  Future<void> getStudentData() async{
    final QuerySnapshot result=await firebaseFirestore.collection('students').get();
    print(result.size);
    for(QueryDocumentSnapshot element in result.docs){
      print(element.data());
      print(element.get('name'));
      Student student=Student(element.get('name'), int.tryParse(element.get('roll').toString())??0);
      studentsList.add(student);
    }
    if(mounted){
      setState(() {
        
      });
    }
  }
@override
  void initState() {
    super.initState();
    getStudentData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: ListView.builder(
          itemCount: studentsList.length,
          itemBuilder: (context, index) {
            return  ListTile(
              leading: CircleAvatar(
                child: Text(studentsList[index].roll.toString()),
              ),
              title: Text(studentsList[index].name),
            );
          }),
    );
  }
}

class Student{
   final String name;
  final int roll;
  Student(this.name, this.roll);
}