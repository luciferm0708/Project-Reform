import 'package:flutter/material.dart';
import 'package:project_reform_v_demo/pages/cropInput.dart';
import 'package:project_reform_v_demo/pages/farmerRegister.dart';
import 'package:project_reform_v_demo/pages/userType.dart';

class Home extends StatefulWidget {
  final String? cropName;
  final String? quantity;
  final String? price;
  final bool showPopup;
  final int points;

  const Home({
    super.key,
    this.cropName,
    this.quantity,
    this.price,
    this.showPopup = false,
    this.points = 200, // Default points
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.showPopup) {
        _showCropDataPopup();
      }
    });
  }

  void _showCropDataPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Crop Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Crop Name: ${widget.cropName}'),
              Text('Quantity: ${widget.quantity}'),
              Text('Price: ${widget.price}'),
              const SizedBox(height: 10),
              Text('New Points: ${widget.points}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('আমাদের বাজার'),
          actions: [
            PopupMenuButton<int>(
              onSelected: (item) => print('Selected $item'),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(value: 0, child: Text('Option 1')),
                const PopupMenuItem<int>(value: 1, child: Text('Option 2')),
                const PopupMenuItem<int>(value: 2, child: Text('Option 3')),
              ],
            ),
          ],
        ),
        body: Container(
          color: Colors.lightGreenAccent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CreditCardSwiper(),
                const SizedBox(height: 15),
                SingleLongHorizontalCard(
                  imagePath: 'assets/farmer.jpg',
                  description: 'আবেদ আলী আমাদের একজন আস্থাভাজন কৃষক জেলা : নওগা ',
                ),
                const SizedBox(height: 20),
                Expanded(child: TwoByThreeImageButtonGrid()),
                const SizedBox(height: 20),
                RoundedCornerSearchBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CreditCardSwiper extends StatefulWidget {
  @override
  _CreditCardSwiperState createState() => _CreditCardSwiperState();
}

class _CreditCardSwiperState extends State<CreditCardSwiper> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), autoSwipe);
    });
  }

  void autoSwipe() {
    if (_pageController.hasClients) {
      int nextPage = _pageController.page!.round() + 1;
      _pageController.animateToPage(
        nextPage % 6,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      Future.delayed(Duration(seconds: 3), autoSwipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          creditCardWidget('assets/onion.jpg'),
          creditCardWidget('assets/brinjal.jpg'),
          creditCardWidget('assets/onion.jpg'),
          creditCardWidget('assets/potato.jpg'),
          creditCardWidget('assets/brinjal.jpg'),
          creditCardWidget('assets/potato.jpg'),
        ],
      ),
    );
  }

  Widget creditCardWidget(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SingleLongHorizontalCard extends StatelessWidget {
  final String imagePath;
  final String description;

  SingleLongHorizontalCard({
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardHeight = constraints.maxWidth * 0.3;
        return Container(
          height: cardHeight,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: cardHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TwoByThreeImageButtonGrid extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/farmer.png',
    'assets/healthy-food.png',
    'assets/qr-code (1).png',
    'assets/link.png',
    'assets/document.png',
    'assets/information.png',
  ]; // List of image paths for the buttons

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: imagePaths.length, // Number of buttons
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            // Navigation logic for each button
            if (index == 0) {
              // Navigate to SecondPage when the first button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserType()),
              );
            } else if (index == 1) {
              // Navigate to ThirdPage when the second button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CropInputPage()),
              );
            } else {
              // Handle other buttons or add more navigation logic here
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Image.asset(
            imagePaths[index], // Display corresponding image from the list
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class RoundedCornerSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.green,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
    );
  }
}
