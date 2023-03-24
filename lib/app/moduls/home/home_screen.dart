import 'dart:convert';

import 'package:employee_app/global/constants/sizeConstant.dart';
import 'package:employee_app/global/widgets/app_text.dart';
import 'package:employee_app/global/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "Add Employee";
  var responseData ;

  void initState() {
    print("____________________________");
    HomeApi();
    super.initState();
  }

  Future<void> HomeApi() async {
    var headers = {
      'X-Access-Token':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vZXhhbXBsZS5vcmciLCJhdWQiOiJodHRwOi8vZXhhbXBsZS5jb20iLCJpYXQiOjEzNTY5OTk1MjQsIm5iZiI6MTM1NzAwMDAwMCwiZGF0YSI6eyJpZCI6IjEiLCJDb21wYW55IE5hbWUiOiJ0ZXN0MTEiLCJDb250YWN0IFBlcnNvbiI6InRlc3QifX0._lH2iYmhAexFCY5oJp6ocFDPrLeJfS-9Mod8e03CsjA',
      'Cookie': 'PHPSESSID=fe48c52ef7c77258e4d0299222bef1e3'
    };

    var url = Uri.parse('https://devapi.employeetrackingsolutions.com/company/get-employee-list?show=10&searchName=&page=');
    http.Response response = await http.get(url, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    responseData =json.decode(response.body);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(
      context,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drowe(context),
        appBar: AppBar(
          centerTitle: true,
          //leadingWidth: MySize.size70,
          elevation: 0.5,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.calendar_view_day,
            size: MySize.size35,
            color: Colors.black,
          ),
          title: AppText(text: "Employee", fontWeight: FontWeight.w500, size: MySize.getScaledSizeHeight(20.00), txtColor: Colors.black),

          actions: [
            Padding(
              padding: EdgeInsets.only(right: MySize.getScaledSizeWidth(24.00)),
              child: Image(
                image: const AssetImage("assets/images/png/profil.png"),
                fit: BoxFit.contain,
                height: MySize.size35,
                width: MySize.size35,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(27.00)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.height(45),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          hintText: "Search..",
                          maxLines: 1,
                          iconButton: const Icon(
                            Icons.search,
                            color: Colors.green,
                          ),
                          tcPadding: 6,
                          bcPadding: 6,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: AppTextField(
                          hintText: "Select..",
                          maxLines: 1,
                          iconButton: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.green,
                          ),
                          tcPadding: 6,
                          bcPadding: 6,
                        ),
                      ),
                    ],
                  ),
                  Space.height(10),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          hintText: "Search..",
                          maxLines: 1,
                          iconButton: const Icon(
                            Icons.search,
                            color: Colors.green,
                          ),
                          tcPadding: 6,
                          bcPadding: 6,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: AppTextField(
                          hintText: "Select..",
                          maxLines: 1,
                          iconButton: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.green,
                          ),
                          tcPadding: 6,
                          bcPadding: 6,
                        ),
                      ),
                    ],
                  ),
                  Space.height(20),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            text = "Add Employee";
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: text == "Add Employee" ? Colors.green : Colors.blue,
                              border: Border.all(
                                color: text == "Add Employee" ? Colors.green : Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(14.00), vertical: MySize.getScaledSizeWidth(8.00)),
                              child: AppText(
                                text: "Add Employee",
                                size: 14.0,
                                txtColor: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            text = "Print";
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: text == "Print" ? Colors.green : Colors.blue,
                              border: Border.all(color: text == "Print" ? Colors.green : Colors.blue),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(14.00), vertical: MySize.getScaledSizeWidth(8.00)),
                              child: AppText(
                                text: "Print",
                                size: 14.0,
                                txtColor: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Space.height(10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            text = "Export to csv";
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: text == "Export to csv" ? Colors.green : Colors.blue,
                              border: Border.all(
                                color: text == "Export to csv" ? Colors.green : Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(14.00), vertical: MySize.getScaledSizeWidth(8.00)),
                              child: FittedBox(
                                child: AppText(
                                  maxLine: 1,
                                  text: "Export to csv",
                                  size: 14.0,
                                  txtColor: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            text = "Export to Excel";
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: text == "Export to Excel" ? Colors.green : Colors.blue,
                              border: Border.all(
                                color: text == "Export to Excel" ? Colors.green : Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(14.00), vertical: MySize.getScaledSizeWidth(8.00)),
                              child: FittedBox(
                                child: AppText(
                                  maxLine: 1,
                                  text: "Export to Excel",
                                  size: 14.0,
                                  txtColor: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            text = "Export to PDF";
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: text == "Export to PDF" ? Colors.green : Colors.blue,
                              border: Border.all(
                                color: text == "Export to PDF" ? Colors.green : Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(14.00), vertical: MySize.getScaledSizeWidth(8.00)),
                              child: FittedBox(
                                child: AppText(
                                  maxLine: 1,
                                  text: "Export to PDF",
                                  size: 14.0,
                                  txtColor: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Space.height(15),
                  responseData==null?const Center(child: CupertinoActivityIndicator()):
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: responseData["data"]["List"].length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(16.00)),
                        //height: MySize.size280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(14.00), vertical: MySize.getScaledSizeHeight(10.00)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    maxLine: 1,
                                    text: "${responseData["data"]["List"][index]["employee_name"]}",
                                    size: 15.0,
                                    txtColor: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Space.height(6),
                                  AppText(
                                    maxLine: 1,
                                    text: "Department: ${responseData["data"]["List"][index]["department"]}",
                                    size: 15.0,
                                    txtColor: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Space.height(6),
                                  AppText(
                                    maxLine: 1,
                                    text: "email: ${responseData["data"]["List"][index]["email"]}",
                                    size: 15.0,
                                    txtColor: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Space.height(6),
                                  AppText(
                                    maxLine: 1,
                                    text: "Total Hours: ${responseData["data"]["List"][index]["total_hrs"]??""}",
                                    size: 15.0,
                                    txtColor: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Space.height(6),
                                  AppText(
                                    maxLine: 1,
                                    text: "View Atendance",
                                    size: 15.0,
                                    txtColor: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      // border: Border.all(color: Colors.blue),
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeWidth(6.00)),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      // border: Border.all(color: Colors.blue),
                                      color: Colors.deepOrange,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeWidth(6.00)),
                                      child: const Icon(Icons.location_on_outlined, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      // border: Border.all(color: Colors.blue),
                                      color: Colors.blue,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeWidth(6.00)),
                                      child: const Icon(Icons.book, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      // border: Border.all(color: Colors.blue),
                                      color: Colors.green,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeWidth(6.00)),
                                      child: const Icon(Icons.call, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      // border: Border.all(color: Colors.blue),
                                      color: Colors.blue,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeWidth(6.00)),
                                      child: const Icon(Icons.play_arrow, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      // border: Border.all(color: Colors.blue),
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeWidth(6.00)),
                                      child: const Icon(Icons.delete, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Drowe(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Space.height(20),
            ListTile(
              leading: Image(image: const AssetImage("assets/images/png/profil.png"), height: MySize.size42, width: MySize.size45),
              title: AppText(text: "R A D H I K A", fontWeight: FontWeight.w600, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.black),
              subtitle: AppText(text: "radhika@gmail.com", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(14.00), txtColor: Colors.black),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: AppText(text: "D A S H B O R D", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.black),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: AppText(text: "M A S S A G E", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.black),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(Icons.favorite),
                title: AppText(text: "S E T T I N G", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.black),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: AppText(text: "L O G O U T", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
