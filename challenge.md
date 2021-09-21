# Desafio - Husky

## Escopo e funcionalidades previstas:

### Web:

  **Se visitante**
  - Login;

  - Sign up;

  - Esqueci minha senha;

  - Gerar e enviar invoice;

  **Se usuário (fez login)**

  - Gerar e enviar invoice.

  - Salvar invoice como rascunho.

  - Listar invoices (enviadas, rascunho).

  - Visualizar invoice.

  - Perfil, permitir geração de token de API

#### Envio de invoices:**
As invoices deverão ser enviadas por email com link de visualização + versão PDF em anexo. Sendo que tanto no corpo do email deverá aparecer o hash (Ex: SHA256) correspondente ao arquivo PDF.

#### Visualização Web**
  **Se visitante**

  - Poderá visualizar a invoice + hash do arquivo (Ex: SHA256). 
  - Realizar download como PDF.

  **Se usuário**
  - Poderá realizar as ações do visitante 
  - Enviar a invoice para novos emails.

### API:
Deve permitir a realização das mesmas operações da Web, somente se receber um token válido.

### Solução
Você não precisa fazer tudo, mas o que fizer faça bem feito. Exemplos: às vezes você irá preferir fazer um backend OK e caprichar no front. Ou fazer um front sem CSS porque está focado na estrutura do HTML e no comportamento da aplicação tanto no JS quanto no Ruby. Ou talvez você só irá fazer um pedaço da Web (somente visualização) e focar na API.

Além do código, queremos receber um racional do que foi feito (porque priorizou A em vez de B), como foi feito (gems, patterns, paradigmas...) e do que poderia ser melhorado. Dica: escreva tudo em um README.

### Expectativas:
- Utilize Ruby on Rails;
- Escreva testes automatizados;
- Faça commits atômicos e progressivos;
- Documente a API;
- Trabalhe a separação de responsabilidades na aplicação;
- Trabalhe a representação dos conceitos, faça uso de bons nomes em variáveis, métodos, classes, módulos/namespaces;
- Trabalhe requisitos não funcionais como: segurança, performance, confiabilidade, observabilidade, manutenibilidade.

### Exemplos relacionados ao desafio
> Geradores:
- https://invoice.husky.io/
- https://www.invoicesimple.com/invoice-generator

> Templates:
- https://www.invoicesimple.com/invoice-template/google-docs-invoice-template