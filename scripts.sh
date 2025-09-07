#!/bin/bash

# Script para facilitar o trabalho com submódulos do TechBlog
# Uso: ./scripts.sh [comando]

case "$1" in
    "setup")
        echo "🔄 Inicializando e atualizando submódulos..."
        git submodule update --init --recursive
        echo "✅ Submódulos configurados!"
        ;;
    
    "update")
        echo "🔄 Atualizando todos os submódulos..."
        git submodule update --remote
        echo "✅ Submódulos atualizados!"
        ;;
        
    "status")
        echo "📊 Status dos submódulos:"
        git submodule status
        echo ""
        echo "📊 Status dos repositórios dos submódulos:"
        git submodule foreach 'echo "=== $name ===" && git status --short'
        ;;
        
    "install")
        echo "📦 Instalando dependências do backend..."
        cd back-techblog && npm install
        echo "📦 Instalando dependências do frontend..."
        cd ../front-techblog && npm install
        echo "✅ Todas as dependências instaladas!"
        ;;
        
    "dev")
        echo "🚀 Iniciando servidores de desenvolvimento..."
        echo "Backend rodará na porta 3000"
        echo "Frontend rodará na porta 5173"
        echo ""
        echo "Pressione Ctrl+C para parar os servidores"
        
        # Inicia backend em background
        cd back-techblog && npm run dev &
        BACK_PID=$!
        
        # Inicia frontend em background
        cd ../front-techblog && npm run dev &
        FRONT_PID=$!
        
        # Aguarda interrupção
        wait $BACK_PID $FRONT_PID
        ;;
        
    "commit")
        if [ -z "$2" ]; then
            echo "❌ Erro: Forneça uma mensagem de commit"
            echo "Uso: ./scripts.sh commit 'Sua mensagem'"
            exit 1
        fi
        
        echo "💾 Fazendo commit das referências dos submódulos..."
        git add .gitmodules back-techblog front-techblog
        git commit -m "$2"
        echo "✅ Commit realizado!"
        ;;
        
    "push")
        echo "🚀 Fazendo push das mudanças..."
        git push origin main
        echo "✅ Push realizado!"
        ;;
        
    "reset")
        echo "⚠️  Resetando submódulos para o estado commitado..."
        git submodule update --init --recursive --force
        echo "✅ Submódulos resetados!"
        ;;
        
    *)
        echo "🔧 Script de utilitários para TechBlog com Git Submodules"
        echo ""
        echo "Comandos disponíveis:"
        echo "  setup     - Inicializa e atualiza todos os submódulos"
        echo "  update    - Atualiza submódulos para versão mais recente"
        echo "  status    - Mostra status de todos os submódulos"
        echo "  install   - Instala dependências de todos os projetos"
        echo "  dev       - Inicia servidores de desenvolvimento"
        echo "  commit    - Commit das referências dos submódulos"
        echo "  push      - Push das mudanças para o repositório"
        echo "  reset     - Reseta submódulos para estado commitado"
        echo ""
        echo "Exemplo: ./scripts.sh setup"
        ;;
esac
