import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          isDense: false,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey),
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.circular(8) //<-- SEE HERE
              ),
        ),
      ),
    );
  }
}
