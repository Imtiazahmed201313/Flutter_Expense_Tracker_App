import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  Color currentColor = Colors.amber;
  String iconSelected = '';

  void changeColor(Color color) => setState(() => currentColor = color);



  List<String> myCategoryIcon = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Expenses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: expenseController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                controller: categoryController,
                readOnly: true,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                bool isExpended = false;
                                Color categoryColor = Colors.white;
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return AlertDialog(
                                    title: Text('Create a category'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  hintText: 'Name',
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          TextField(
                                            onTap: () {
                                              setState(() {
                                                isExpended = !isExpended;
                                              });
                                            },
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                hintText: 'Icon',
                                                suffixIcon: Icon(
                                                  Icons
                                                      .expand_circle_down_outlined,
                                                  color: Colors.grey,
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius: isExpended
                                                        ? BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20))
                                                        : BorderRadius.circular(
                                                            16),
                                                    borderSide:
                                                        BorderSide.none)),
                                          ),
                                          isExpended
                                              ? Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: GridView.builder(
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount:
                                                                  3,),
                                                      itemCount:
                                                          myCategoryIcon.length,
                                                      itemBuilder: (context,
                                                              int index) =>
                                                          GestureDetector(
                                                            onTap: (){
                                                              setState((){
                                                                iconSelected = myCategoryIcon[index];
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  border: Border.all(width: 3,
                                                                    color: iconSelected == myCategoryIcon[index] ? Colors.green : Colors.black
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(10.0),
                                                                  child: Container(
                                                                    child: Padding(
                                                                      padding: EdgeInsets.all(5),

                                                                    ),
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration: BoxDecoration(

                                                                        image: DecorationImage(
                                                                            image: AssetImage(
                                                                                'assets/${myCategoryIcon[index]}.png'))),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                )
                                              : Container(),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          TextField(
                                            readOnly: true,
                                            onTap: () {
                                              showDialog(
                                                  context: (context),
                                                  builder: (context2) {
                                                    return AlertDialog(
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [ColorPicker(pickerColor: categoryColor, onColorChanged: (value){
                                                          setState((){
                                                            categoryColor = value;
                                                          });
                                                        }),
                                                          SizedBox(
                                                            height: 50,
                                                            width:
                                                                double.infinity,
                                                            child: TextButton(
                                                                style: TextButton.styleFrom(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                12)),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black),
                                                                onPressed: () {

                                                                  print(categoryColor);
                                                                  Navigator.pop(
                                                                      context2);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Save',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Color',
                                                filled: true,
                                                fillColor: categoryColor,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    borderSide:
                                                        BorderSide.none)),
                                          ),
                                          SizedBox(height: 16,),
                                          SizedBox(
                                            height: 50,
                                            width:
                                            double.infinity,
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                    backgroundColor:
                                                    Colors
                                                        .black),
                                                onPressed: () {
                                                },
                                                child:
                                                const Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      fontSize:
                                                      22,
                                                      color: Colors
                                                          .white),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              });
                        },
                        icon: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    hintText: 'Category',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.list,
                      size: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 16,
              ),

              TextField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)));
                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Date',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.clock,
                      size: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
