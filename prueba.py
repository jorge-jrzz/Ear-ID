# Importacion de los modulos necesarios
import cv2

# Realizar Video Captura
cap = cv2.VideoCapture(0)

while True:
    # Leer fotogramas
    ret, frame = cap.read()

    cv2.imshow('DETECCION Y SEGMENTACION DE OREJAS', frame)

    # Cerrar el video con la tecla ESC
    if cv2.waitKey(1) == 27:
        break

cap.release()
cv2.destroyAllWindows()
