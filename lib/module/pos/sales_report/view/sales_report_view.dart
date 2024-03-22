import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/sales_report_controller.dart';

// class SalesReportView extends StatefulWidget {
//   const SalesReportView({Key? key}) : super(key: key);

//   Widget build(context, SalesReportController controller) {
//     controller.view = this;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("SalesReport"),
//         actions: const [],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   State<SalesReportView> createState() => SalesReportController();
// }

class SalesReportView extends StatefulWidget {
  @override
  _SalesReportViewState createState() => _SalesReportViewState();
}

class _SalesReportViewState extends State<SalesReportView> {
  List salesOrderList = [];

  @override
  void initState() {
    super.initState();
    loadSalesData();
  }

  Future<void> loadSalesData() async {
    await SalesOrderService.loadDataFromDB();
    setState(() {
      salesOrderList = SalesOrderService.salesOrderList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Report'),
      ),
      body: salesOrderList.isEmpty
          ? Center(
              child: Text('No sales data available'),
            )
          : ListView.builder(
              itemCount: salesOrderList.length,
              itemBuilder: (context, index) {
                var reversedIndex = salesOrderList.length - index - 1;
                var salesOrder = salesOrderList[reversedIndex];
                var formattedDate = DateFormat('yyyy-MM-dd hh:mm a')
                    .format(DateTime.parse(salesOrder["create"]));
                var numberFormat =
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
                var formattedTotal = numberFormat.format(salesOrder["total"]);
                return Container(
                    decoration: BoxDecoration(
                      color:
                          index % 2 == 0 ? Colors.grey[950] : Colors.grey[300],
                    ),
                    child: ListTile(
                      title: Text('Date: $formattedDate'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Items:'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: (salesOrder["item"] as List)
                                .map<Widget>((item) {
                              var price = NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp ',
                              ).format(item["price"]);
                              return Text(
                                  '${item["product_name"]}  -  Qty: ${item["qty"]}  -  Price: $price');
                            }).toList(),
                          ),
                          Text('Total: $formattedTotal'),
                        ],
                      ),
                    ));
              },
            ),
    );
  }
}
