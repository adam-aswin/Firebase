import 'package:flutter/material.dart';

class Updatepage extends StatefulWidget {
  const Updatepage({super.key});

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  TextEditingController _task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // padding: EdgeInsets.only(bottom: 13),
              width: MediaQuery.of(context).size.width * .6,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: TextField(
                onTap: () {
                  setState(() {
                    _task.text = data[0];
                  });
                },
                controller: _task,
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "${data[0]}",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.only(
                      top: 20, bottom: 20, left: 15, right: 15)),
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
