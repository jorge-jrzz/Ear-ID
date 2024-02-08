import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<List<CameraDescription>> getCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await availableCameras();
}

void main() => runApp(const BEBA());

class BEBA extends StatelessWidget {
  const BEBA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CameraDescription>? cameras;
  CameraController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("BEBA",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ))),
        backgroundColor: const Color.fromARGB(255, 4, 36, 83),
      ),
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EL BANCO DE MÉXICO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            Image.asset('assets/imagexd.gif'),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final cameras = await getCameras();
                    final controller = CameraController(
                        cameras[0], ResolutionPreset.medium,
                        enableAudio: false);
                    await controller.initialize();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CameraPreviewScreen(controller: controller),
                      ),
                    );
                  },
                  child: Text('Iniciar'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Emergencias'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
              ],
            ),
            if (controller != null && controller!.value.isInitialized)
              AspectRatio(
                aspectRatio: controller!.value.aspectRatio,
                child: CameraPreview(controller!),
              ),
          ],
        ),
      ),
    );
  }
}

class CameraPreviewScreen extends StatefulWidget {
  final CameraController controller;

  const CameraPreviewScreen({Key? key, required this.controller})
      : super(key: key);

  @override
  _CameraPreviewScreenState createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("BEBA",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ))),
        backgroundColor: const Color.fromARGB(255, 4, 36, 83),
      ),
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              child: AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: CameraPreview(widget.controller),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: FadeTransition(
                opacity: _controller,
                child: Image.asset('assets/EarIDicon.png',
                    width:
                        100), // Asegúrate de reemplazar esto con la ruta a tu imagen
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen({required this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium,
        enableAudio: false);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return CameraPreviewScreen(controller: controller);
  }
}
