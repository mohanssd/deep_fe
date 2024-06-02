import 'package:flutter/material.dart';
import 'package:project_deep/apps/home_model.dart';
import 'package:provider/provider.dart';
import 'package:project_deep/apps/my_table.dart';

class RegressionLanding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegressionLandingHome();
  }
}

class _RegressionLandingHome extends State<RegressionLanding> {
  TextEditingController urlController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    urlController.dispose();
    print('=============disposing controller');
    super.dispose();
  }

  GlobalKey _key = GlobalKey<FormState>();
  var _changed = false;
  Map<String, dynamic> _data = {};

  void changeFormState(state) {
    setState(() {
      _changed = state;
    });
  }

  void setNewData(data) {
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 20,
          shadowColor: Colors.black,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: ListView(
              children: [
                TextFormField(
                  controller: urlController,
                  decoration: InputDecoration(
                      hintText: 'https://xxx/xxx/', label: Text('Dataset Url')),
                ),
                ElevatedButton(
                    onPressed: () async {
                      var datasetUrl = urlController.text;
                      var data = {'datasetUrl': datasetUrl};
                      _data =
                          await Provider.of<HomeModel>(context, listen: false)
                              .get_regression_model('/regression', data);
                      if (!_data.entries.isEmpty) {
                        print('==================received data $_data');
                        changeFormState(true);
                      }
                    },
                    child: Text('Process')),
                SizedBox(
                  height: 20,
                ),
                _changed
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: MyTable(
                          rows: _data,
                        ),
                      )
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
