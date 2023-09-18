import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://st3.depositphotos.com/1177973/13325/i/450/depositphotos_133251802-stock-photo-cute-cat-on-couch.jpg',
    'https://thumbs.dreamstime.com/b/four-cute-cats-20650677.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/003/585/799/small/gray-fluffy-cat-photo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCuUlsz70Pb_3fffIuWf_eXcNP1vrcBfKhy_VK7SUXRcPKHgynDHU4LMfSav9OoKbuEyo&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY8A2s_n50g7xFvPLi_703DG6scGHiwxZoOA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfxfbqx91GAM20aT8X4s5p8kecp7wKYH8hKw&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome To MY Photo Gallery!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for photos...',
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Image ${index + 1} selected!'),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),

                      Text('Photo ${index + 1}'),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/003/585/799/small/gray-fluffy-cat-photo.jpg',
                  fit: BoxFit.cover,
                ).image,
              ),
              title: Text('Photo 1'),
              subtitle: Text('gray fluffy cat'),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: Image.network(
                  'https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg',
                  fit: BoxFit.cover,
                ).image,
              ),
              title: Text('Photo 2'),
              subtitle: Text('Cats Eye'),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: Image.network(
                  'https://media.gettyimages.com/id/1337733270/photo/cat-playing-in-yellow-tunnel.jpg?s=612x612&w=gi&k=20&c=CaDm7CTj8dsHvJ40gnQ2k2_FX5H4feXagn9vaQ9NGfQ=',
                  fit: BoxFit.cover,
                ).image,
              ),
              title: Text('Photo 3'),
              subtitle: Text('cat playing'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: Icon(Icons.upload),
            ),
          ],
        ),
      ),
    );
  }
}
