import 'package:flutter/material.dart';

class DecorContainer extends StatefulWidget {
  const DecorContainer({
    super.key,
    required this.imageUrl,
    required this.heightFactor,
    this.child,
  });

  final String imageUrl;
  final double heightFactor;
  final Widget? child;

  @override
  State<DecorContainer> createState() => _DecorContainerState();
}

class _DecorContainerState extends State<DecorContainer> {
  //   bool _isTransformed = false;
  // final bool _hideText = true;
  // int _milliseconds = 200;

  // @override
  // void initState() {
  //   super.initState();
  //   _milliseconds = widget.milliseconds;

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Future.delayed(Duration(milliseconds: _milliseconds), () {
  //       setState(() {
  //         _isTransformed = true;
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * widget.heightFactor,
      width: double.infinity,
      // margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(widget.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: widget.child ?? const SizedBox.shrink(),
      ),
    );
  }
}
