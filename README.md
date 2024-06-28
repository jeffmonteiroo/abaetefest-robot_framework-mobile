# Automação de Teste Mobile com Robot Framework no Web Site AbaeteFest 

## Descrição

Automação de teste no Web Site AbaeteFest utilizando o Robot Framework com foco em mobile.

## Estrutura do Projeto

- **Appium/**: Scripts para iniciar e parar o servidor Appium.
  - `open_appium.sh`
  - `closed_appium.sh`
- **logs/**: Diretório para armazenar os logs dos testes.
- **resources/**: Recursos e utilitários comuns usados nos testes.
  - `android_resources.robot`
  - `common_resources.robot`
  - `element_locators.robot`
  - `ios_resources.robot`
- **tests/**: Diretório contendo os casos de teste.
  - `VerifyContactTests.robot`
  - `VerifyFunctionsTests.robot`
  - `VerifyLocationsTests.robot`
  - `ViewEventTests.robot`
  - `ViewTouristAttractionsTests.robot`
- `run_tests.sh`: Script para executar todos os testes.

## Pré-requisitos

- [Python](https://www.python.org/downloads/)
- [Robot Framework](https://robotframework.org/)
- [Appium](http://appium.io/)
- [Node.js](https://nodejs.org/)
- [Xcode](https://developer.apple.com/xcode/) (para iOS)
- [Android Studio](https://developer.android.com/studio) (para Android)

## Bibliotecas Utilizadas

- `AppiumLibrary`
- `Collections`
- `BuiltIn`
- `String`

## Configuração

### Instalação do Robot Framework

1. Instale o Robot Framework:
   ```sh
   pip install robotframework
   ```

### Instalação do Appium Library para Robot Framework:

2. Instale o Robot Framework:
   ```sh
   pip install robotframework-appiumlibrary
   ```

### Instalação do Appium 

3. Instale o Appium
   ```sh
   npm i --location=global appium
   ```

### Instalação dos Drives Appium 

4. Instale o Driver uiautomator2 para testes no Android
   ```sh
   appium driver install uiautomator2
   ```

5. Instale o Driver xcuitest para testes com iOS
   ```sh
   appium driver install xcuitest
   ```

5. Verificar se os Drivers foram instalados corretamente
   ```sh
    appium driver list
    ```

### Executando os testes

6. Execute o Arquivo
   ```sh
   ./run_tests.sh
   ```

### Lista de dispositivos pré-configurados para os testes com iOS

   ```sh   
    "iPhone SE (3rd generation)" 
    "iPhone 15" 
    "iPhone 15 Plus" 
    "iPhone 15 Pro" 
    "iPhone 15 Pro Max" 
    "iPad (10th generation)" 
    "iPad mini (6th generation)"
    "iPad Air 11-inch (M2)"
     "iPad Air 13-inch (M2)"
    "iPad Pro 11-inch (M4)"
    "iPad Pro 13-inch (M4)"
   ```

### Testes com Android ainda não implementado
    