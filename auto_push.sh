#!/bin/bash
while true
do
    git add .
    git commit -m "Auto-save changes"
    git push origin main
    sleep 300  # Cada 5 minutos
done
