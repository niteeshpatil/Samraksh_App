import 'package:flutter/material.dart';

class NotesDialog extends StatefulWidget {
  const NotesDialog({Key? key}) : super(key: key);

  @override
  _NotesDialogState createState() => _NotesDialogState();
}

class _NotesDialogState extends State<NotesDialog> {
  final List<Map<String, dynamic>> notes = [
    {
      'title': 'Start',
      'content': [
        'Make sure that ESP is on, Connected to Wifi, and running in Boot Mode (No previous limit is set, if it is set Reset ESP).',
        'Go for the Setup page, Enter the details, and be sure that the limit is set which is mandatory Before submit.'
      ]
    },
    {
      'title': 'Device',
      'content': [
        'We are supporting two devices, See the Device Number on ESPs, and select the proper device which is connecting to the patient from drop-down.'
      ]
    },
    {
      'title': 'Submit',
      'content': [
        'The button will load for 4 minutes for ack from the selected device.',
        'After loading If not move to the patinetinfo page then the limit Setting has not happened, Try to Submit again make sure that esp is connected to wifi and is in Boot Mode.',
      ]
    },
    {
      'title': 'Updates',
      'content': [
        'To Get Updates on Patient Movements Press Connect Button, to Stop Updates press Disconnect Button in Patient info page',
      ]
    },
    {
      'title': 'Reset Data',
      'content': [
        'To Reset Data on a device please reset esp, and press the reset button on that device table.'
      ]
    },
    {
      'title': 'Reset ESP (Boot Mode)',
      'content': ['Press the Boot button on esp which will erase limit.']
    },
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Help', style: TextStyle(fontSize: 15)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          final note = notes[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 5, bottom: 0, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              for (final content in note['content'])
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 5, bottom: 0, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 16,
                        child: Text(
                          '\u2605 ',
                          style: TextStyle(
                            color: Theme.of(context).unselectedWidgetColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          content,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Baskervville',
                              color: Color.fromARGB(194, 0, 0, 0)),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
