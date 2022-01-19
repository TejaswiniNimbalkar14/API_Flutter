import 'package:flutter/material.dart';
import 'package:pisyst_assignment/APIData/data.dart';

import 'service.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  List<Data>? _dataList;
  bool? _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    Services.getData().then((data) {
      setState(() {
        _dataList = data.cast<Data>();
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetched Data',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Card(
          child: ListView.builder(
              itemCount: _dataList == null ? 0 : _dataList!.length,
              itemBuilder: (context, index) {
                Data data = _dataList![index];
                return ListTile(
                  title: Text('Title: ' + data.title),
                  subtitle: Text('ID: ' + data.id.toString()),
                  tileColor: Colors.grey.shade100,
                  horizontalTitleGap: 10.0,
                  onTap: () {
                    var alert = AlertDialog(
                      title: Text('Url : ' + data.url),
                      content: Text('Thumbnail Url: ' + data.thumbnailUrl),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => alert);
                  },
                );
              }),
        ),
      ),
    );
  }
}
