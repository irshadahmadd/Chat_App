import 'package:flutter/material.dart';
bool loading=false;
class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.title,required this.colour,
    required this.onpressed,required this.loading});
  final Color colour;
  final String title;
  final Function() onpressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: onpressed,
        child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                child: Center(
                  child:loading? const CircularProgressIndicator(color:
                  Colors.deepOrange,): Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}