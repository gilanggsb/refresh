import 'package:flutter/material.dart';
import 'package:my_homeproyek/drawer.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  // Contoh data stok
  List<Map<String, dynamic>> appointments = [
    {
      'srno': 1,
      'tono': 'ABC123',
      'dept': 'Sales',
      'loc': 'A1',
      'qty': 100,
      'date': '2022-01-01',
      'status': 'In Stock',
    },
    {
      'srno': 2,
      'tono': 'XYZ789',
      'dept': 'Warehouse',
      'loc': 'B2',
      'qty': 50,
      'date': '2022-01-05',
      'status': 'Out of Stock',
    },
    // Add more appointments as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Sr No')),
            DataColumn(label: Text('Tono')),
            DataColumn(label: Text('Dept')),
            DataColumn(label: Text('Loc')),
            DataColumn(label: Text('Qty')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Status')),
          ],
          rows: appointments.map((appointment) {
            return DataRow(cells: [
              DataCell(Text(appointment['srno'].toString())),
              DataCell(Text(appointment['tono'].toString())),
              DataCell(Text(appointment['dept'].toString())),
              DataCell(Text(appointment['loc'].toString())),
              DataCell(Text(appointment['qty'].toString())),
              DataCell(Text(appointment['date'].toString())),
              DataCell(Text(appointment['status'].toString())),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
