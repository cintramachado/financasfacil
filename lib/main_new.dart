import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FinancasFacilApp());
}

class FinancasFacilApp extends StatelessWidget {
  const FinancasFacilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finanças Fácil',
      theme: ThemeData(
        primaryColor: const Color(0xFF2C5282),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4299E1),
          primary: const Color(0xFF2C5282),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4299E1),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        useMaterial3: true,
      ),
      home: const AnaliseFinanceiraPage(),
    );
  }
}

class AnaliseFinanceiraPage extends StatefulWidget {
  const AnaliseFinanceiraPage({super.key});

  @override
  State<AnaliseFinanceiraPage> createState() => _AnaliseFinanceiraPageState();
}

class _AnaliseFinanceiraPageState extends State<AnaliseFinanceiraPage> {
  // Controladores de texto para entrada de dados
  final TextEditingController _caixaController = TextEditingController(text: '100000');
  final TextEditingController _contasReceberController = TextEditingController(text: '250000');
  final TextEditingController _estoquesController = TextEditingController(text: '180000');
  final TextEditingController _imobilizadoController = TextEditingController(text: '800000');
  final TextEditingController _fornecedoresController = TextEditingController(text: '120000');
  final TextEditingController _emprestimosCPController = TextEditingController(text: '80000');
  final TextEditingController _emprestimosLPController = TextEditingController(text: '400000');
  final TextEditingController _patrimonioLiquidoController = TextEditingController(text: '730000');
  final TextEditingController _receitaBrutaController = TextEditingController(text: '1500000');
  final TextEditingController _cpvController = TextEditingController(text: '900000');
  final TextEditingController _despesasOpController = TextEditingController(text: '350000');

  // Valores calculados
  double get caixa => double.tryParse(_caixaController.text) ?? 0;
  double get contasReceber => double.tryParse(_contasReceberController.text) ?? 0;
  double get estoques => double.tryParse(_estoquesController.text) ?? 0;
  double get imobilizado => double.tryParse(_imobilizadoController.text) ?? 0;
  double get fornecedores => double.tryParse(_fornecedoresController.text) ?? 0;
  double get emprestimosCP => double.tryParse(_emprestimosCPController.text) ?? 0;
  double get emprestimosLP => double.tryParse(_emprestimosLPController.text) ?? 0;
  double get patrimonioLiquido => double.tryParse(_patrimonioLiquidoController.text) ?? 0;
  double get receitaBruta => double.tryParse(_receitaBrutaController.text) ?? 0;
  double get cpv => double.tryParse(_cpvController.text) ?? 0;
  double get despesasOp => double.tryParse(_despesasOpController.text) ?? 0;

  // Cálculos automáticos
  double get ativoCirculante => caixa + contasReceber + estoques;
  double get ativoTotal => ativoCirculante + imobilizado;
  double get passivoCirculante => fornecedores + emprestimosCP;
  double get passivoTotal => passivoCirculante + emprestimosLP + patrimonioLiquido;
  double get lucroBruto => receitaBruta - cpv;
  double get lucroLiquido => lucroBruto - despesasOp;

  // Prazos médios
  double get pme => cpv > 0 ? (estoques / cpv) * 360 : 0;
  double get pmr => receitaBruta > 0 ? (contasReceber / receitaBruta) * 360 : 0;
  double get pmp => cpv > 0 ? (fornecedores / cpv) * 360 : 0;
  double get cicloOperacional => pme + pmr;
  double get cicloFinanceiro => pme + pmr - pmp;

  // Indicadores de giro
  double get giroEstoque => estoques > 0 ? cpv / estoques : 0;
  double get giroAtivo => ativoTotal > 0 ? receitaBruta / ativoTotal : 0;
  double get giroPL => patrimonioLiquido > 0 ? receitaBruta / patrimonioLiquido : 0;
  double get giroContasReceber => contasReceber > 0 ? receitaBruta / contasReceber : 0;

  // Indicadores de rentabilidade
  double get margemBruta => receitaBruta > 0 ? (lucroBruto / receitaBruta) * 100 : 0;
  double get margemLiquida => receitaBruta > 0 ? (lucroLiquido / receitaBruta) * 100 : 0;
  double get roa => ativoTotal > 0 ? (lucroLiquido / ativoTotal) * 100 : 0;
  double get roe => patrimonioLiquido > 0 ? (lucroLiquido / patrimonioLiquido) * 100 : 0;

