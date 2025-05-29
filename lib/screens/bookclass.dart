import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:librix/screens/homescreen.dart';

class Bookclass extends StatefulWidget {
  const Bookclass({super.key});

  @override
  State<Bookclass> createState() => _BookclassState();
}

class _BookclassState extends State<Bookclass> {
  var size, height, width;
  String Batch = 'Arts & humanities';
  String type = 'Group Study';
  bool value = false;

  void showdialogue() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("do you want to book this class"),
              actions: [ElevatedButton(onPressed: () {}, child: Text("Add"))],
            ));
  }

  // List of items in our dropdown menu
  var batchitems = [
    'Arts & humanities',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var typeitems = [
    'Group Study',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 92, 42, 179),
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            "BOOK YOUR CLASS",
            style: TextStyle(
              color: Color.fromARGB(255, 92, 42, 179),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: CarouselSlider(
              items: [
                Material(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7.0,
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://static.vecteezy.com/system/resources/thumbnails/009/459/356/small/woman-school-or-college-teacher-education-worker-standing-near-blackboard-teacher-with-pointer-at-chalkboard-in-classroom-flat-illustration-vector.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(alignment: Alignment.topLeft),
                                Text(
                                  "Arts and Humanities",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 92, 42, 179),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "DRAW & PAINT ARTS",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 92, 42, 179),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "2h 25 min",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 92, 42, 179),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Add other items similarly
              ],
              options: CarouselOptions(
                height: height / 4,
                autoPlay: true,
                aspectRatio: 1 / 10,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: Duration(milliseconds: 80),
                viewportFraction: 0.4,
              ),
            ),
          ),
          SizedBox(
            height: height / 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0, right: 75),
                child: Text(
                  "Select Class",
                  style: TextStyle(
                    color: Color.fromARGB(255, 92, 42, 179),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                "Class Type",
                style: TextStyle(
                  color: Color.fromARGB(255, 92, 42, 179),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Container(
                  height: height / 14,
                  width: width / 2.3,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 92, 42, 179),
                      borderRadius: BorderRadius.circular(7)),
                  child: DropdownButton(
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    // Initial Value
                    value: Batch,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: batchitems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        Batch = newValue!;
                      });
                    },
                    dropdownColor: Color.fromARGB(255, 92, 42, 179),
                    iconEnabledColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: height / 14,
                width: width / 2.7,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 92, 42, 179),
                    borderRadius: BorderRadius.circular(7)),
                child: DropdownButton(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  // Initial Value
                  value: type,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: typeitems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      type = newValue!;
                    });
                  },
                  dropdownColor: Color.fromARGB(255, 92, 42, 179),
                  iconEnabledColor: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20),
            child: Text(
              "Arts & humanities",
              style: TextStyle(
                color: Color.fromARGB(255, 92, 42, 179),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: CarouselSlider(
              items: [
                InkWell(
                    child: Material(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                            )
                          ],
                        ),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://static.vecteezy.com/system/resources/thumbnails/009/459/356/small/woman-school-or-college-teacher-education-worker-standing-near-blackboard-teacher-with-pointer-at-chalkboard-in-classroom-flat-illustration-vector.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.topLeft),
                                    Text(
                                      "Arts and Humanities",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 92, 42, 179),
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "DRAW & PAINT ARTS",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 92, 42, 179),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "2h 25 min",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 92, 42, 179),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("DO YOU WANT TO ADD THIS CLASS?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 92, 42, 179),
                                        fontSize: 15)),
                                actions: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        disabledBackgroundColor: Colors.grey,
                                        backgroundColor:
                                            Color.fromARGB(255, 92, 42, 179),
                                      ),
                                      onPressed: () {},
                                      child: Text("ADD",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)))
                                ],
                              ));
                    }),
                // Add other items similarly
              ],
              options: CarouselOptions(
                height: height / 4,
                autoPlay: true,
                aspectRatio: 1 / 10,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: Duration(milliseconds: 80),
                viewportFraction: 0.4,
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (bool? newvalue) {
                  setState(() {
                    value = newvalue!;
                  });
                },
                activeColor: Colors.black,
              ),
              Padding(padding: EdgeInsets.only(left: 4)),
              Text("Are you sure with the selected class?")
            ],
          ),
          Center(
              child: SizedBox(
            width: width / 1.5,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Colors.grey,
                  backgroundColor: Color.fromARGB(255, 92, 42, 179),
                ),
                onPressed: (value != false)
                    ? () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Homrscreen()))
                    : null,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                )),
          ))
        ],
      ),
    );
  }
}
