import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/rate.dart';

class LatestRate extends StatefulWidget {
  const LatestRate({super.key});

  @override
  State<LatestRate> createState() => _LatestRateState();
}

class _LatestRateState extends State<LatestRate> {
  late Future<Rate> futureRate;

  @override
  void initState() {
    super.initState();
    futureRate = getRate();
  }

  Future<Rate> getRate() async {
    var params = {"base": "THB"};
    var uri = Uri.https(
        "currency-converter-pro1.p.rapidapi.com", "/latest-rates", params);

    var result = await http.get(uri, headers: {
      "X-RapidAPI-Host": "currency-converter-pro1.p.rapidapi.com",
      "x-rapidapi-key": "17b5f5e27fmsh8fde0c0b8b22f07p17a0f6jsn131f277200ca"
    });

    Rate rate = rateFromJson(result.body);
    return rate;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Rate>(
      future: futureRate,
      builder: (BuildContext context, AsyncSnapshot<Rate> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if (snapshot.hasData && snapshot.data!.result != null) {
          return ListView.builder(
            itemCount: snapshot.data!.result!.length,
            itemBuilder: (BuildContext context, int index) {
              String currencyCode =
                  snapshot.data!.result!.keys.elementAt(index);
              double exchangeRate = snapshot.data!.result![currencyCode]!;

              return ListTile(
                title: Text(currencyCode,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${exchangeRate.toString()}'),
              );
            },
          );
        } else {
          return const Center(
            child: Text("No data available"),
          );
        }
      },
    );
  }
}
