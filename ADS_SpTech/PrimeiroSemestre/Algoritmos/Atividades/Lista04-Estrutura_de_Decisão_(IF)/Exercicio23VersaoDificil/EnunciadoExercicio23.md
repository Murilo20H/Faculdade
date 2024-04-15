# Enunciado do exercício 23 feito por Murilo Henrique Almeida Correa:
* Você faz parte de uma empresa que vende produtos e que gerencia empréstimos, e tem a função de desenvolver os cálculos necessários para a empresa:
<br>
* Primeiramente, você deve perguntar o preço do produto que o usuário irá comprar, após saber o preço você deve calcular o tipo de desconto e juros necessários de acordo com o atendente da loja no horário.
<br>
* O primeiro atendente se chama Joelinton, e para calcular quanto será o preço final do produto, você deve calcular um desconto em outro desconto (exemplo: 15% de desconto em 20% de desconto).
<br>
* Após calcular o desconto sobre o desconto, você deve aplicar juros compostos em cima do desconto em cima do desconto inicial, porém nesta empresa, os juros funcionam diferente, o usuário deve digitar o valor dos juros que foram propostos no acordo feito com o atendente específico. Sabe-se que Joelinton não aceita juros compostos abaixo de 18%.
<br>
* O acordo proposto por Joelinton seria pagar os juros compostos em 5 meses, ou seja, pegue o valor do produto já com os descontos aplicados e aplique juros compostos utilizando a porcentagem que o usuário digitar e 5 meses.
<br>
* O segundo atendente se chama Jadson, e para calcular quanto será o preço final do produto, você deve calcular um desconto em outro desconto (exemplo: 15% de desconto em 20% de desconto) e depois calcular os juros compostos, assim como o atendente Joelinton. Porém, os juros compostos propostos no acordo de Jadson deve ser acima de 7%, e deve ser pago em 7 meses.
<br>
* Após calcular os juros compostos, imprima uma mensagem na tela indicando quantos reais o produto vale após os cálculos necessários.
<br><br>

### Passo a passo:
>a. Solicite o valor do produto inicialmente, o valor do desconto em porcentagem, o valor do desconto sobre o desconto em porcentagem, o nome do atendente e o valor dos juros compostos em porcentagem.<br><br>
>b. Ao clicar no botão “Calcular Preço do Produto”, deve calcular o desconto sobre o desconto e depois aplicá-lo sobre o preço do produto e depois verificar qual atendente o usuário digitou.<br><br>
>b1) Caso o atendente digitado não seja "Joelinton" ou "Jadson", deve emitir um alerta com a mensagem "Atendente inexistente” e não faça mais nada.<br><br>
>b2) Caso o atendente digitado seja "Joelinton", deve verificar se os juros compostos digitado é abaixo de 18%, caso seja abaixo de 18, deve emitir um alerta com a mensagem "Juros composto abaixo do proposto".<br><br>
>b3) Caso o atendente digitado seja "Jadson", deve verificar se os juros compostos digitado é abaixo de 7%, caso seja abaixo de 7, deve emitir um alerta com a mensagem "Juros composto abaixo do proposto".<br><br>
>b4) Após verificar o nome do atendente deve ser calculado os juros compostos, dependendo do atendente digitado, caso o atendente digitado seja o "Joelinton", você deve calcular os juros composto digitado no item a. e aplicá-los durante 5 vezes (5 meses), após calcular os juros compostos e os descontos, deve ser impresso na tela: "O acordo proposto com o atendente Joelinton foi realizado com sucesso, e o valor final do produto ficou R$AAA”.<br><br>
>b5) Caso o atendente digitado seja "Jadson", deve calcular os juros composto digitado no item a. e aplicálos durante 7 vezes (7 meses), após calcular os juros compostos e os descontos, deve ser impresso na tela: "O acordo proposto com o atendente Jadson foi realizado com sucesso, e o valor final do produto ficou R$AAA”.<br><br>
>AAA = (valor do produto - descontos) - juros compostos durante 5 ou 7 meses.

<br>

### Observações:
>Não esqueça de dividir por 100 os valores como os descontos e os juros compostos.<br><br>
>**Para calcular juros compostos:**
>1. No começo só precisa calcular uma porcentagem em cima do valor com descontos.<br>
>2. A partir da segunda vez, será necessário calcular juros em cima do valor do item 1. (valor com juros), até chegar na quantidade de meses proposto.

<br>

### Testes:
>| Campos| Teste 1| Teste 2| Teste 3| Teste 4| Teste 5| Teste 6| Teste 7
>|--- |--- |--- |--- |--- |--- |--- |--- |
>| **Valor do produto inicialmente:**| 100| 100| 100| 100| 1000| 100000| 100
>| **Valor do desconto em porcentagem:**| 60| 60| 60| 60| 20| 100| 0
>| **Valor do desconto sobre o desconto em porcentagem:**| 90| 90| 90| 90| 50| 800| 0
>| **Nome do atendente:**| Joelinton| Jorge| Jadson| Jadson| Jadson| Joelinton| Jadson
>| **Valor do juros composto em porcentagem:**| 18| 18| 18| 6.5| 25| 37| 10
>| **Resultado:**| 227.54038649132798| alerta: "Atendente inexistente"| 316.82723415052504| alerta: "Juros composto abaixo do proposto| 4767.894744873047| 482578.6351904344| 194.87170999999998