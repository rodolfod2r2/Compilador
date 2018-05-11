package br.com.rodolfo.inteligence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TabelaSimbolos {

    public static TabelaSimbolos escopoCorrente;
    static TabelaSimbolos root = new TabelaSimbolos(null);
    static int contadorDeTabelas;

    HashMap<String, Simbolo> table;
    TabelaSimbolos anterior;
    List<String> vars;

    public TabelaSimbolos(TabelaSimbolos anterior) {
        table = new HashMap<String, Simbolo>();
        this.anterior = anterior;
        vars = new ArrayList<String>();
    }

    public static TabelaSimbolos getRoot() {
        return root;
    }

    public boolean isRoot() {
        return anterior == null;
    }

    public static void inicializa() {
        contadorDeTabelas = 0;
        escopoCorrente = root;
    }

    public static boolean inserir(String nome, Simbolo s) {
        if (!escopoCorrente.table.containsKey(nome)) {
            escopoCorrente.table.put(nome, s);
            return true;
        }
        return false;
    }

    public static void inserirSimbolo(String nome, Simbolo s) {
        TabelaSimbolos e = escopoCorrente.anterior;
        e.table.put(nome, s);
    }

    public static boolean inserirVariavel(String nome, Simbolo s) {
        if (!escopoCorrente.table.containsKey(nome)) {
            escopoCorrente.table.put(nome, s);
            escopoCorrente.vars.add(nome);
            return true;
        }
        return false;
    }

    public static Simbolo get(String nome) {
        return get(nome, escopoCorrente);
    }

    public static Simbolo get(String nome, TabelaSimbolos tab) {
        for (TabelaSimbolos t = tab; t != null; t = t.anterior) {
            Simbolo s = (Simbolo) (t.table.get(nome));
            if (s != null) {
                return s;
            }
        }
        return null;
    }

    static void push(TabelaSimbolos tab) {
        contadorDeTabelas++;
        escopoCorrente = new TabelaSimbolos(tab);
    }

    public static void push() {
        push(escopoCorrente);
    }

    public static void pop() {
        escopoCorrente = escopoCorrente.anterior;
        contadorDeTabelas++;
    }

}