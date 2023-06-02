//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_change_notifier/counter.dart';

final counterProvider = ChangeNotifierProvider((ref) => Counter());
