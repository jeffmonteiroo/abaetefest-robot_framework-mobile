#!/bin/bash
pkill -f appium  # Encerrar qualquer instância do Appium que esteja em execução
npx appium &  # Iniciar uma nova instância do Appium
