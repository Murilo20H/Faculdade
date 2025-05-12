package org.github.murilo20h;

public class ListaEstatica {
    private String[] vetor;
    private int nroElem;

    public ListaEstatica(int tam) {
        this.vetor = new String[tam];
        this.nroElem = 0;
    }

    public void add(String elem) {
        if ((this.nroElem - 1) < this.vetor.length) {
            this.vetor[nroElem] = elem;
            nroElem++;
        }
//        else {
//            String[] aux = this.vetor;
//            this.vetor = new String[vetor.length+1];
//            for (int i = 0; i < this.vetor.length-1; i++) {
//                this.vetor[i] = aux[i];
//            }
//            this.vetor[nroElem] = elem;
//            nroElem++;
//        }
        else throw new ArrayIndexOutOfBoundsException("Lista Estatica already full");
    }

    public String toString() {
        String message = "";
        for (int i = 0; i < vetor.length && i < nroElem; i++) {
            if (vetor[i] != null) message += "Element %s:\n\t%s\n".formatted(i, vetor[i]);
        }
        return message;
    }

    public int get(String element) {
        for (int i = 0; i < this.vetor.length; i++) {
            if (element.equals(this.vetor[i])) {
                return i;
            }
        }
        throw new RuntimeException("Element %s not found".formatted(element));
    }

    public String get(int index) {
        if (index < this.vetor.length && index >= 0) return this.vetor[index];
        throw new RuntimeException("Element in index %s not found".formatted(index));
    }

    public boolean remove(int index) {
        if (nroElem != 0 && index <= nroElem) {
            if (index - 1 == this.vetor.length) {
                vetor[vetor.length-1] = null;
            } else if (index != nroElem) {
                for (int i = index+1; i < vetor.length; i++) {
                    vetor[i-1] = vetor[i];
                }
                vetor[vetor.length-1] = null;
            }
            this.nroElem--;
            return true;
        }
        return false;
    }

    public boolean remove(String element) {
        if (nroElem != 0) {
            int size = vetor.length;
            for (int i = 0; i < size; i++) {
                if (vetor[i].equals(element)) {
                    for (int j = i+1; j < vetor.length; j++) {
                        vetor[j-1] = vetor[j];
                    }
                    size--;
                    vetor[vetor.length-1] = null;
                }
            }
            nroElem = size;
            return true;
        }
        return false;
    }

    public int size() {
        return nroElem;
    }
}
