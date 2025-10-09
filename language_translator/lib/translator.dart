import "package:flutter/material.dart";
import "package:translator/translator.dart";

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {

  final languages = ["Chinese", "English"];
  String origin = "From";
  String destination = "To";
  String output = "";
  TextEditingController languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Translator"),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      backgroundColor: Color(0xff10223d),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      origin, style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropdownStringItem) {
                      return DropdownMenuItem(value: dropdownStringItem, child: Text(dropdownStringItem));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        origin = value!;
                      });
                    },
                  ),
                  SizedBox(width: 40),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.white, size: 40),
                  SizedBox(width: 40),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destination, style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropdownStringItem) {
                      return DropdownMenuItem(value: dropdownStringItem, child: Text(dropdownStringItem));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destination = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Please enter your text",
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1,),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your text to translate";
                    } return null;
                  },
                )
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2b3c5a)),
                    onPressed: () {
                      translate(getLanguageCode(origin), getLanguageCode(destination), languageController.text.toString());
                    },
                    child: Text("Translate")),
              ),
              SizedBox(height: 20,),
              Text("\n$output", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
            ],
          ),
        )
      ),
    );
  }

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    final translation = await translator.translate(input, from: src, to: dest);

    setState(() {
      output = translation.text.toString();
    });

    if (src == "--" || dest == "--") {
      setState(() {
        output = "Fail to translate";
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == "English") {
      return "en";
    } else if (language == "Chinese") {
      return "zh-tw";
    } else {
      return "--";
    }
  }
}
