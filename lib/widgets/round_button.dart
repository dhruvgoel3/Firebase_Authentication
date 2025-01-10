import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool loading;
  const RoundButton(
      {super.key,
      required this.onTap,
      required Text child,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading
            ? CircularProgressIndicator(strokeWidth: 0,color: Colors.white,)
            : Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
