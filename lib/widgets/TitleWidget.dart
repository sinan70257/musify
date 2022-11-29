import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
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
