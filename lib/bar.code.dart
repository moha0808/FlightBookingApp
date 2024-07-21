import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(MaterialApp(home: FlightTicketPage()));
}

class FlightTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flight Ticket',
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlightTicketDetails(
                flightNumber: 'AB123',
                departure: 'JFK',
                arrival: 'LAX',
                departureDate: '2024-05-20',
                passengerName: 'Mohanasundar',
                seatNumber: '12A',
                gate: 'B3',
                flightTime: '8:00 AM',
                boardingTime: '7:30 AM',
                barcodeData: 'AB123|JFK|LAX|2024-05-20|Mohanasundar|12A|B3|8:00 AM|7:30 AM',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlightTicketDetails extends StatelessWidget {
  final String flightNumber;
  final String departure;
  final String arrival;
  final String departureDate;
  final String passengerName;
  final String seatNumber;
  final String gate;
  final String flightTime;
  final String boardingTime;
  final String barcodeData;

  FlightTicketDetails({
    required this.flightNumber,
    required this.departure,
    required this.arrival,
    required this.departureDate,
    required this.passengerName,
    required this.seatNumber,
    required this.gate,
    required this.flightTime,
    required this.boardingTime,
    required this.barcodeData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Flight Ticket',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                buildDetailCell('Passenger Name:', passengerName),
                buildDetailCell('Flight Number:', flightNumber),
                buildDetailCell('Departure:', departure),
                buildDetailCell('Arrival:', arrival),
                buildDetailCell('Departure Date:', departureDate),
                buildDetailCell('Flight Time:', flightTime),
                buildDetailCell('Boarding Time:', boardingTime),
                buildDetailCell('Seat Number:', seatNumber),
                buildDetailCell('Gate:', gate),
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: BarcodeWidget(
                barcode: Barcode.code128(),
                data: barcodeData,
                width: 300,
                height: 100,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Scan for flight details',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailCell(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
