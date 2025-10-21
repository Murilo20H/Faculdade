package school.sptech;

import java.util.Arrays;
import java.util.EmptyStackException;

public class Pilha<E> {

    private E[] elementos;
    private int topo;

    public Pilha(int capacidade) {
        this.elementos = (E[]) new Object[capacidade];
        this.topo = -1;
    }

    // Deve lançar - StackOverflowError
    public E push(E elemento) {
        if (isFull()) throw new StackOverflowError();
        return elementos[++topo];
    }

    //  Deve lançar - EmptyStackException
    public E pop() {
        if (isEmpty()) throw new EmptyStackException();
        return elementos[topo--];
    }

    //  Deve lançar - EmptyStackException
    public E peek() {
        if (isEmpty()) throw new EmptyStackException();
        return elementos[topo];
    }

    public boolean isEmpty() {
        return topo == -1;
    }

    public boolean isFull() {
        return topo == elementos.length - 1;
    }

    public int size() {
        return topo + 1;
    }

    public int capacity() {
        return elementos.length;
    }

    public void clear() {
        Arrays.fill(elementos, null);
        this.topo = -1;
    }

    @Override
    public String toString() {
        if (isEmpty()) {
            return "📭 Pilha vazia []";
        }

        StringBuilder sb = new StringBuilder();
        sb.append("📚 Pilha [").append(size()).append("/").append(capacity()).append("]:\n");

        for (int i = topo; i >= 0; i--) {
            sb.append("  ");
            if (i == topo) {
                sb.append("🔝 ");
            } else {
                sb.append("   ");
            }
            sb.append("| ").append(elementos[i]).append(" |\n");
        }
        sb.append("  └─────┘");

        return sb.toString();
    }
}