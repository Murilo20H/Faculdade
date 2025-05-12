package school.sptech.exemplo_strategy.entity;

import school.sptech.exemplo_strategy.exception.FreteInvalidoException;

public enum TipoFreteEnum {
    NORMAL("Entrega em até 12 dias úteis"),
    EXPRESSO("Entrega em até 3 dias úteis"),
    TRANSPORTADORA("Entrega em até 6 dias úteis");

    private final String descricao;

    TipoFreteEnum(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

    public static TipoFreteEnum fromString(String value) {
        TipoFreteEnum tipo;
        try {
            tipo = TipoFreteEnum.valueOf(value);
        } catch (IllegalArgumentException e) {
            throw new FreteInvalidoException("Tipo do frete inválido");
        }
        return tipo;
    }
}
