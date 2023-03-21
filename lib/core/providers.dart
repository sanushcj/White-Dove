import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whitedove/constants/constants.dart';

final appwiteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppWriteConstants.endpoint)
      .setProject(AppWriteConstants.projectId)
      .setSelfSigned(status: true);
});
