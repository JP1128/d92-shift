import 'package:d92_shift/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

String weekday(int weekday) {
  return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Sun'][weekday];
}

String weekdayLong(int weekday) {
  return ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'][weekday];
}

String getMessage(bool morning, bool dinner) {
  if (morning && dinner) {
    return "Available ALL DAY ✅";
  }

  if (morning) {
    return "Morning shift ✅";
  }

  if (dinner) {
    return "Dinner shift ✅";
  }

  return "Unavailable";
}

class NewSchedulePage extends StatefulWidget {
  const NewSchedulePage({Key? key}) : super(key: key);

  @override
  State<NewSchedulePage> createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  var morningAvailability = List.filled(7, false);
  var dinnerAvailability = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startWeek = now.add(Duration(days: 8 - now.weekday));

    const dateColWidth = 50.0;

    return Scaffold(
        appBar: AppBar(title: const Text("Next Availability")),
        body: Padding(
          padding: defaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(width: dateColWidth + 20),
                  Expanded(
                    child: Text(
                      "Morning",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: semiBold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Dinner",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: semiBold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final day = startWeek.add(Duration(days: index));
                    final availableMorning = morningAvailability[index];
                    final availableDinner = dinnerAvailability[index];

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: dateColWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                weekday(day.weekday - 1),
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: medium,
                                ),
                              ),
                              Text("${day.month}/${day.day}"),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                morningAvailability[index] = !morningAvailability[index];
                              });
                            },
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: availableMorning ? successColor : primaryColor),
                            ),
                            color: availableMorning ? successColor : Colors.white,
                            elevation: 2,
                            child: Text(
                              availableMorning ? "available" : "busy",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: medium,
                                color: availableMorning ? Colors.white : primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                dinnerAvailability[index] = !dinnerAvailability[index];
                              });
                            },
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: availableDinner ? successColor : primaryColor),
                            ),
                            color: availableDinner ? successColor : Colors.white,
                            elevation: 2,
                            child: Text(
                              availableDinner ? "available" : "busy",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: medium,
                                color: availableDinner ? Colors.white : primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 30);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var message = "Next week schedule:\n";

                  for (int i = 0; i < 7; i++) {
                    message += "${weekdayLong(i)}: ${getMessage(morningAvailability[i], dinnerAvailability[i])}\n";
                  }

                  Clipboard.setData(ClipboardData(
                    text: message,
                  ));

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully copied")));
                },
                child: const Text("Copy to clipboard"),
              )
            ],
          ),
        ));
  }
}
