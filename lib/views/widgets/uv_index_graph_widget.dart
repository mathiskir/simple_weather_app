import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

Widget uvIndexGraph({
  required AsyncSnapshot<List<dynamic>> snapshot,
  required BuildContext context,
}){
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: snapshot.data![0].current.is_day!=0 ? Color.fromARGB(192, 141, 196, 255): Color.fromARGB(192, 36, 34, 134),
    ), 
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "UV-Index-Tagesverlauf",
              style: GoogleFonts.lexendExa(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.sunny,
              color: Colors.white
            )
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.sizeOf(context).width-30,
          height: 300,
          padding: EdgeInsets.all(12),
          child: LineChart(
            LineChartData(
              maxY: 10,
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Colors.white,
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine:(value) {
                  return const FlLine(
                    color: Colors.white,
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                      color: Colors.white, 
                      width: 4
                  ),
                  left: const BorderSide(color: Colors.transparent),
                  right: const BorderSide(color: Colors.transparent),
                  top: const BorderSide(color: Colors.transparent),
                )
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: GoogleFonts.lexendExa(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          value.toInt().toString(),
                          style: GoogleFonts.lexendExa(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    },
                  )
                )
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) => snapshot.data![0].current.is_day!=0 ? Color.fromARGB(192, 141, 196, 255): Color.fromARGB(192, 36, 34, 134),
                  getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                    return touchedBarSpots.map((barSpot) {
                      final flSpot = barSpot;
                      return LineTooltipItem(
                        'UV Index: ',
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: flSpot.y.round().toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        textAlign: TextAlign.center,
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  isStrokeCapRound: true,
                  barWidth: 8,
                  color: Colors.white,
                  spots: List.generate(
                    18,
                    (x) => FlSpot(
                      x.roundToDouble()+5,
                      snapshot.data![0].forecast.forecastday[0].hour[x+5].uv.round().toDouble()
                    ),
                  ),
                )
              ]
            )
          ),
        ),
      ],
    )
  );
}