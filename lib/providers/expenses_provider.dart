import 'dart:convert';

import 'package:calc_app/models/combined_model.dart';
import 'package:calc_app/models/expenses_model.dart';
import 'package:calc_app/models/features_model.dart';
import 'package:calc_app/providers/db_expenses.dart';
import 'package:calc_app/providers/db_features.dart';
import 'package:flutter/foundation.dart';

class ExpensesProvider extends ChangeNotifier {
  List<FeaturesModel> flist = [];
  List<ExpensesModel> eList = [];
  List<CombinedModel> cList = [];

  addNewFeature(FeaturesModel newFeature) async {
    final id = await DBFEatures.db.addNewFeature(newFeature);
    newFeature.id = id;
    flist.add(newFeature);
    notifyListeners();
  }

  addNewExpense(CombinedModel cModel) async {
    var expenses = ExpensesModel(
        link: cModel.link,
        year: cModel.year,
        month: cModel.month,
        day: cModel.day,
        comment: cModel.comment,
        expense: cModel.amount);

    final id = await DbExpenses.db.addExpense(expenses);
    expenses.id = id;
    eList.add(expenses);
    notifyListeners();
  }

  getAllFeatures() async {
    final response = await DBFEatures.db.getAllFeatures();
    flist = [...response];
    notifyListeners();
  }

  getExpensesByDate(int month, int year) async {
    final response = await DbExpenses.db.getExpenseByDate(month, year);
    eList = [...response];
    notifyListeners();
  }

  updateFeatures(FeaturesModel features) async {
    await DBFEatures.db.updateFeatures(features);
    getAllFeatures();
  }

  updateExpense(CombinedModel cModel) async {
    var expenses = ExpensesModel(
        id: cModel.id,
        link: cModel.year,
        year: cModel.month,
        day: cModel.day,
        comment: cModel.comment,
        expense: cModel.amount);
    await DbExpenses.db.updateExpenses(expenses);
    notifyListeners();
  }

  deleteExpense(int id) async {
    await DbExpenses.db.deleteExpenses(id);
    notifyListeners();
  }

  List<CombinedModel> get groupItemsList {
    List<CombinedModel> cModel = [];

    for (var x in eList) {
      for (var y in flist) {
        if (x.link == y.id) {
          double amount = eList
              .where((e) => e.link == y.id)
              .fold(0.0, (a, b) => a + b.expense);

          cModel.add(CombinedModel(
            category: y.category,
            color: y.color,
            icon: y.icon,
            amount: amount,
          ));
        }
      }
    }

    var encode = cModel.map((e) => jsonEncode(e));
    var unique = encode.toSet();
    var result = unique.map((e) => jsonDecode(e));
    cModel = result.map((e) => CombinedModel.fromJson(e)).toList();

    return cList = [...cModel];
  }

  List<CombinedModel> get allItemsList {
    List<CombinedModel> cModel = [];

    for (var x in eList) {
      for (var y in flist) {
        if (x.link == y.id) {
          cModel.add(CombinedModel(
              category: y.category,
              color: y.color,
              icon: y.icon,
              id: x.id,
              amount: x.expense,
              comment: x.comment,
              year: x.year,
              month: x.month,
              day: x.day));
        }
      }
    }
    return cList = [...cModel];
  }
}
