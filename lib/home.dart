import 'package:debouncer/debouncer.dart';
import 'package:debouncer/user_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<User> _dummyData = [
    User(1, "Chicky", "https://robohash.org/harumessequi.jpg?size=100x100&set=set1"),
    User(2, "Thomasine", "https://robohash.org/architectoculpanon.jpg?size=100x100&set=set1"),
    User(3, "Lee", "https://robohash.org/hicvoluptatesodit.jpg?size=100x100&set=set1"),
    User(4, "Pooh", "https://robohash.org/consequunturvoluptatemnemo.jpg?size=100x100&set=set1"),
    User(5, "Hamlin", "https://robohash.org/perferendisvitaemodi.jpg?size=100x100&set=set1"),
    User(6, "Spencer", "https://robohash.org/ametfacerefugit.jpg?size=100x100&set=set1"),
    User(7, "Man", "https://robohash.org/reprehenderitcorruptihic.jpg?size=100x100&set=set1"),
    User(8, "Esmeralda", "https://robohash.org/quaspraesentiumrerum.jpg?size=100x100&set=set1"),
    User(9, "Casie", "https://robohash.org/fugiatvelea.jpg?size=100x100&set=set1"),
    User(10, "Veronique", "https://robohash.org/quisenimvel.jpg?size=100x100&set=set1"),
  ];
  List<User> _searchResults = [];
  TextEditingController _controller = TextEditingController();
  final _debouncer = Debouncer();

  @override
  void initState() {
    _searchResults = _dummyData;
    super.initState();
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Debouncer")),
      body: SafeArea(child: buildBody()),
    );
  }

  Widget buildBody(){
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            searchTextField(),
            Expanded(child: userListView()),
          ],
        ),
      ),
    );
  }

  TextField searchTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        label: Text("Search"),
        hintText: "Shelby",
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        border: OutlineInputBorder()
      ),
      onChanged: (String text){
        _debouncer.debounce(function: search, milliseconds: 1000);
      }
    );
  }

  void search(){
    String query = _controller.text;
    setState(() => _searchResults = _dummyData.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList());
  }

  ListView userListView() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (BuildContext context, int index) {
        User user = _searchResults[index];
        return userListTile(user);
      },
    );
  }

  ListTile userListTile(User user) {
    return ListTile(
      leading: userCircleAvatar(user.image),
      title: Text("${user.name}"),
      subtitle: Text("${user.id}"),
    );
  }

  CircleAvatar userCircleAvatar(String image) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      backgroundImage: NetworkImage(image)
    );
  }


}