#!/usr/bin/env bash
echo "Executing the download_data.sh script"

# === Config destination folder ===
DEST_DIR="$HOME/work/data"
# Ensure destination folder exists
mkdir -p "$DEST_DIR"

# === S3 settings ===
mc alias set s3sspcloud https://minio.lab.sspcloud.fr "" ""

# === Scarica i file nella directory temporanea o direttamente ===
# Opzione 1: Scarica mantenendo la struttura (più pulito)
echo "Downloading files with folder structure..."
mc cp --recursive "s3sspcloud/decubellis/Step1/Input/" "$DEST_DIR/Step1/Input/"
mc cp --recursive "s3sspcloud/decubellis/Step1/Output/" "$DEST_DIR/Step1/Output/"
mc cp --recursive "s3sspcloud/decubellis/Step2/Output/" "$DEST_DIR/Step2/Output/"
mc cp --recursive "s3sspcloud/decubellis/Step4/Input/" "$DEST_DIR/Step4/Input/"

echo "Files are now organized in their respective folders:"
echo "  - $DEST_DIR/Step1/Input/"
echo "  - $DEST_DIR/Step1/Output/"
echo "  - $DEST_DIR/Step2/Output/"
echo "  - $DEST_DIR/Step4/Input/"