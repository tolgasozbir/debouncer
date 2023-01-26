# debouncer

Simple debounce for dart [Flutter](https://github.com/flutter/flutter)

## Usage

```dart
import '../debouncer.dart';

final _debouncer = Debouncer();
TextEditingController _controller = TextEditingController();

    //...
    child: TextField(
      controller: _controller,
      onChanged: (String text){
        _debouncer.debounce(
            function: () => search,     // <-- The target method
            milliseconds: 1000,         // <-- The debounce duration
        );
      }
    );
    //...
    
    //TODO: do sth
    void search(){
        String query = _controller.text;
        setState(() => _searchResults = _dummyData.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList());
    }
```

Debounce base duration:`500 milliseconds.`


## Dispose
```dart
  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
```