#!/system/bin/sh

banner() {
    clear
    echo "=================================="
    echo "      CRIADO POR FUSION CHEATERS"
    echo "=================================="
    echo ""
}

menu_replay() {
    while true
    do
        banner

        echo "[1] Copiar replays da pasta Downloads/MRPlayers"
        echo "[2] Verificar versão do replay (JSON)"
        echo "[0] Voltar"

        read op

        case $op in
            1) 
                echo "Copiando arquivos de replays..."
                cp -r /storage/emulated/0/Download/MRPlayers/* /storage/emulated/0/Android/data/com.dts.freefireth/files/MRPlayers/
                echo "Arquivos copiados com sucesso."
                ;;
            2)
                echo "Verificando arquivo JSON mais recente..."
                JSON_FILE=$(ls -t /storage/emulated/0/Download/MRPlayers/*.json | head -1)

                if [ -n "$JSON_FILE" ]; then
                    echo "Arquivo JSON mais recente: $JSON_FILE"
                    echo "Lendo versão do JSON..."
                    VERSION=$(grep -o '"version":"[^"]*"' "$JSON_FILE" | head -1)
                    echo "Versão encontrada: $VERSION"
                else
                    echo "Nenhum arquivo JSON encontrado."
                fi
                ;;
            0) 
                break;;
            *) 
                echo "Opção inválida";;
        esac

        read -p "Pressione Enter para continuar..."
    done
}

menu_opcoes() {
    while true
    do
        banner

        echo "[1] Desativar modo desenvolvedor"
        echo "[2] Desligar depuração Wi-Fi"
        echo "[3] Revogar depuração USB"
        echo "[4] Verificar arquivos recentes"
        echo "[5] Limpar arquivos temporários"
        echo "[0] Voltar"

        read op

        case $op in
            1) echo "Executando...";;
            2) echo "Executando...";;
            3) echo "Executando...";;
            4) echo "Verificando...";;
            5) echo "Limpando...";;
            0) break;;
            *) echo "Opção inválida";;
        esac

        read -p "Pressione Enter para continuar..."
    done
}

conectar_wifi() {
    banner

    echo "Digite o IP do dispositivo:"
    read IP

    echo "Digite a porta:"
    read PORTA

    echo "Digite o código de pareamento:"
    read CODIGO

    echo ""
    echo "IP: $IP"
    echo "Porta: $PORTA"
    echo "Código de pareamento: $CODIGO"

    echo "Conectando via ADB..."
    adb connect $IP:$PORTA
    echo "Dispositivos conectados:"
    adb devices
    read -p "Pressione Enter para continuar..."
}

parear() {
    banner

    echo "PAREAMENTO"
    echo "Função em desenvolvimento"
    read -p "Pressione Enter para continuar..."
}

status_conexao() {
    banner

    echo "Verificando dispositivos ADB conectados..."
    adb devices
    read -p "Pressione Enter para continuar..."
}

while true
do
    banner

    echo "[1] Passar Replay"
    echo "[2] Conectar Depuração"
    echo "[3] Parear"
    echo "[4] Opções"
    echo "[5] Verificar Conexão"
    echo "[6] Sair"

    read opcao

    case $opcao in
        1) menu_replay;;
        2) conectar_wifi;;
        3) parear;;
        4) menu_opcoes;;
        5) status_conexao;;
        6) exit;;
        *) echo "Opção inválida";;
    esac

    read -p "Pressione Enter para continuar..."
donedone
