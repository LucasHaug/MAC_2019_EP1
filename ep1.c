#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int k = 0;
    int c = 0; /**< Representada por dígitos de 1 a 9 */
    int max_palpites = 0;
    int palpite = 0;
    unsigned long int senha = 0;

    int numero_de_tentativas = 0;
    int numero_de_pretos = 0;

    printf("Entre com o numero de digitos: ");
    scanf("%d", &k);

    printf("Entre com o numero de cores: ");
    scanf("%d", &c);

    printf("Entre com o numero maximo de palpites: ");
    scanf("%d", &max_palpites);

    printf("Entre com a senha de %d digitos (0 para valor aleatorio): ", k);
    scanf("%ld",&senha);

    if (senha == 0) {
        srand(time(NULL));

        for (int i = 0; i < k; i++) {
            senha = senha*10 + (rand() % c + 1);
        }
    }

    for (numero_de_tentativas = 0; numero_de_tentativas < max_palpites && numero_de_pretos != k; numero_de_tentativas++) {
        printf("Digite o seu palpite: ");
        scanf("%d", &palpite);

        int copia_senha = senha;

        numero_de_pretos = 0;

        for (int j = 0; j < k; j++) {
            if (palpite % 10 == copia_senha % 10) {
                numero_de_pretos++;
            }
            palpite /= 10;
            copia_senha /= 10;
        }

        if (numero_de_pretos == 1) {
            printf("%d preto\n", numero_de_pretos);
        } else {
            printf("%d pretos\n", numero_de_pretos);
        }
    }

    if (numero_de_pretos == k) {
        if (numero_de_tentativas == 1) {
            printf("Parabens! Voce descobriu a senha em %d tentativa\n", numero_de_tentativas);
        } else {
            printf("Parabens! Voce descobriu a senha em %d tentativas\n", numero_de_tentativas);
        }
    } else {
        if (max_palpites == 1) {
            printf("Sinto muito, mas o palpite não acertou a senha %ld!\n", senha);
        } else {
            printf("Sinto muito, mas nenhum dos %d palpites acertaram a senha %ld!\n", max_palpites, senha);
        }
    }

    return 0;
}
