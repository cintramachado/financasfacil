# financasfacil

A new Flutter project.

## Getting Started

# 📊 Finanças Fácil

Um aplicativo Flutter para análise financeira automatizada baseado em dados de Balanço Patrimonial e DRE (Demonstração de Resultado do Exercício).

## 🚀 Funcionalidades

- **Entrada de Dados Interativa**: Campos de entrada para dados do Balanço Patrimonial e DRE
- **Cálculos Automáticos**: Todos os indicadores são calculados automaticamente ao inserir os dados
- **Indicadores Completos**: 
  - Prazos Médios (PME, PMR, PMP, Ciclo Operacional, Ciclo Financeiro)
  - Indicadores de Giro (Estoque, Ativo, Patrimônio Líquido, Contas a Receber)
  - Indicadores de Rentabilidade (Margem Bruta, Margem Líquida, ROA, ROE)
  - Indicadores de Endividamento
  - Indicadores de Liquidez (Corrente, Seca, Imediata)

## 📱 Interface

O aplicativo possui uma interface limpa e intuitiva com:
- Campos de entrada destacados em vermelho para dados que precisam ser inseridos
- Campos calculados automaticamente em verde
- Tabelas organizadas por seções
- Fórmulas visíveis para transparência dos cálculos
- Design responsivo e cores profissionais

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento
- **Dart**: Linguagem de programação
- **Material Design**: Sistema de design da interface

## 📋 Como Usar

1. **Clone o repositório**:
   ```bash
   git clone <repository-url>
   cd financasfacil
   ```

2. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo**:
   ```bash
   flutter run
   ```

## 📊 Seções do Aplicativo

### 1. Balanço Patrimonial
- **Ativo**: Caixa, Contas a Receber, Estoques, Imobilizado
- **Passivo**: Fornecedores, Empréstimos, Patrimônio Líquido

### 2. DRE (Demonstração de Resultado)
- Receita Bruta
- Custo dos Produtos Vendidos (CPV)
- Despesas Operacionais

### 3. Indicadores Calculados Automaticamente
- **Prazos Médios**: PME, PMR, PMP, Ciclos Operacional e Financeiro
- **Giro**: Estoque, Ativo, Patrimônio Líquido, Contas a Receber
- **Rentabilidade**: Margens Bruta e Líquida, ROA, ROE
- **Endividamento**: Total, Curto Prazo, Composição
- **Liquidez**: Corrente, Seca, Imediata

## 🎯 Características Técnicas

- **Cálculos em Tempo Real**: Os indicadores são recalculados automaticamente quando você altera qualquer valor
- **Formatação Inteligente**: Números grandes são formatados (K para milhares, M para milhões)
- **Validação de Entrada**: Apenas números são aceitos nos campos de entrada
- **Interface Responsiva**: Funciona bem em diferentes tamanhos de tela

## 🧪 Testes

Execute os testes com:
```bash
flutter test
```

## 📄 Baseado em

Este aplicativo Flutter foi desenvolvido baseado no arquivo `exemplo.html` que continha uma versão web da calculadora de análise financeira.

## 🔧 Desenvolvimento

Para contribuir com o projeto:

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📱 Plataformas Suportadas

- ✅ Android
- ✅ iOS  
- ✅ Windows
- ✅ macOS
- ✅ Linux
- ✅ Web

## 📈 Fórmulas Utilizadas

O aplicativo utiliza as fórmulas padrão de análise financeira:

- **PME**: (Estoques/CPV) × 360
- **PMR**: (Contas a Receber/Receita Bruta) × 360  
- **PMP**: (Fornecedores/CPV) × 360
- **ROA**: (Lucro Líquido/Ativo Total) × 100
- **ROE**: (Lucro Líquido/Patrimônio Líquido) × 100
- E muitas outras...

## 🎨 Design

O aplicativo utiliza um esquema de cores profissional:
- Azul primário (#4299E1)
- Azul escuro (#2C5282)
- Campos de entrada com fundo vermelho claro
- Campos calculados com fundo verde claro
- Fórmulas destacadas em azul-petróleo

---

Desenvolvido com ❤️ usando Flutter
