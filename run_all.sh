#!/bin/bash
# ============================================================
# run_all.sh — Detección de EPP Industrial con YOLOv8m
# Redes Neuronales y Aprendizaje Profundo — Ph.D. Aldo Camargo
# Pregunta 3 — Examen Parcial 2026-I
# ============================================================
# Prerrequisitos:
#   - Python 3.12 + pip
#   - GPU CUDA 12.x (recomendado NVIDIA L4 en Google Colab)
#   - API key de Roboflow (variable de entorno ROBOFLOW_API_KEY)
#
# Uso:
#   bash run_all.sh
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}============================================================${NC}"
echo -e "${BLUE}  Detección EPP Industrial — YOLOv8m                        ${NC}"
echo -e "${BLUE}  Redes Neuronales y Aprendizaje Profundo                    ${NC}"
echo -e "${BLUE}  Ph.D. Aldo Camargo — Examen Parcial 2026-I               ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""

echo -e "${YELLOW}[0/1] Instalando dependencias...${NC}"
pip install -r requirements.txt -q
echo -e "${GREEN}✓ Dependencias instaladas${NC}"
echo ""

if [ -z "$ROBOFLOW_API_KEY" ]; then
    echo -e "${RED}ADVERTENCIA: Variable ROBOFLOW_API_KEY no definida.${NC}"
    echo "  Exporta tu API key: export ROBOFLOW_API_KEY=tu_api_key"
    echo "  O edita la Celda 2 del notebook directamente."
    echo ""
fi

echo -e "${BLUE}[1/1] Ejecutando: Detección EPP YOLOv8m${NC}"
echo "      Dataset: PPE Detection (Roboflow, 9 clases, 1,626 imágenes)"
echo "      Tiempo estimado: ~30 min (GPU L4)"
echo ""

jupyter nbconvert --to notebook --execute \
    --ExecutePreprocessor.timeout=3600 \
    --ExecutePreprocessor.kernel_name=python3 \
    --inplace "colab_training.ipynb"

echo -e "${GREEN}✓ Entrenamiento completado${NC}"
echo ""
echo -e "${GREEN}============================================================${NC}"
echo -e "${GREEN}  EJECUCIÓN COMPLETA                                        ${NC}"
echo -e "${GREEN}============================================================${NC}"
echo ""
echo "Resultados esperados:"
echo "  YOLOv8m test:    mAP@0.5=0.967, mAP@0.5:0.95=0.433"
echo "  Cumplimiento:    87.5% tasa de cumplimiento"
echo "  Robustez:        Degradación 30.8% (0% a 50% de oclusión)"
echo ""
echo "Resultados visuales en: outputs/"
echo "Informes en:            reports/"
echo ""
