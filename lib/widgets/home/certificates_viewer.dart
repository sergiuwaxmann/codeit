import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CertificatesViewer extends StatefulWidget {
  const CertificatesViewer({Key? key}) : super(key: key);

  @override
  _CertificatesViewerState createState() => _CertificatesViewerState();
}

class _CertificatesViewerState extends State<CertificatesViewer> {
  final List<String> _certificatesPaths = [
    'assets/certificates/certificate-1.svg',
    'assets/certificates/certificate-2.svg',
    'assets/certificates/certificate-3.svg',
  ];

  late Widget _certificatesViewer;

  @override
  void initState() {
    super.initState();
    List<Widget> _imageChildren = [];

    _certificatesPaths.reversed.toList().asMap().forEach(
      (
        index,
        certificate,
      ) {
        int angleDegree;

        if (index == _certificatesPaths.length - 1) {
          angleDegree = 0;
        } else {
          angleDegree = Random().nextInt(10) - 5;
        }

        _imageChildren.add(
          Container(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: angleDegree * (pi / 180),
              child: SvgPicture.asset(
                certificate,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );

    _certificatesViewer = Stack(
      children: _imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: _certificatesViewer,
    );
  }
}
