import 'package:flutter/material.dart';
import 'package:unico_check/unico_check.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'unico check',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'unico | check'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements IAcessoBio, IAcessoBioCamera, IAcessoBioDocument{
@override
  void initState() {
    super.initState();
    initAcessoBio();
  }

  late UnicoCheck unicoCheck; 

  Future<void> initAcessoBio() async {
    unicoCheck = new UnicoCheck(context: this, config: UnicoConfig());
  }

  Future<void> openCamera() async {
    unicoCheck.camera!.openCamera();
  }

  Future<void> openCameraNormal() async {
    unicoCheck.camera!.disableSmartFrame();
    unicoCheck.camera!.disableAutoCapture();
    unicoCheck.camera!.openCamera();
  }

   Future <void> openCameraDocument() async {
    unicoCheck.document!.openCameraDocument(
      documentType: DocumentsTypeConstants.cnh,
    );
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(  
              margin: EdgeInsets.all(25),  
              child:
            Text(
              'Bem-vindo a PoC do unico | check!',
              style: TextStyle(fontSize: 20.0),
            ),
            ),
            Container(  
              margin: EdgeInsets.all(25),  
              child:
            Text(
              'Teste nossa tecnologia agora:', 
              style: TextStyle(fontSize: 15.0),
            ),
            ),
            Container(  
              margin: EdgeInsets.all(10),  
              child:
            FlatButton(
              onPressed: openCameraNormal, 
              child: Text('Camera normal'),
              color: Colors.purple,
              textColor: Colors.white,
              
              ),
            ),
            Container(  
              margin: EdgeInsets.all(10),  
              child:
            FlatButton(
              onPressed: openCamera, 
              child: Text('Camera inteligente'),
              color: Colors.purple,
              textColor: Colors.white
              ),
            ),
            Container(  
              margin: EdgeInsets.all(10),  
              child:
            FlatButton(
              onPressed: openCameraDocument, 
              child: Text('Documentos'),
              color: Colors.purple,
              textColor: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  void onErrorAcessoBio(ErrorBioResponse error) {
      // TODO: implement onErrorAcessoBio
    }
  
    @override
    void onErrorCamera(ErrorBioResponse error) {
      // TODO: implement onErrorCamera
    }
  
    @override
    void onSuccessCamera(CameraResponse response) {
    // TODO: implement onSuccessCamera
  }

  @override
  void userClosedCameraManually() {
    // TODO: implement userClosedCameraManually
  }

  //override do Documents
  @override
  void onErrorDocument(String error) {
    
  }

  @override
  void onErrorFaceMatch(String error) {
    
  }

  @override
  void onErrorOCR(String error) {
    
  }

  @override
  void onSuccessFaceMatch(FacematchResponse response) {
    
  }

  @override
  void onSuccesstDocument(CameraDocumentResponse response) {
    
  }


}
