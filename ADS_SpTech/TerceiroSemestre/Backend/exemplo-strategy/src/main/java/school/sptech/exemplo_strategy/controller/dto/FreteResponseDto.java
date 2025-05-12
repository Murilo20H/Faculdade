package school.sptech.exemplo_strategy.controller.dto;

import school.sptech.exemplo_strategy.entity.Frete;

public class FreteResponseDto {
    private Integer id;
    private String tipo;
    private String descricao;
    private Double valorFrete;

    public static FreteResponseDto toResponse(Frete frete) {
        FreteResponseDto response = new FreteResponseDto();
        response.setId(frete.getId());
        response.setTipo(frete.getTipo().name());
        response.setDescricao(frete.getTipo().getDescricao());
        response.setValorFrete(frete.getValorFrete());
        return response;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getValorFrete() {
        return valorFrete;
    }

    public void setValorFrete(Double valorFrete) {
        this.valorFrete = valorFrete;
    }
}
