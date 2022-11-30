import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.050,
          ),
          Row(
            children: const [
              Text(
                "M",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey),
              ),
              Text(
                "usify",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
