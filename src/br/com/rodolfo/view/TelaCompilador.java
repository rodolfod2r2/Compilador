package br.com.rodolfo.view;

import javax.swing.*;

public class TelaCompilador extends JPanel {

    public static void main (String[] args){

        //Criando editor de texto;
        JTextPane editor = new JTextPane();

        JToolBar menu = new JToolBar();

        JButton btnAbrir = new JButton();

        menu.add(btnAbrir);

        //Carregar Arquivo
        CarregarArquivo load = new CarregarArquivo(editor);

        //Criando Janela
        JFrame janela = new JFrame("Ambiente de Desenvolvimento Rodolfo Express");

        //
        janela.add(menu).contains(0,50);

        //adicionando Editor a Janela
        janela.add(editor);

        //Definindo o Tamanho da Janela;
        janela.setSize(800,800);

        //Centralizando Janela
        janela.setLocationRelativeTo(null);

        //Exibindo a Janela;
        janela.setVisible(true);

        //encerrando aplicação ao fechar a janela
        janela.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);







    }
}
