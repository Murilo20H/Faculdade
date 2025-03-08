package school.sptech.aula02;

public class Filme {
    private String titulo;
    private Integer anoLancamento;

    public Filme() {}

    public Filme(String titulo, Integer anoLancamento) {
        this.titulo = titulo;
        this.anoLancamento = anoLancamento;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getAnoLancamento() {
        return anoLancamento;
    }

    public void setAnoLancamento(Integer anoLancamento) {
        this.anoLancamento = anoLancamento;
    }
}
