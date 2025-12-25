import 'package:aqi_monitor/controller/service.dart';
import 'package:aqi_monitor/model/health_measures.dart';
import 'package:aqi_monitor/view/aqi_bar.dart';
import 'package:aqi_monitor/view/search_field.dart';
import 'package:flutter/material.dart';
import 'package:aqi_monitor/model/aqi_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  String _errorText = "";
  AqiResponse? res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text(
          "AQI Monitor",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          Icon(Icons.info_outline_rounded, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
          
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(
                    searchController: searchController,
                    errorText: _errorText,
                  ),
          
          
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: MediaQuery.widthOf(context) * 0.12,
                    child: IconButton(
                      onPressed: searchForLocation,
                      color: Colors.grey.shade500,
                      icon: Icon(
                        Icons.location_searching_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
          
          
              SizedBox(height: 20),
          
          
              Center(
                child: SizedBox(
                  width: MediaQuery.widthOf(context) * 0.92,
                  height: MediaQuery.heightOf(context) * 0.2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          res == null ? "AQI" : "${res!.data.aqi}",
                          style: TextStyle(
                            fontSize: 75,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          res == null
                              ? ""
                              : HealthMeasures.getAqiLevel(
                            res!,
                          )["status"]!.toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
          
              SizedBox(height: 20),
          
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AqiBar(bgColor: Colors.green, range: "0-50"),
                  AqiBar(bgColor: Colors.yellow, range: "51-100"),
                  AqiBar(bgColor: Colors.orange, range: "101-150"),
                  AqiBar(bgColor: Colors.pink, range: "151-200"),
                  AqiBar(bgColor: Colors.purple, range: "201-300"),
                  AqiBar(bgColor: Colors.red, range: "300+"),
                ],
              ),
          
          
              SizedBox(height: 20),
          
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res == null ? "" : "Health-Implications",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      res == null
                          ? ""
                          : HealthMeasures.getAqiLevel(res!)["desc"]!,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      res == null ? "" : "Precautions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      res == null
                          ? ""
                          : HealthMeasures.getAqiLevel(res!)["precautions"]!,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void onError() {
    setState(() {
      _errorText = 'Enter a location';
    });
  }


  Future<void> searchForLocation() async {
    if (searchController.text.isEmpty) {
      onError();
      return;
    }
    // API CALL
    res = await API.getAQI(searchController.text);
    setState(() {
      _errorText = "";
    });
  }
}



