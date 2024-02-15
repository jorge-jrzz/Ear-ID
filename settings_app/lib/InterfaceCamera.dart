import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'main.dart';

Future<List<CameraDescription>> getCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await availableCameras();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(InterfaceCamera(cameras: cameras));
}

class InterfaceCamera extends StatefulWidget {
  final List<CameraDescription> cameras;

  const InterfaceCamera({Key? key, required this.cameras}) : super(key: key);

  @override
  _InterfaceCameraState createState() => _InterfaceCameraState();
}

class _InterfaceCameraState extends State<InterfaceCamera> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    final frontCamera = widget.cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => widget.cameras.first,
    );
    _controller = CameraController(
      frontCamera,
      ResolutionPreset.max,
    );
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      await _controller.initialize();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error al inicializar la cámara: $e');
      if (e is CameraException) {
        print(
            'Código de error: ${e.code}\nDescripción del error: ${e.description}');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: CameraPreview(_controller),
    );
  }
}
