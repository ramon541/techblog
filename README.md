# TechBlog - Repositório Principal

Este é o repositório principal do projeto TechBlog, que utiliza Git Submodules para organizar o frontend e backend como repositórios separados.

## 📁 Estrutura do Projeto

```
techblog/
├── back-techblog/     # Submódulo - Backend (Node.js/TypeScript)
├── front-techblog/    # Submódulo - Frontend (React/TypeScript)
├── .gitmodules        # Configuração dos submódulos
└── README.md          # Este arquivo
```

## 🔧 Submódulos

### Backend (back-techblog)

-   **Repositório**: https://github.com/ramon541/back-techblog.git
-   **Tecnologias**: Node.js, TypeScript, Prisma
-   **Pasta**: `back-techblog/`

### Frontend (front-techblog)

-   **Repositório**: https://github.com/ramon541/front-techblog.git
-   **Tecnologias**: React, TypeScript, Vite
-   **Pasta**: `front-techblog/`

## 🚀 Como Começar

### 1. Clonando o Repositório Completo

Para clonar o repositório principal junto com todos os submódulos:

```bash
git clone --recursive https://github.com/ramon541/techblog.git
cd techblog
```

### 2. Se Já Clonou Sem os Submódulos

Se você já clonou o repositório principal mas os submódulos estão vazios:

```bash
git submodule init
git submodule update
```

Ou de forma mais direta:

```bash
git submodule update --init --recursive
```

### 3. Atualizando os Submódulos

Para atualizar todos os submódulos para a versão mais recente:

```bash
git submodule update --remote
```

Para atualizar um submódulo específico:

```bash
git submodule update --remote back-techblog
git submodule update --remote front-techblog
```

## 📝 Comandos Úteis para Submódulos

### Verificar Status dos Submódulos

```bash
git submodule status
```

### Navegar e Trabalhar em um Submódulo

```bash
cd back-techblog
git checkout main
git pull origin main
# Fazer suas modificações
git add .
git commit -m "Suas alterações"
git push origin main
```

### Atualizar Referência do Submódulo no Repositório Principal

Após fazer mudanças em um submódulo, você precisa atualizar a referência no repositório principal:

```bash
cd ..  # Voltar para o diretório principal
git add back-techblog  # ou front-techblog
git commit -m "Atualizar referência do submódulo"
git push origin main
```

### Executar Comandos em Todos os Submódulos

```bash
git submodule foreach 'git pull origin main'
git submodule foreach 'git status'
```

## 🔄 Workflow Recomendado

1. **Trabalhe diretamente nos repositórios dos submódulos** para desenvolvimento ativo
2. **Use este repositório principal** apenas para:
    - Coordenar versões entre frontend e backend
    - Documentação geral do projeto
    - Scripts de deploy que envolvem ambos os serviços

### Para Desenvolvimento Diário:

```bash
# Trabalhe diretamente nos repositórios separados
git clone https://github.com/ramon541/back-techblog.git
git clone https://github.com/ramon541/front-techblog.git
```

### Para Deploy ou Releases:

```bash
# Use este repositório com submódulos
git clone --recursive https://github.com/ramon541/techblog.git
```

## ⚠️ Problemas Comuns

### Erro: "cannot chdir to '../../../fron-techblog'"

Este erro indica um problema na configuração do submódulo. Para corrigir:

```bash
git submodule deinit --all
git submodule update --init --recursive
```

### Submódulo Aparece como Modificado Sem Razão

```bash
git submodule update --init
```

### Resetar Submódulos para o Estado Commitado

```bash
git submodule update --init --recursive --force
```

## 🔧 Configuração de Desenvolvimento

### Backend

```bash
cd back-techblog
npm install
npm run dev
```

### Frontend

```bash
cd front-techblog
npm install
npm run dev
```

## 📚 Links Úteis

-   [Documentação oficial do Git Submodules](https://git-scm.com/book/pt-br/v2/Ferramentas-do-Git-Subm%C3%B3dulos)
-   [Backend Repository](https://github.com/ramon541/back-techblog)
-   [Frontend Repository](https://github.com/ramon541/front-techblog)

---

**Nota**: Este é um repositório que utiliza Git Submodules. Cada submódulo é um repositório Git independente. Para desenvolvimento ativo, considere trabalhar diretamente nos repositórios individuais do backend e frontend.
