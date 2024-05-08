#language: pt

Funcionalidade: Uso de Cupons no Checkout
    Como um usuário da Starbugs, eu quero poder aplicar cupons de desconto na página de checkout
    Para que eu possa obter reduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.

    Contexto:
        Dado que iniciei a compra do item:
            | Nome    | Café com Leite |
            | Preço   | R$ 19,99       |
            | Entrega | R$ 10,00       |
            | Total   | R$ 29,99       |

    Cenário: Aplicar desconto de 20%
        Quando aplico o seguinte cupom: "MEUCAFE"
        Então o valor final da compra deve ser atualizado para "R$ 25,99"

    Esquema do Cenário: Tentativa de aplicar o desconto
        Quando aplico o seguinte cupom: "<Cupom>"
        Então devo ver a notificação "<Saída>"
        E o valor final da compra deve permanecer o mesmo

        Exemplos:
            | Cupom    | Saída           |
            | PROMO20  | Cupom expirado! |
            | PROMO100 | Cupom inválido! |