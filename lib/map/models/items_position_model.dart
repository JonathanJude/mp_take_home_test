import 'package:flutter/material.dart';

class ItemsPositionModel {
  final String name;
  final Offset position;

  ItemsPositionModel({
    required this.name,
    required this.position,
  });
}

List<ItemsPositionModel> mapMarkerItems = [
  ItemsPositionModel(
    name: '10,3 mn ₽',
    position: const Offset(0.3, 0.23),
  ),
  ItemsPositionModel(
    name: '11 mn ₽',
    position: const Offset(0.35, 0.295),
  ),
  ItemsPositionModel(
    name: '13,3 mn ₽',
    position: const Offset(0.2, 0.5),
  ),
  ItemsPositionModel(
    name: '7,8 mn ₽',
    position: const Offset(0.7, 0.32),
  ),
  ItemsPositionModel(
    name: '8,5 mn ₽',
    position: const Offset(0.7, 0.45),
  ),
  ItemsPositionModel(
    name: '6,95 mn ₽',
    position: const Offset(0.6, 0.55),
  ),
];
