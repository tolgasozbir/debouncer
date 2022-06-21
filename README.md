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
            function: () => search,     // <-- The target method
            milliseconds: 1000,         // <-- The debounce duration
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

## Example



https://user-images.githubusercontent.com/79727679/174880713-51cd2c20-5467-4371-9f94-a1e4230d7bf3.mp4

