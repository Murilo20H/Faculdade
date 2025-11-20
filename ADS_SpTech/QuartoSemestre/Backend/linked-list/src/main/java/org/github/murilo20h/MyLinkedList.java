package org.github.murilo20h;

public class MyLinkedList<E> {
    private Node<E> head;
    private Node<E> tail;
    private int size;

    public void addLast(E element) {
        Node<E> newNode = new Node<>(element);
        if (size == 0) head = newNode;
        else tail.setNext(newNode);
        tail = newNode;
        size++;
    }

    public void print() {
        Node<E> element = head;
        while (element != null) {
            System.out.println(element.getValue());
            element = element.getNext();
        }
    }

    public E get(int index) {
        Node<E> element = head;
        for (int i = 0; element != null; i++) {
            if (i == index) return element.getValue();
            element = element.getNext();
        }
        return null;
    }

    public void add(int index, E newElement) {
        Node<E> element = head;
        Node<E> lastElement = tail;
        for (int i = 0; element != null; i++) {
            if (i == index) {
                element.setValue(newElement);
                element.setNext(lastElement);
                return;
            }
            lastElement = element;
            element = element.getNext();
        }
    }

    public void remove(int index) {
        Node<E> element = head;
        for (int i = 0; element != null; i++) {
            if (i == index) {
                element.getValue();
            }
            element = element.getNext();
        }
    }
}
