// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:isolate';

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:team_lints/team_lints.dart';

void main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, createPlugin());
}
