import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiIntento extends StatefulWidget {
  const ApiIntento({super.key});

  @override
  State<ApiIntento> createState() => _ApiIntentoState();
}



class _ApiIntentoState extends State<ApiIntento> {
  final String apiURL =
      'https://newsapi.org/v2/everything?q=apple&from=2024-05-15&to=2024-05-15&sortBy=popularity&apiKey=45773859704146428d0bf41b3516bc4b'; 

  List data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    final response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body)['articles'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              "41 Minutos",
              
            ),
            Text(
              "Arabia",
            
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 168, 141, 230),
        foregroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        data[index]['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      
                    ),
                  ],
                );
              },
            ),
    );
  }
}