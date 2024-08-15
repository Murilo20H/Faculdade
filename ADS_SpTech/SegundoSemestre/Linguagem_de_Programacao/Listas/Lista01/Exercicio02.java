package school.sptech;

public class Exercicio02 {
    public static void main(String[] args) {
        Integer minutosAquecendo = 15;
        Integer minutosAerobica = 50;
        Integer minutosMusculacao = 45;
        Integer minutosExercicios = minutosAquecendo + minutosAerobica + minutosMusculacao;
        Integer caloriasPerdidas = (minutosAquecendo * 12) + (minutosAerobica * 20) + (minutosMusculacao * 25);

        System.out.println("Olá, Jorge. Você fez um total de %d minutos de exercícios e perdeu cerca de %d calorias.".formatted(minutosExercicios, caloriasPerdidas));
    }
}
