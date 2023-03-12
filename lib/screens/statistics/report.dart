import 'package:flutter/material.dart';
import 'package:money_management/db/model/listdata.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenReport extends StatefulWidget {
  const ScreenReport({super.key});

  @override
  State<ScreenReport> createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport> {
  List day =['Week','Month','Year'];
  int indexColor = 0 ;
  Map<String, double> dataMap={
    "Entertainment":60,
    "Food":36,
    "Outing":4,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children:  [
                   const SizedBox(
                    height: 20,
                  ),
                  const Text('Statistics',
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 60, 141),
                    fontSize: 20,
                    fontWeight:FontWeight.w700 
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(3, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexColor = index;
                              });
                            },
                            child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: indexColor == index ? 
                              const Color.fromARGB(255, 51, 60, 141):
                              Colors.indigo[50]
                            ),
                            child: Center(
                              child: Text(
                                day[index],
                                style:  TextStyle(
                                  color: indexColor == index ? 
                              Colors.white:
                              Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                            ),
                                                  ),
                          );
                        })
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 51, 60, 141),
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Expenses',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 51, 60, 141),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Color.fromARGB(255, 51, 60, 141),
                                  ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        PieChart(
                          dataMap: dataMap,
                          chartRadius: MediaQuery.of(context).size.width,
                          legendOptions: const LegendOptions(
                            legendTextStyle: TextStyle(
                              color: Color.fromARGB(255, 51, 60, 141),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                            legendPosition: LegendPosition.right
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true
                          ),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                         Text('Top Spendings',
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 60, 141),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Icon(
                          Icons.swap_vert,
                          size: 25,
                          color: Color.fromARGB(255, 51, 60, 141),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  leading: Image.asset('assets/icons/icons8-atm-card-96.png',
                  height: 40,
                  ),
                  title: Text(
                    geter()[index].name!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 51, 60, 141),
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                      geter()[index].time!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      trailing:  Text(
                        geter()[index].fee!,
                        style: TextStyle(
                          color: geter()[index].type! ? Colors.green : Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                );
              },
              childCount: geter().length
              ),
              )
          ],
        )),
    );
  }
}