import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_mobile_ads/google_mobile_ads.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  late String cmd;
  late String data = "OUTPUT";
  void cgi() async {
    var r = await http
        .get(Uri.http("65.2.142.10", "/cgi-bin/docker.py", {"x": cmd}));
    data = r.body.toString();
    setState(() {
      data;
      print(data);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("LINUX TERMINAL"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.network(
                    "https://image.flaticon.com/icons/png/512/518/518713.png"),
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value) {
                    cmd = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Your Command",
                  ),
                ),
              ),
                     Container(
                  child: TextButton(
                onPressed: cgi,
                child: Text(
                "SUBMIT",
                style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                ),
              ),
              Container(

              ),
              Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  width: 1300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[400],
                  ),
                  child: Center(
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "$data",
                            
                            style: TextStyle(
                                color: Colors.white,fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
