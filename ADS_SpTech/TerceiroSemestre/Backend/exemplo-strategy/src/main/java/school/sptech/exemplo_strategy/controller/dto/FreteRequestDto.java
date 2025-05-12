package school.sptech.exemplo_strategy.controller.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import school.sptech.exemplo_strategy.entity.Frete;
import school.sptech.exemplo_strategy.entity.TipoFreteEnum;

public class FreteRequestDto {
    @NotBlank
    @Schema(description = "Tipo do frete escolhido", allowableValues = {
            "NORMAL", "EXPRESSO", "TRANSPORTADORA"
    })
    private String tipo;
    @NotNull
    @DecimalMin(value = "10.0")
    @Schema(description = "Valor da encomenda", example = "100.0")
    private Double valorEncomenda;
    @NotNull
    @DecimalMin(value = "1.0")
    @Schema(description = "Peso do produto em KG", example = "10.0")
    private Double pesoEmKg;

    public static Frete toEntity(FreteRequestDto dto) {
        TipoFreteEnum tipo = TipoFreteEnum.fromString(dto.getTipo());
        Frete frete = new Frete();
        frete.setTipo(tipo);
        frete.setValorEncomenda(dto.getValorEncomenda());
        frete.setPesoEmKg(dto.getPesoEmKg());
        return frete;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Double getValorEncomenda() {
        return valorEncomenda;
    }

    public void setValorEncomenda(Double valorEncomenda) {
        this.valorEncomenda = valorEncomenda;
    }

    public Double getPesoEmKg() {
        return pesoEmKg;
    }

    public void setPesoEmKg(Double pesoEmKg) {
        this.pesoEmKg = pesoEmKg;
    }
}
