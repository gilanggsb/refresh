// import 'package:flutter/material.dart';
// import 'package:my_homeproyek/api_service.dart';
// import 'package:my_homeproyek/drawer.dart';

// class AppointmentPage extends StatefulWidget {
//   const AppointmentPage({Key? key}) : super(key: key);

//   @override
//   State<AppointmentPage> createState() => _AppointmentPageState();
// }

// class _AppointmentPageState extends State<AppointmentPage> {
//   final Apiuser apiuser = Apiuser();
//   late Map<String, dynamic> srData = {}; // Provide a default empty map

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await apiuser.dataUser('USERID', 'USERPASSWORD');
//       setState(() {
//         srData = response;
//       });
//     } catch (error) {
//       // Handle error, e.g., display an error message to the user
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stock Request'),
//       ),
//       drawer: MyDrawer(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: srData.isEmpty
//             ? CircularProgressIndicator() // Or display another loading indicator
//             : DataTable(
//                 columns: [
//                   DataColumn(label: Text('Sr No')),
//                   DataColumn(label: Text('Sr Date')),
//                   DataColumn(label: Text('Brand')),
//                   DataColumn(label: Text('Loc From')),
//                   DataColumn(label: Text('Loc To')),
//                   DataColumn(label: Text('Status')),
//                   DataColumn(label: Text('Qty SR')),
//                   DataColumn(label: Text('To No')),
//                 ],
//                 rows: [
//                   DataRow(cells: [
//                     DataCell(Text(srData['SRNO'].toString())),
//                     DataCell(Text(srData['SRDATE'].toString())),
//                     DataCell(Text(srData['BRAND'].toString())),
//                     DataCell(Text(srData['LOCFROM'].toString())),
//                     DataCell(Text(srData['LOCTO'].toString())),
//                     DataCell(Text(srData['STATUS'].toString())),
//                     DataCell(Text(srData['QTYSR'].toString())),
//                     DataCell(Text(srData['TONO'].toString())),
//                   ]),
//                 ],
//               ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:my_homeproyek/api_service.dart';
// import 'package:my_homeproyek/drawer.dart';

// class AppointmentPage extends StatefulWidget {
//   const AppointmentPage({Key? key}) : super(key: key);

//   @override
//   State<AppointmentPage> createState() => _AppointmentPageState();
// }

// class _AppointmentPageState extends State<AppointmentPage> {
//   final Apiuser apiuser = Apiuser();
//   Map<String, dynamic>? srData;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await apiuser.dataUser('USERID', 'USERPASSWORD');

//       // Check if the response is not null and contains a 'code' field
//       if (response != null && response.containsKey('code')) {
//         final resultCode = response['code'];

//         setState(() {
//           // Check the 'code' to determine if the request was successful
//           if (resultCode == "1") {
//             srData = response['msg'][0];
//           } else {
//             // Handle the case where the request was not successful
//             print('Request failed with code $resultCode');
//           }
//         });
//       } else {
//         // Handle the case where the response structure is unexpected
//         print('Unexpected response structure');
//       }
//     } catch (error) {
//       // Handle error, e.g., display an error message to the user
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stock Request'),
//       ),
//       drawer: MyDrawer(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: srData == null
//             ? Center(child: CircularProgressIndicator())
//             : (srData!.isEmpty
//                 ? Center(child: Text('No data available'))
//                 : DataTable(
//                     columns: [
//                       DataColumn(label: Text('Sr No')),
//                       DataColumn(label: Text('Sr Date')),
//                       DataColumn(label: Text('Brand')),
//                       DataColumn(label: Text('Loc From')),
//                       DataColumn(label: Text('Loc To')),
//                       DataColumn(label: Text('Status')),
//                       DataColumn(label: Text('Qty SR')),
//                       DataColumn(label: Text('To No')),
//                     ],
//                     rows: [
//                       DataRow(cells: [
//                         DataCell(Text(srData!['SRNO'].toString())),
//                         DataCell(Text(srData!['SRDATE'].toString())),
//                         DataCell(Text(srData!['BRAND'].toString())),
//                         DataCell(Text(srData!['LOCFROM'].toString())),
//                         DataCell(Text(srData!['LOCTO'].toString())),
//                         DataCell(Text(srData!['STATUS'].toString())),
//                         DataCell(Text(srData!['QTYSR'].toString())),
//                         DataCell(Text(srData!['TONO'].toString())),
//                       ]),
//                     ],
//                   )),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_homeproyek/api_service.dart';
import 'package:my_homeproyek/drawer.dart';
import 'package:my_homeproyek/utils/storage.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final Apiuser apiuser = Apiuser();
  final StorageService storageService = StorageService.instance;
  List? srData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final userData = storageService.get(StorageKeys.USER);
      final response =
          await apiuser.dataUser(userData['USERID'], userData['USERPASSWORD']);
      print(response);

      // Check if the response is not null and contains a 'code' field
      if (response.containsKey('code')) {
        final resultCode = response['code'];

        setState(() {
          // Check the 'code' to determine if the request was successful
          if (resultCode == "1") {
            srData = response["msg"];
            print(response["msg"]);
          } else {
            // Handle the case where the request was not successful
            print('Request failed with code $resultCode');
            print(response["msg"]);
          }
        });
      } else {
        // Handle the case where the response structure is unexpected
        print('Unexpected response structure');
      }
    } catch (error) {
      // Handle error, e.g., display an error message to the user
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Request'),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: srData == null
            ? const Center(child: CircularProgressIndicator())
            : (srData!.isEmpty
                ? const Center(child: Text('No data available'))
                : DataTable(
                    columns: const [
                      DataColumn(label: Text('Sr No')),
                      DataColumn(label: Text('Sr Date')),
                      DataColumn(label: Text('Brand')),
                      DataColumn(label: Text('Loc From')),
                      DataColumn(label: Text('Loc To')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Qty SR')),
                      DataColumn(label: Text('To No')),
                    ],
                    rows: srData!
                        .map(
                          (e) => DataRow(cells: [
                            DataCell(Text(e['SRNO'].toString())),
                            DataCell(Text(e['SRDATE'].toString())),
                            DataCell(Text(e['BRAND'].toString())),
                            DataCell(Text(e['LOCFROM'].toString())),
                            DataCell(Text(e['LOCTO'].toString())),
                            DataCell(Text(e['STATUS'].toString())),
                            DataCell(Text(e['QTYSR'].toString())),
                            DataCell(Text(e['TONO'].toString())),
                          ]),
                        )
                        .toList(),
                  )),
      ),
    );
  }
}