  // Indicadores de endividamento
  double get endividamentoTotal => ativoTotal > 0 ? ((passivoCirculante + emprestimosLP) / ativoTotal) * 100 : 0;
  double get endividamentoCP => ativoTotal > 0 ? (passivoCirculante / ativoTotal) * 100 : 0;
  double get composicaoEnd => (passivoCirculante + emprestimosLP) > 0 ? (passivoCirculante / (passivoCirculante + emprestimosLP)) * 100 : 0;
  double get participacaoTerceiros => patrimonioLiquido > 0 ? ((passivoCirculante + emprestimosLP) / patrimonioLiquido) * 100 : 0;

  // Indicadores de liquidez
  double get liquidezCorrente => passivoCirculante > 0 ? ativoCirculante / passivoCirculante : 0;
  double get liquidezSeca => passivoCirculante > 0 ? (ativoCirculante - estoques) / passivoCirculante : 0;
  double get liquidezImediata => passivoCirculante > 0 ? caixa / passivoCirculante : 0;

  String formatNumber(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 Análise Financeira'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInstructions(),
            const SizedBox(height: 20),
            _buildBalancoPatrimonial(),
            const SizedBox(height: 20),
            _buildDRE(),
            const SizedBox(height: 20),
            _buildPrazosMedios(),
            const SizedBox(height: 20),
            _buildIndicadoresGiro(),
            const SizedBox(height: 20),
            _buildIndicadoresRentabilidade(),
            const SizedBox(height: 20),
            _buildIndicadoresEndividamento(),
            const SizedBox(height: 20),
            _buildIndicadoresLiquidez(),
            const SizedBox(height: 20),
            _buildObservacoes(),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        border: Border.all(color: Colors.orange.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.lightbulb, color: Colors.orange),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Como usar: Insira os valores do Balanço Patrimonial e DRE nos campos destacados. Os indicadores serão calculados automaticamente.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalancoPatrimonial() {
    return _buildSection(
      title: '📋 1. Dados de Entrada - Balanço Patrimonial',
      child: Column(
        children: [
          _buildAtivoTable(),
          const SizedBox(height: 20),
          _buildPassivoTable(),
        ],
      ),
    );
  }

  Widget _buildAtivoTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ATIVO',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildTable([
          _buildInputRow('Caixa e Equivalentes', _caixaController),
          _buildInputRow('Contas a Receber', _contasReceberController),
          _buildInputRow('Estoques', _estoquesController),
          _buildCalculatedRow('Ativo Circulante', ativoCirculante),
          _buildInputRow('Imobilizado', _imobilizadoController),
          _buildCalculatedRow('Ativo Total', ativoTotal, isBold: true),
        ]),
      ],
    );
  }

  Widget _buildPassivoTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PASSIVO',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildTable([
          _buildInputRow('Fornecedores', _fornecedoresController),
          _buildInputRow('Empréstimos Curto Prazo', _emprestimosCPController),
          _buildCalculatedRow('Passivo Circulante', passivoCirculante),
          _buildInputRow('Empréstimos Longo Prazo', _emprestimosLPController),
          _buildInputRow('Patrimônio Líquido', _patrimonioLiquidoController),
          _buildCalculatedRow('Passivo Total', passivoTotal, isBold: true),
        ]),
      ],
    );
  }

  Widget _buildDRE() {
    return _buildSection(
      title: '📈 2. Dados de Entrada - DRE',
      child: _buildTable([
        _buildInputRow('Receita Bruta', _receitaBrutaController),
        _buildInputRow('Custo dos Produtos Vendidos (CPV)', _cpvController),
        _buildCalculatedRow('Lucro Bruto', lucroBruto),
        _buildInputRow('Despesas Operacionais', _despesasOpController),
        _buildCalculatedRow('Lucro Líquido', lucroLiquido, isBold: true),
      ]),
    );
  }

  Widget _buildPrazosMedios() {
    return _buildSection(
      title: '⏱️ 3. Prazos Médios (em dias)',
      child: _buildIndicatorTable([
        _buildIndicatorRow('Prazo Médio de Estocagem (PME)', '(Estoques/CPV)*360', '${pme.round()} dias'),
        _buildIndicatorRow('Prazo Médio de Recebimento (PMR)', '(Contas a Receber/Receita Bruta)*360', '${pmr.round()} dias'),
        _buildIndicatorRow('Prazo Médio de Pagamento (PMP)', '(Fornecedores/CPV)*360', '${pmp.round()} dias'),
        _buildIndicatorRow('Ciclo Operacional', 'PME+PMR', '${cicloOperacional.round()} dias', isBold: true),
        _buildIndicatorRow('Ciclo Financeiro', 'PME+PMR-PMP', '${cicloFinanceiro.round()} dias', isBold: true),
      ]),
    );
  }

  Widget _buildIndicadoresGiro() {
    return _buildSection(
      title: '🔄 4. Indicadores de Giro',
      child: _buildIndicatorTable([
        _buildIndicatorRow('Giro do Estoque', 'CPV/Estoques', '${giroEstoque.toStringAsFixed(1)}x'),
        _buildIndicatorRow('Giro do Ativo', 'Receita Bruta/Ativo Total', '${giroAtivo.toStringAsFixed(1)}x'),
        _buildIndicatorRow('Giro do Patrimônio Líquido', 'Receita Bruta/Patrimônio Líquido', '${giroPL.toStringAsFixed(1)}x'),
        _buildIndicatorRow('Giro de Contas a Receber', 'Receita Bruta/Contas a Receber', '${giroContasReceber.toStringAsFixed(1)}x'),
      ]),
    );
  }

  Widget _buildIndicadoresRentabilidade() {
    return _buildSection(
      title: '💰 5. Indicadores de Rentabilidade (%)',
      child: _buildIndicatorTable([
        _buildIndicatorRow('Margem Bruta', '(Lucro Bruto/Receita Bruta)*100', '${margemBruta.toStringAsFixed(1)}%'),
        _buildIndicatorRow('Margem Líquida', '(Lucro Líquido/Receita Bruta)*100', '${margemLiquida.toStringAsFixed(1)}%'),
        _buildIndicatorRow('ROA (Retorno sobre Ativo)', '(Lucro Líquido/Ativo Total)*100', '${roa.toStringAsFixed(1)}%'),
        _buildIndicatorRow('ROE (Retorno sobre PL)', '(Lucro Líquido/Patrimônio Líquido)*100', '${roe.toStringAsFixed(1)}%'),
      ]),
    );
  }

  Widget _buildIndicadoresEndividamento() {
    return _buildSection(
      title: '🏦 6. Indicadores de Endividamento',
      child: _buildIndicatorTable([
        _buildIndicatorRow('Endividamento Total', '((Passivo Circulante+Empréstimos LP)/Ativo Total)*100', '${endividamentoTotal.toStringAsFixed(1)}%'),
        _buildIndicatorRow('Endividamento de Curto Prazo', '(Passivo Circulante/Ativo Total)*100', '${endividamentoCP.toStringAsFixed(1)}%'),
        _buildIndicatorRow('Composição do Endividamento', '(Passivo Circulante/(Passivo Circulante+Empréstimos LP))*100', '${composicaoEnd.toStringAsFixed(1)}%'),
        _buildIndicatorRow('Participação de Capital de Terceiros', '((Passivo Circulante+Empréstimos LP)/Patrimônio Líquido)*100', '${participacaoTerceiros.toStringAsFixed(1)}%'),
      ]),
    );
  }

  Widget _buildIndicadoresLiquidez() {
    return _buildSection(
      title: '🔍 7. Indicadores de Liquidez',
      child: _buildIndicatorTable([
        _buildIndicatorRow('Liquidez Corrente', 'Ativo Circulante/Passivo Circulante', liquidezCorrente.toStringAsFixed(2)),
        _buildIndicatorRow('Liquidez Seca', '(Ativo Circulante-Estoques)/Passivo Circulante', liquidezSeca.toStringAsFixed(2)),
        _buildIndicatorRow('Liquidez Imediata', 'Caixa/Passivo Circulante', liquidezImediata.toStringAsFixed(2)),
      ]),
    );
  }

  Widget _buildObservacoes() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        border: Border.all(color: Colors.orange.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.push_pin, color: Colors.orange),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Observações: Os valores são exemplos e podem ser ajustados conforme necessário. Os indicadores são calculados automaticamente com base nos dados inseridos.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: const Border(left: BorderSide(color: Color(0xFF4299E1), width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildTable(List<TableRow> rows) {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Color(0xFF4299E1)),
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Conta',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Valor (R\$)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        ...rows,
      ],
    );
  }

  Widget _buildIndicatorTable(List<TableRow> rows) {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Color(0xFF4299E1)),
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Indicador',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Fórmula',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Resultado',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        ...rows,
      ],
    );
  }

  TableRow _buildInputRow(String label, TextEditingController controller) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(label),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.red.shade50,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade500, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
            onChanged: (value) => setState(() {}),
          ),
        ),
      ],
    );
  }

  TableRow _buildCalculatedRow(String label, double value, {bool isBold = false}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              formatNumber(value),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildIndicatorRow(String indicator, String formula, String result, {bool isBold = false}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            indicator,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(4),
              border: Border(left: BorderSide(color: Colors.teal.shade400, width: 4)),
            ),
            child: Text(
              formula,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              result,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
