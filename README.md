# Detección de EPP Industrial con YOLOv8m
## Redes Neuronales y Aprendizaje Profundo — Ph.D. Aldo Camargo

**Pregunta 3 | Examen Parcial 2026-I | Sección B | Mayo 2026**

---

## Descripción

Detección automática de Equipos de Protección Personal (EPP) en entornos industriales usando YOLOv8m fine-tuned. El sistema detecta 9 clases de EPP e incluye un verificador de cumplimiento normativo y análisis de robustez ante oclusión.

| Métrica | Valor |
|---------|-------|
| mAP@0.5 (test) | **0.967** |
| mAP@0.5:0.95 (test) | 0.433 |
| Tasa de cumplimiento | **87.5%** |
| Degradación con 50% oclusión | 30.8% |

---

## Estructura del Repositorio

```
ppe-detection-yolov8m/
├── colab_training.ipynb     # Notebook principal (YOLOv8m + Compliance + Occlusion)
├── configs/                 # Configuraciones de entrenamiento
├── outputs/                 # Resultados visuales
│   ├── yolo_detections.png
│   ├── per_class_metrics.png
│   ├── compliance_verifier.png
│   └── occlusion_robustness.png
├── reports/                 # Informes académicos
│   ├── Informe_P3_YOLO_EPP.docx
│   └── P3_EPP_YOLOv8m_NeurIPS2026.tex
├── requirements.txt
└── run_all.sh
```

---

## Ejecución

Desarrollado en **Google Colab** con GPU NVIDIA L4.

```bash
# Abrir en Google Colab:
# Archivo → Subir notebook → colab_training.ipynb
```

### Prerrequisitos

- Cuenta Google con acceso a Google Colab
- GPU habilitada: `Entorno de ejecución → Cambiar tipo de entorno → GPU (L4 recomendado)`
- Cuenta Roboflow con API key

### Pasos

```
1. Abrir colab_training.ipynb en Google Colab
2. Configurar API key de Roboflow en Celda 2:
   ROBOFLOW_API_KEY = "tu_api_key"
3. Ejecutar todas las celdas en orden (Runtime → Run all)
4. Dataset: PPE Detection Dataset (Roboflow Universe) — 9 clases, 1,626 imágenes
5. Tiempo estimado: ~30 minutos (GPU L4)
```

### Ejecución por línea de comandos

```bash
bash run_all.sh --p3
```

---

## Dataset

| Campo | Valor |
|-------|-------|
| Nombre | PPE Detection Dataset |
| Fuente | Roboflow Universe |
| Clases | 9 (Hardhat, Mask, NO-Hardhat, NO-Mask, NO-Safety Vest, Person, Safety Cone, Safety Vest, machinery) |
| Imágenes | 1,626 total (train=1,535 / valid=57 / test=34) |
| Licencia | CC BY 4.0 |

---

## Resultados

### Rendimiento por Clase (mAP@0.5)

| Clase | mAP@0.5 |
|-------|---------|
| Hardhat | 0.995 |
| NO-Hardhat | 0.980 |
| NO-Safety Vest | 0.950 |
| Person | 0.996 |
| Safety Vest | 0.992 |
| machinery | 0.938 |
| *(todas las clases)* | **0.967** |

### Verificador de Cumplimiento

- **Tasa de cumplimiento:** 87.5% (7/8 escenas de prueba)
- **Reglas:** Trabajador sin casco → NO-CUMPLE; Sin chaleco → NO-CUMPLE; Sin mascarilla → NO-CUMPLE

### Análisis de Robustez ante Oclusión

| Oclusión | mAP@0.5 |
|----------|---------|
| 0% | 0.767 |
| 10% | 0.740 |
| 20% | 0.690 |
| 30% | 0.650 |
| 40% | 0.590 |
| 50% | 0.541 |
| **Degradación** | **−30.8%** |

---

## Entorno de Ejecución

| Componente | Versión |
|------------|---------|
| Python | 3.12 |
| PyTorch | 2.10.0+cu128 |
| CUDA | 12.8 |
| Ultralytics | 8.4.52 |
| GPU | NVIDIA L4 (22GB) |

---

## Consideraciones Éticas

El sistema implica vigilancia de trabajadores. Ver sección de Ética en `reports/P3_EPP_YOLOv8m_NeurIPS2026.tex` para análisis completo de: privacidad, consentimiento informado, sesgos demográficos y supervisión humana requerida.

---

*Examen Parcial 2026-I — Redes Neuronales y Aprendizaje Profundo*
*Fecha de entrega: 30 de Mayo 2026*
