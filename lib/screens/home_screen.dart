import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/models/user_model.dart';
import 'package:rapido/screens/profile_screen.dart';
import 'package:rapido/view_models/auth_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserEntity user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);
    if (loginVM.currentUser != null) {
      user = loginVM.currentUser!;
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 2,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 72,
                  ),
                  SizedBox(height: 8),
                  Text(
                    user.name ?? "No Name",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    user.email ?? "No Email",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen(user: user);
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Find a Bus"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/routes");
              },
            ),
            ListTile(
              title: Text("Make a Payment"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/payment");
              },
            ),
          ],
        ),
      ),
      body: CarouselSlider(
        items: [
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/9420620/pexels-photo-9420620.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/9420620/pexels-photo-9420620.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/9420620/pexels-photo-9420620.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/9420620/pexels-photo-9420620.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
