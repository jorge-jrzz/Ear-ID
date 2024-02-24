from PIL import Image
# import pyheif
import os

def change_folder_extension(input_folder, output_folder, extension='jpg'):
    # Verificar si la carpeta existe
    if not os.path.exists(input_folder):
        print(f"La carpeta '{input_folder}' no existe.")
        return

    # Obtener la lista de archivos en la carpeta
    archivos = os.listdir(input_folder)

    # Filtrar solo los archivos con la extensión deseada (por ejemplo, '.png')
    fotos = [archivo for archivo in archivos if archivo.lower().endswith(('.png', '.gif', '.heic'))]

    if not fotos:
        print(f"No se encontraron fotos en la carpeta '{input_folder}'.")
        return

    # Verifica si la carpeta de salida existe, de lo contrario, créala
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Cambiar la extensión de las fotos y guardarlas en la carpeta de destino
    for foto in fotos:
        ruta_completa_origen = os.path.join(input_folder, foto)
        nombre_base, _ = os.path.splitext(foto)
        nueva_ruta = os.path.join(output_folder, f"{nombre_base}.{extension}")
        os.rename(ruta_completa_origen, nueva_ruta)
        print(f"Se ha convertido '{foto}' a '{nombre_base}.jpg'")

    print(f"Proceso completado. Las fotos se han convertido a formato '{extension}' y se encuentran en la carpeta '{output_folder}'.")

def reduce_image_size(input_folder, output_folder, quality=80):
    # Verifica si la carpeta de salida existe, de lo contrario, créala
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Recorre todos los archivos en la carpeta de entrada
    for filename in os.listdir(input_folder):
        input_path = os.path.join(input_folder, filename)
        output_path = os.path.join(output_folder, filename)

        # Verifica si el archivo es una imagen (puedes agregar más extensiones según sea necesario)
        if input_path.lower().endswith(('.jpg', '.jpeg', '.heic')):
            try:
                with Image.open(input_path) as img:
                    img.save(output_path, optimize=True, quality=quality)
            except Exception as e:
                print(f"Error processing {input_path}: {e}")
                continue
            # except (OSError, IOError):
            #     try:
            #         # Si falla, intenta abrir la imagen como HEIC usando pyheif
            #         #
            #         heif_file = pyheif.read(input_path)
            #         image = Image.frombytes(
            #             heif_file.mode,
            #             heif_file.size,
            #             heif_file.data,
            #             "raw",
            #             heif_file.mode,
            #             heif_file.stride,
            #         )
            #         image.save(output_path, format="JPEG", optimize=True, quality=quality)
            #     except Exception as e:
            #         print(f"Error processing {input_path}: {e}")
            #         continue

if __name__ == "__main__":

    while True:
        print("¿Que desea realisar con imagenes?")
        print("1- Cambiar la extención de las fotos \n2- Reducir la calidad de las imagenes (No funciona con .HEIC) \n0- Salir")
        task = input("Opción: ")
        if task == '0':
            exit()

        elif task == '1':
            input_folder = input("Ruta del directorio con la fotos: ")
            output_folder = input("Ruta del directorio destino: ")
            extension = input("Extencion: ")
            change_folder_extension(input_folder, output_folder) if extension == "" else change_folder_extension(input_folder, output_folder, extension)

        elif task == '2':
            input_folder = input("Ruta del directorio con la fotos: ")
            output_folder = input("Ruta del directorio destino: ")
            quality = input("Calidad (0-100): ")
            reduce_image_size(input_folder, output_folder) if quality == "" else reduce_image_size(input_folder, output_folder, int(quality))
