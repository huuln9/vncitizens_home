import 'package:get/get.dart';
import 'package:vncitizens_home/src/controllers/configuration_controller.dart';
import 'package:vncitizens_home/src/services/place_service.dart';

class PlaceController extends GetxController {
  PlaceService? _placeService;
  final String placeTagId;
  var places = [].obs;
  var loading = true.obs;
  int page = 0;
  bool last = false;

  PlaceController({required this.placeTagId}) {
    final ConfigurationController configurationController = Get.find();
    final config = configurationController.configuration;

    _placeService =
        Get.put(PlaceService(apiGatewayURL: config['apiGatewayURL']));

    fetchPlaces();
  }

  fetchPlaces() async {
    if (last) return;

    loading(true);

    final data =
        await _placeService!.fetchPlace(placeTagId: placeTagId, page: page);
    if (data.isEmpty) {
      last = true;
      loading(false);
    } else {
      places.addAll(data);
      page++;
      loading(false);
    }
  }
}
