import 'package:flutter/material.dart';
import 'package:students_app/student.dart';

class StudentCard extends StatefulWidget {
  Student std;
  VoidCallback deleteStudent;
  StudentCard({
    required this.deleteStudent,
    required this.std,
    super.key,
  });

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => widget.deleteStudent(),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('student info:'),
            content: Text(widget.std.toString()),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('ok'),
              ),
            ],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 120,
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Name: ',
                          style:
                              TextStyle(fontSize: 22, color: Colors.blueAccent),
                        ),
                        Text(
                          widget.std.name,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'ID: ',
                          style:
                              TextStyle(fontSize: 22, color: Colors.blueAccent),
                        ),
                        Text(
                          widget.std.id,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.std.fav = !widget.std.fav;
                        });
                      },
                      icon:
                          Icon(widget.std.fav ? Icons.star : Icons.star_border),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/person.jpg',
                  height: 80,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
