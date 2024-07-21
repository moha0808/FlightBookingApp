import 'package:flightbookingapp/homescreen.dart';
import 'package:flutter/material.dart';

class SeatAvailabilityScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String flightNumber;
  final String from;
  final String to;

  SeatAvailabilityScreen(this.title, this.subtitle, this.flightNumber, this.from, this.to);

  @override
  _SeatAvailabilityScreenState createState() => _SeatAvailabilityScreenState();
}

class _SeatAvailabilityScreenState extends State<SeatAvailabilityScreen> {
  final int seatPrice = 5000; // Example seat price
  final Set<int> selectedSeats = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seat Availability',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.red),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flight Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Title: ${widget.title}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Subtitle: ${widget.subtitle}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Flight Number: ${widget.flightNumber}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'From: ${widget.from}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'To: ${widget.to}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'Available Seats:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 40, // Example seat count
                itemBuilder: (context, index) {
                  final isSelected = selectedSeats.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedSeats.remove(index);
                        } else {
                          selectedSeats.add(index);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.red : Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Seat ${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected Seats: ${selectedSeats.length}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Total: ₹${selectedSeats.length * seatPrice}',
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: selectedSeats.isEmpty
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    // Handle seat confirmation
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
