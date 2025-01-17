import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Animationparalex extends StatefulWidget {
  const Animationparalex({super.key});

  @override
  State<Animationparalex> createState() => _AnimationparalexState();
}

class _AnimationparalexState extends State<Animationparalex> {
  double scrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              scrollOffset += notification.scrollDelta ?? 0;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1900),
              child: ParalaxBackground(
                top: -scrollOffset * 0.5, // Adjust for parallax effect
                image: "assets/image.png",
              ),
            ),
            ParalaxBackground(
              top: -scrollOffset * 0.2, // Adjust for parallax effect
              image: "assets/image copy 2.png",
            ),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 600,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.black38),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1900),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1900),
                          child: Text(
                            "Scroll to sign up",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: const Color.fromARGB(255, 91, 79, 79),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: const TextStyle(
                              color:
                                  Colors.white, // Text color for entered text
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors
                                  .black45, // Slightly darker shade for the field background
                              filled: true,
                              hintStyle: const TextStyle(
                                color: Colors
                                    .grey, // Subtle hint color for contrast
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded border for a modern look
                                borderSide: const BorderSide(
                                  color: Colors.white, // White border color
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors
                                      .white, // White border when not focused
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color:
                                      Colors.white, // Blue border when focused
                                ),
                              ),
                              hintText: 'Email...',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: const TextStyle(
                              color:
                                  Colors.white, // Text color for entered text
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors
                                  .black45, // Slightly darker shade for the field background
                              filled: true,
                              hintStyle: const TextStyle(
                                color: Colors
                                    .grey, // Subtle hint color for contrast
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded border for a modern look
                                borderSide: const BorderSide(
                                  color: Colors.white, // White border color
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors
                                      .white, // White border when not focused
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 205, 226,
                                      244), // Blue border when focused
                                ),
                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParalaxBackground extends StatelessWidget {
  const ParalaxBackground({super.key, this.top = 0, required this.image});

  final double top;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 600,
        child: Image.asset(
          image, // Use asset since the image path suggests an asset
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
