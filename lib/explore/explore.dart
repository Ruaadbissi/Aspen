import 'package:aspen/utils/ui/exploreView.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  bool _isExpanded = false;
  String _selectedValue = 'Aspen,USA';
  final List<String> _locations = ['Aspen,USA', 'Amman,Jordan'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Aspen",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        const SizedBox(width: 180, height: 80),
                        Positioned(
                          top: 0,
                          right: 20,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            width: 135,
                            height: 15,
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                setState(() {_isExpanded = !_isExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                  Text(
                                    _selectedValue,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      height: 1.2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    _isExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color:
                                    _isExpanded ? Colors.grey : Colors.blue,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_isExpanded)
                          Positioned(
                            top: 30,
                            right: 30,
                            child: Container(
                              width: 150,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.fromLTRB(4, 6, 0, 20),
                                physics: const BouncingScrollPhysics(),
                                children: _locations.map(
                                      (e) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isExpanded = false;
                                      _selectedValue = e;
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: _selectedValue == e
                                            ? Colors.white
                                            : Colors.grey.shade200,
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            e.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: _selectedValue == e
                                                  ? Colors.black
                                                  : Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          if (_selectedValue == e)
                                            const Icon(
                                              Icons.check,
                                              color: Colors.white30,
                                              size: 16,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).toList(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
                   const SizedBox(height: 5,),
                   const ExploreView(),
            ],
          ),
        ),
      ),
    );
  }
}
