import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

@collection
class AppSettings
{
  Id id = Isar.autoIncrement;
  DateTime?  firstLaunchDate;
}