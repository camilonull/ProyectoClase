import 'package:calc_app/models/features_model.dart';
import 'package:calc_app/providers/db_features.dart';
import 'package:flutter/foundation.dart';

class ExpensesProvider extends ChangeNotifier {
  List<FeaturesModel> flist = [];

  addNewFeature(FeaturesModel newFeature) async {
    final id = await DBFEatures.db.addNewFeature(newFeature);
    newFeature.id = id;
    flist.add(newFeature);
    notifyListeners();
  }

  getAllFeatures() async {
    final response = await DBFEatures.db.getAllFeatures();
    flist = [...response];
    notifyListeners();
  }

  updateFeatures(FeaturesModel features) async {
    await DBFEatures.db.updateFeatures(features);
    getAllFeatures();
  }
}
