#!/bin/bash

function escolher_plataforma {
    clear
    echo "Em qual plataforma você deseja executar?"
    echo "1 - Android"
    echo "2 - iOS"
    echo "3 - Sair"
    read -p "Escolha uma opção (ou qualquer outra tecla para sair): " option
    case "$option" in
        "1" | "Android" | "android")
            platform="Android"
            echo "Plataforma escolhida: $platform"
            ;;
        "2" | "iPhone" | "iphone" | "iOS" | "ios" | "IOS")
            platform="iPhone"
            echo "Plataforma escolhida: $platform"
            escolher_dispositivo_ios
            ;;
        "3")
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida!"
            exit 1
            ;;
    esac
}

function escolher_dispositivo_ios {
    clear
    echo "Escolha o dispositivo iOS:"
    echo "1 - iPhone SE (3rd generation)"
    echo "2 - iPhone 15"
    echo "3 - iPhone 15 Plus"
    echo "4 - iPhone 15 Pro"
    echo "5 - iPhone 15 Pro Max"
    echo "6 - iPad (10th generation)"
    echo "7 - iPad mini (6th generation)"
    echo "8 - iPad Air 11-inch (M2)"
    echo "9 - iPad Air 13-inch (M2)"
    echo "10 - iPad Pro 11-inch (M4)"
    echo "11 - iPad Pro 13-inch (M4)"
    read -p "Escolha um dispositivo: " device_option
    case "$device_option" in
        "1") device_name="iPhone SE (3rd generation)" ;;
        "2") device_name="iPhone 15" ;;
        "3") device_name="iPhone 15 Plus" ;;
        "4") device_name="iPhone 15 Pro" ;;
        "5") device_name="iPhone 15 Pro Max" ;;
        "6") device_name="iPad (10th generation)" ;;
        "7") device_name="iPad mini (6th generation)" ;;
        "8") device_name="iPad Air 11-inch (M2)" ;;
        "9") device_name="iPad Air 13-inch (M2)" ;;
        "10") device_name="iPad Pro 11-inch (M4)" ;;
        "11") device_name="iPad Pro 13-inch (M4)" ;;
        *)
            echo "Opção inválida!"
            exit 1
            ;;
    esac
    echo "Dispositivo escolhido: $device_name"
}

function escolher_funcionalidade_iphone {
    while true; do
        clear
        echo "Qual funcionalidade você deseja executar?"
        echo "1 - Listar Eventos"
        echo "2 - Verificar contato"
        echo "3 - Verificar locais"
        echo "0 - Voltar para a opção anterior"
        read -p "Escolha uma opção: " option
        case "$option" in
            "1" | "ListarEventos" | "listareventos")
                escolher_cenario_listar_eventos
                break
                ;; 
            "2" | "Verificar Contato" | "verificarcontato" | "Contato" | "contato")
                escolher_cenario_verificar_contato
                break
                ;;
            "3" | "Verificar Locais" | "verificarlocais" | "Locais" | "locais")
                escolher_cenario_verificar_locais
                break
                ;;
            "0")
                escolher_plataforma
                return
                ;;
            *)
                echo "Opção inválida!"
                ;;
        esac
    done
}

function escolher_cenario_verificar_contato {
    while true; do
        clear
        echo "Qual opção você deseja executar?"
        echo "CT01 - Verificar dados de contato"
        echo "0 - Voltar"
        read -p "Escolha uma opção: " option
        case "$option" in
            "CT01" | "ct01" | "1" | "ct1" | "CT1")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT01 - Verificar dados de contato" tests/verifyContactTests.robot
                break
                ;;
            "0")
                escolher_funcionalidade_iphone
                return
                ;;
            *)
                echo "Opção inválida!"
                ;;
        esac
    done
}

