# Desafio - Husky

Desafio proposto: desenvolver um gerador de invoices online.

Para mais detalhes veja os requisitos para o projeto: [Requisitos do desafio](challenge.md)

## O projeto
Como detalhado nos requisitos do desafio, será desenvolvido um gerador de invoices online, seguindo um mix dos examplos apresentados:

- https://invoice.husky.io/
- https://www.invoicesimple.com/invoice-generator

Para o bom entendimento e melhor implementação do projeto seguirei a seguinte estrutura:

- Entender para atender;
- Modelagem do banco de dados;
- Passo a passo para rodar o projeto local;
- Passo a passo para rodar o projeto com Docker;
- Detalhes da implementação

## Entender para atender
### O que é uma Invoice (fatura)?
Uma fatura é um documento comercial que busca detalhar o produto vendido ou o serviço prestado, sem que seja necessário ou que seja solicitado pelo cliente ou pelo comprador.

A fatura pode ser usada tanto para fins fiscais, como também como forma de proteger o cliente, como para questões de garantia, por exemplo.

Ao emitir uma fatura, é feito o detalhamento de uma transação comercial, especificando as características do produto ou serviço e o valor referente à compra.

A fatura representa uma conta e é sempre emitida pela empresa que realizou a venda ou prestou os serviços.

Geralmente, a fatura é emitida em compras feitas a prazo e em operações nas quais ainda não houve a efetivação do pagamento.

É fundamental que os dados cadastrais estejam corretos e atualizados para que a fatura seja enviada ao endereço e/ou ao email cadastrado.

O pagamento de uma fatura pode ocorrer de duas formas distintas. A primeira é o pagamento integral. Nele, o valor total é pago até o dia do vencimento. A outra opção é o pagamento parcial. Nesse caso, o cliente paga apenas uma parte do valor total e o restante é refinanciado. Vale lembrar que podem ser cobrados juros em cima do valor devido.

## Modelagem do Banco de Dados
![alt modelagem do banco](invoicex_der.png)
