import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _task = TextEditingController();
  CollectionReference Todos = FirebaseFirestore.instance.collection("Todos");
  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void addData() {
    final data = {"task": _task.text};
    Todos.add(data);
    _task.clear();
    Navigator.pop(context);
  }

  void addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.grey[350],
          content: TextField(
            controller: _task,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              labelText: "Add Task",
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: addData,
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "TODO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: logout,
              icon: Icon(Icons.logout),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        ),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black,
            padding: EdgeInsets.only(top: 20, bottom: 20),
          ),
          onPressed: addTask,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: StreamBuilder(
            stream: Todos.orderBy("task").snapshots(),
            builder: (context, snapshots) {
              return ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshots.data!.docs[index];
                  return GestureDetector(
                    onLongPress: () {},
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: Colors.grey,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          documentSnapshot["task"],
                        ),
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[300],
                                content: Text(
                                  "Do you want to delete this task?",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("Delete"),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("Cancel"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        trailing: IconButton(
                          onPressed: () {
                            List<String> datas = [
                              documentSnapshot["task"],
                              documentSnapshot.id
                            ];
                            Navigator.pushNamed(
                              context,
                              "/update",
                              arguments: datas,
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 21,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