function escolher_cenario_verificar_locais {
    while true; do
        clear
        echo "Qual opção você deseja executar?"
        echo "CT01 - Listar locais por categoria: Artigos de Pesca Esportiva"
        echo "CT02 - Listar local por categoria: Churrascarias/Espetarias "
        echo "CT03 - Listar local por categoria: Farmácias"
        echo "CT04 - Listar locais por categoria: Açaí"
        echo "CT05 - Visualizar mapa por categoria: Bancos"
        echo "CT06 - Visualizar mapa por categoria: Hotéis"
        echo "CT07 - Visualizar mapa por categoria: Hospitais e Postos de Saúde"
        echo "CT08 - Visualizar mapa por categoria: Pub & Restaurante"
        echo "ALL - Executar todos os cenários"
        echo "0 - Voltar"
        read -p "Escolha uma opção: " option
        case "$option" in
            "CT01" | "ct01" | "1" | "ct1" | "CT1")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT01 - Listar locais por categoria: Artigos de Pesca Esportiva" tests/verifyLocationsTests.robot
                break
                ;;
            "CT02" | "ct02" | "2" | "ct2" | "CT2")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT02 - Listar local por categoria: Churrascarias/Espetarias" tests/verifyLocationsTests.robot
                break
                ;;
            "CT03" | "ct03" | "3" | "ct3" | "CT3")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT03 - Listar local por categoria: Farmácias" tests/verifyLocationsTests.robot
                break
                ;;
            "CT04" | "ct04" | "4" | "ct4" | "CT4")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT04 - Listar local por categoria: Açaí" tests/verifyLocationsTests.robot
                break
                ;;
            "CT05" | "ct05" | "5" | "ct5" | "CT5")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT05 - Visualizar mapa por categoria: Bancos" tests/verifyLocationsTests.robot
                break
                ;;
            "CT06" | "ct06" | "6" | "ct6" | "CT6")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT06 - Visualizar mapa por categoria: Hotéis" tests/verifyLocationsTests.robot
                break
                ;;
            "CT07" | "ct07" | "7" | "ct7" | "CT7")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT05 - Visualizar mapa por categoria: Hospitais e Postos de Saúde" tests/verifyLocationsTests.robot
                break
                ;;
            "CT08" | "ct08" | "8" | "ct8" | "CT8")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT05 - Visualizar mapa por categoria: Pub & Restaurante" tests/verifyLocationsTests.robot
                break
                ;;
            "ALL" | "all")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ tests/verifyLocationsTests.robot
                break
                ;;
            "0")
                escolher_funcionalidade_iphone
                return
                ;;
            *)
                echo "Opção inválida!"
                ;;
        esac
    done
}

function escolher_cenario_listar_eventos {
    while true; do
        clear
        echo "Qual Cenário de teste você deseja executar?"
        echo "CT1 - Visualizar eventos por categoria: Todos"
        echo "CT2 - Visualizar eventos por categoria: Festas"
        echo "CT3 - Visualizar eventos por categoria: Cultural"
        echo "CT4 - Visualizar eventos por categoria: Esportivo"
        echo "CT5 - Visualizar eventos por categoria: Turismo"
        echo "CT6 - Pesquisar evento pelo nome"
        echo "CT7 - Pesquisar pelo nome o último evento da lista"
        echo "ALL - Executar todos os cenários"
        echo "0 - Voltar"
        read -p "Escolha uma opção (ou qualquer outra tecla para sair): " cenario
        case "$cenario" in
            "CT01" | "ct01" | "1" | "ct1" | "CT1")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT1 - Visualizar eventos por categoria: Todos" tests/viewEventTests.robot
                break
                ;;
            "CT02" | "ct02" | "2" | "ct2" | "CT2")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT2 - Visualizar eventos por categoria: Festas" tests/viewEventTests.robot
                break
                ;;
            "CT03" | "ct03" | "3" | "ct3" | "CT3")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT3 - Visualizar eventos por categoria: Cultural" tests/viewEventTests.robot
                break
                ;;
            "CT04" | "ct04" | "4" | "ct4" | "CT4")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT4 - Visualizar eventos por categoria: Esportivo" tests/viewEventTests.robot
                break
                ;;
            "CT05" | "ct05" | "5" | "ct5" | "CT5")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT5 - Visualizar eventos por categoria: Turismo" tests/viewEventTests.robot
                break
                ;;
            "CT06" | "ct06" | "6" | "ct6" | "CT6")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT6 - Pesquisar evento pelo nome" tests/viewEventTests.robot
                break
                ;;
            "CT07" | "ct07" | "7" | "ct7" | "CT7")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ --test "CT7 - Pesquisar pelo nome o último evento da lista" tests/viewEventTests.robot
                break
                ;;
            "ALL" | "all" | "8")
                robot -v PLATFORM:ios -v DEVICE_NAME:"$device_name" -d logs/ios/ tests/viewEventTests.robot
                break
                ;;
            "0")
                escolher_funcionalidade_iphone
                return
                ;;
            *)
                echo "Opção inválida!"
                ;;
        esac
    done
}

# Guardar o diretório atual
current_dir=$(pwd)

# Ir para o diretório do Appium e executar open_appium.sh
cd Appium && ./open_appium.sh
cd "$current_dir"  # Voltar ao diretório original

# Esperar um pouco para garantir que o Appium está pronto
sleep 5

escolher_plataforma

if [ "$platform" == "iPhone" ]; then
    escolher_funcionalidade_iphone
elif [ "$platform" == "Android" ]; then
    echo "Executando testes para Android..."
    # Comandos para Android aqui
else
    echo "Plataforma desconhecida!"
fi

# Ir para o diretório do Appium e executar closed_appium.sh
cd Appium && ./closed_appium.sh
cd "$current_dir"  # Voltar ao diretório original
