import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    required this.errorText,
  });


  final TextEditingController searchController;
  final String errorText;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.8,
      child: TextField(
        controller: searchController,
        style: TextStyle(
          color: Colors.grey.shade800,
          letterSpacing: 0.7,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          errorText: errorText.isEmpty ? null : errorText,
          hintText: "Search Location",
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: 0.7,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade400),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(width: 2, color: Colors.red.shade100),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(width: 2, color: Colors.red.shade100),
          ),
        ),
      ),
    );
  }
}



