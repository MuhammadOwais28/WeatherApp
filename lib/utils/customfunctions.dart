
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
        // isLoading ?
        Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Container(
          height: height,
          color: Colors.black,
          child: Image.asset(
            "assets/night.jpg",
            fit: BoxFit.fitHeight,
          ),
        ),
        Shimmer.fromColors(
            baseColor: Colors.grey.shade700,
            highlightColor: Colors.grey.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  height: height * .05,
                  width: width * .4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  height: height * .08,
                  width: width * .35,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  height: height * .02,
                  width: width * .28,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  height: height * .04,
                  width: width * .30,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  height: height * .02,
                  width: width * .25,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: height * .4,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: ((context, index) => ContainerS(
                            height: height * .01,
                            width: width * .9,
                          ))),
                )
              ],
            )),
      ]),
    );
    // : Scaffold(
    //   backgroundColor: Colors.black,
    //   body: Center(child: const Text("Check your internet connection!")),
    // );
  }
}

class ContainerS extends StatelessWidget {
  const ContainerS({super.key, this.height, this.width});
  final height, width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: height,
          width: width,
        ),
        SizedBox(
          height: height * 7,
        )
      ],
    );
  }
}


// ignore: must_be_immutable
class InfoRow extends StatelessWidget {
  InfoRow({super.key, required this.title, required this.value});
  final String title;
  dynamic value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value.toString())],
          ),
          const Divider(
            thickness: 1.2,
          )
        ],
      ),
    );
  }
}

