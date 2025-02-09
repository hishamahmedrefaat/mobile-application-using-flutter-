import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chatUsers = [
    {'name': 'Ankur', 'message': "Let's meet tomorrow", 'time': '3:09 PM', 'profilePic': 'assets/ankur.jpg', 'active': true},
    {'name': 'Stella', 'message': "Hey What's up?", 'time': 'Wed', 'profilePic': 'assets/stella.jpg', 'active': true},
    {'name': 'Rosy', 'message': "Are you ready for the party...", 'time': 'Thu', 'profilePic': 'assets/rosy.jpg', 'active': true},
    {'name': 'Ani', 'message': "Let's go have some fun", 'time': 'Wed', 'profilePic': 'assets/ani.jpg', 'active': false},
    {'name': 'John', 'message': "See you at the meeting", 'time': 'Mon', 'profilePic': 'assets/john.jpg', 'active': true},
    {'name': 'Doe', 'message': "Can you send the report?", 'time': 'Tue', 'profilePic': 'assets/doe.jpg', 'active': false},
    {'name': 'Alice', 'message': "Lunch at 1 PM?", 'time': 'Fri', 'profilePic': 'assets/alice.jpg', 'active': true},
    {'name': 'Bob', 'message': "Project deadline extended", 'time': 'Sat', 'profilePic': 'assets/bob.jpg', 'active': false},
    {'name': 'Charlie', 'message': "Let's catch up soon", 'time': 'Sun', 'profilePic': 'assets/charlie.jpg', 'active': true},
    {'name': 'David', 'message': "Meeting rescheduled", 'time': 'Mon', 'profilePic': 'assets/david.jpg', 'active': true},
    {'name': 'Eva', 'message': "Happy Birthday!", 'time': 'Tue', 'profilePic': 'assets/eva.jpg', 'active': false},
    {'name': 'Frank', 'message': "Check your email", 'time': 'Wed', 'profilePic': 'assets/frank.jpg', 'active': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: chatUsers.map((user) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(user['profilePic']),
                            ),
                            if (user['active'])
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: Colors.lightGreen,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(user['name'], style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: chatUsers.length,
              itemBuilder: (context, index) {
                final user = chatUsers[index];
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(user['profilePic']),
                      ),
                      if (user['active'])
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.lightGreen,
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(user['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user['message']),
                  trailing: Text(user['time']),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}