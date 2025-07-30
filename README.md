# 📊 Finanças Fácil

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)

**Um aplicativo Flutter para análise financeira empresarial completa e automatizada**

[📱 Download](#-instalação) • [🚀 Recursos](#-funcionalidades) • [📖 Como Usar](#-como-usar) • [🛠️ Desenvolvimento](#️-desenvolvimento)

</div>

---

## 🎯 **Sobre o Projeto**

O **Finanças Fácil** é uma ferramenta completa para análise financeira empresarial, desenvolvida em Flutter. O aplicativo permite que contadores, administradores e empresários façam análises financeiras profissionais de forma rápida e precisa, baseadas em dados do Balanço Patrimonial e DRE.

### ✨ **Diferenciais**
- 📊 **Cálculos Automáticos**: Todos os indicadores são calculados em tempo real
- 🎨 **Interface Intuitiva**: Design moderno e profissional 
- 📱 **Multiplataforma**: Funciona em Android, iOS, Windows, macOS e Web
- 🔢 **Fórmulas Transparentes**: Todas as fórmulas são exibidas para transparência
- 💾 **Dados Pré-carregados**: Valores de exemplo para teste imediato

## 🚀 **Funcionalidades**

### 📋 **Entrada de Dados**
- **Balanço Patrimonial**:
  - Ativo Circulante (Caixa, Contas a Receber, Estoques)
  - Ativo Não Circulante (Imobilizado)
  - Passivo Circulante (Fornecedores, Empréstimos CP)
  - Passivo Não Circulante (Empréstimos LP)
  - Patrimônio Líquido

- **DRE (Demonstração de Resultado)**:
  - Receita Bruta
  - Custo dos Produtos Vendidos (CPV)
  - Despesas Operacionais

### 📈 **Indicadores Calculados**

#### ⏱️ **Prazos Médios**
- **PME** - Prazo Médio de Estocagem
- **PMR** - Prazo Médio de Recebimento  
- **PMP** - Prazo Médio de Pagamento
- **Ciclo Operacional** (PME + PMR)
- **Ciclo Financeiro** (PME + PMR - PMP)

#### 🔄 **Indicadores de Giro**
- Giro do Estoque
- Giro do Ativo
- Giro do Patrimônio Líquido
- Giro de Contas a Receber

#### 💰 **Indicadores de Rentabilidade**
- **Margem Bruta** - Lucratividade das vendas
- **Margem Líquida** - Rentabilidade final
- **ROA** - Retorno sobre Ativo
- **ROE** - Retorno sobre Patrimônio Líquido

#### 🏦 **Indicadores de Endividamento**
- Endividamento Total
- Endividamento de Curto Prazo
- Composição do Endividamento
- Participação de Capital de Terceiros

#### 🔍 **Indicadores de Liquidez**
- **Liquidez Corrente** - Capacidade de pagamento
- **Liquidez Seca** - Liquidez sem estoques
- **Liquidez Imediata** - Disponibilidade imediata

## 📱 **Screenshots**

| Entrada de Dados | Indicadores | Resultados |
|:---:|:---:|:---:|
| ![Entrada](docs/screenshot1.png) | ![Indicadores](docs/screenshot2.png) | ![Resultados](docs/screenshot3.png) |

## 🛠️ **Tecnologias Utilizadas**

- **[Flutter](https://flutter.dev/)** - Framework de desenvolvimento
- **[Dart](https://dart.dev/)** - Linguagem de programação
- **Material Design 3** - Sistema de design
- **Flutter Launcher Icons** - Geração de ícones

## 📦 **Instalação**

### **Pré-requisitos**
- Flutter SDK (versão 3.8.1 ou superior)
- Dart SDK
- Android Studio / VS Code
- Git

### **Clone e Execute**

```bash
# Clone o repositório
git clone https://github.com/cintramachado/financasfacil.git

# Entre na pasta do projeto
cd financasfacil

# Instale as dependências
flutter pub get

# Execute o aplicativo
flutter run
```

### **Build para Produção**

```bash
# Android (APK)
flutter build apk --release

# Android (AAB - Google Play)
flutter build appbundle --release

# iOS
flutter build ios --release

# Windows
flutter build windows --release

# Web
flutter build web --release
```

## 📖 **Como Usar**

### **1. Inserir Dados**
1. **Abra o aplicativo**
2. **Insira os valores** nos campos destacados em vermelho:
   - Dados do Balanço Patrimonial
   - Dados da DRE
3. **Os cálculos são automáticos** - não é necessário clicar em nenhum botão!

### **2. Interpretar Resultados**
- **Campos Verdes**: Valores calculados automaticamente
- **Tabelas de Indicadores**: Mostram fórmula e resultado
- **Cores Diferentes**: Destacam indicadores importantes

### **3. Exemplo Prático**
O app vem com dados de exemplo pré-carregados:
- Empresa fictícia com R$ 1.5M de receita
- Análise completa disponível imediatamente
- Modifique os valores para sua empresa

## 🎨 **Paleta de Cores**

| Elemento | Cor | Uso |
|----------|-----|-----|
| Primária | `#4299E1` | AppBar, botões principais |
| Primária Escura | `#2C5282` | Destaques, textos importantes |
| Entrada | `#FFF5F5` | Campos de entrada de dados |
| Calculado | `#F0FFF4` | Campos calculados automaticamente |
| Fórmula | `#E6FFFA` | Fundo das fórmulas |

## 🧪 **Testes**

```bash
# Executar todos os testes
flutter test

# Executar testes com coverage
flutter test --coverage

# Análise estática do código
flutter analyze
```

## 📐 **Fórmulas Utilizadas**

### **Prazos Médios**
```
PME = (Estoques ÷ CPV) × 360
PMR = (Contas a Receber ÷ Receita Bruta) × 360  
PMP = (Fornecedores ÷ CPV) × 360
```

### **Rentabilidade**
```
Margem Bruta = (Lucro Bruto ÷ Receita Bruta) × 100
ROA = (Lucro Líquido ÷ Ativo Total) × 100
ROE = (Lucro Líquido ÷ Patrimônio Líquido) × 100
```

### **Liquidez**
```
Liquidez Corrente = Ativo Circulante ÷ Passivo Circulante
Liquidez Seca = (Ativo Circulante - Estoques) ÷ Passivo Circulante
Liquidez Imediata = Caixa ÷ Passivo Circulante
```

## 🗂️ **Estrutura do Projeto**

```
lib/
├── main.dart                 # Arquivo principal
├── screens/
│   └── analise_financeira.dart
├── widgets/
│   ├── input_section.dart
│   ├── indicator_table.dart
│   └── results_display.dart
└── utils/
    └── calculations.dart

android/                     # Configurações Android
ios/                        # Configurações iOS  
web/                        # Configurações Web
windows/                    # Configurações Windows
```

## 🤝 **Contribuição**

Contribuições são sempre bem-vindas! Para contribuir:

1. **Fork** o projeto
2. **Crie uma branch** para sua feature (`git checkout -b feature/NovaFeature`)
3. **Commit** suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. **Push** para a branch (`git push origin feature/NovaFeature`)
5. **Abra um Pull Request**

### **Ideias para Contribuição**
- 📊 Novos indicadores financeiros
- 🎨 Melhorias na interface
- 📱 Otimizações para mobile
- 🌐 Internacionalização (i18n)
- 📈 Gráficos interativos
- 💾 Persistência de dados
- 📄 Exportação para PDF/Excel

## 📄 **Licença**

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 **Autor**

**Seu Nome**
- GitHub: [@cintramachado](https://github.com/cintramachado)
- LinkedIn: [Seu LinkedIn]
- Email: [seu-email@exemplo.com]

## 🙏 **Agradecimentos**

- [Flutter Team](https://flutter.dev/community) pelo excelente framework
- [Material Design](https://material.io/) pelas diretrizes de design
- Comunidade Flutter pelos recursos e exemplos

## 📞 **Suporte**

- 🐛 **Problemas**: [Abra uma issue](https://github.com/cintramachado/financasfacil/issues)
- 💬 **Discussões**: [GitHub Discussions](https://github.com/cintramachado/financasfacil/discussions)
- 📧 **Email**: [seu-email@exemplo.com]

---

<div align="center">

**⭐ Se este projeto te ajudou, considere dar uma estrela!**

Feito com ❤️ e ☕ por [@cintramachado](https://github.com/cintramachado)

</div>

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
