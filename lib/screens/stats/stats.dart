import 'package:expense_tracker_app/screens/stats/chart.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Text(
            'Transections',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /2.2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12,20,12,12),
                child: Mychart(),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
