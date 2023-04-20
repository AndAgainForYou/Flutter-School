import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnimatedBarChart extends StatefulWidget {
  @override
  _AnimatedBarChartState createState() => _AnimatedBarChartState();
}

class _AnimatedBarChartState extends State<AnimatedBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late List<charts.Series<BarChartData, String>> _seriesData;

  List<charts.Series<BarChartData, String>> _createSampleData() {
    final data = [
      BarChartData('Jan', 5),
      BarChartData('Feb', 4),
      BarChartData('Mar', 7),
      BarChartData('Apr', 6),
      BarChartData('May', 9),
      BarChartData('Jun', 7),
    ];

    return [
      charts.Series<BarChartData, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (BarChartData sales, _) => sales.month,
        measureFn: (BarChartData sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)); //animation - animationController
    _seriesData = _createSampleData();
    _animationController.forward();

    // Add animation
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(_animationController) //tween animation
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spended time')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Time in Instagram',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Colors.yellow.withOpacity(_animation.value),
                    Colors.deepOrange.withOpacity(_animation.value)
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: const Text(
                '2 hours 30 min',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 210,
              child: Column(
                children: const [
                  Text(
                    'On average per day',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey),
                  ),
                  Text(
                    'Average time per day you used the Instagram app on this device last week',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 350,
              width: 500,
              child: charts.BarChart(
                _seriesData,
                animate: true,
                animationDuration: const Duration(milliseconds: 1000),
                barRendererDecorator: charts.BarLabelDecorator<String>(),
                defaultRenderer: charts.BarRendererConfig(),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BarChartData {
  final String month;
  final int sales;

  BarChartData(this.month, this.sales);
}
