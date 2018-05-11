package br.com.rodolfo.view;

import br.com.rodolfo.inteligence.PascalLexer;
import br.com.rodolfo.inteligence.parser;


import javax.swing.*;
import java.io.*;

public class TelaIDE {

    private JPanel context;
    private JTabbedPane tabbedPane1;
    private JButton btnAbrir;
    private JButton btnCompilar;
    private JTextPane editor;
    private JTextPane saida;
    private File arquivo = null;

    public static PascalLexer pascalLex = new PascalLexer();


    public TelaIDE() {
        
//        JScrollPane jspEditor = new JScrollPane(editor);
//        JScrollPane jspSaida = new JScrollPane(saida);


        btnAbrir.addActionListener(e -> {

            JFileChooser fc = new JFileChooser();
            fc.setDialogTitle("Escolha o arquivo...");
            fc.setDialogType(JFileChooser.OPEN_DIALOG);
            fc.setApproveButtonText("OK");
            fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
            fc.setMultiSelectionEnabled(false);
            int resultado = fc.showOpenDialog(fc);
            if (resultado == JFileChooser.CANCEL_OPTION) {
            } else {
                arquivo = fc.getSelectedFile();
                editor.setText("");
                saida.setText("");
            }
            try {
                editor.setPage(arquivo.toURI().toURL());

            } catch (IOException e1) {
                e1.printStackTrace();
            }

        });


        btnCompilar.addActionListener(e -> {

            File sourceCode = arquivo;

            pascalLex = null;

            try {
                pascalLex = new PascalLexer(new FileReader(sourceCode));
                parser p = new parser(pascalLex);
                p.parse();
                if (parser.errors == 0)
                    try {
                        saida.setText("");
                        FileOutputStream fStream;
                        PrintWriter myStream;
                        fStream = new FileOutputStream(sourceCode + ".asm");
                        myStream = new PrintWriter(fStream);
                        myStream.println(parser.code);
                        myStream.flush();
                        myStream.close();
                        System.out.println("\nCode written to \"" + sourceCode + ".asm\".");
                        saida.setText(String.valueOf(parser.code));
                    } catch (IOException eo) {
                        saida.setText("");
                        eo.printStackTrace(System.out);
                        System.exit(1);
                    }
                else
                    saida.setText("código não Produzido");

            } catch (FileNotFoundException e1) {
                e1.printStackTrace();
            } catch (Exception e1) {
                e1.printStackTrace();
            }

            tabbedPane1.setSelectedIndex(1);

        });
    }

    public static void main(String[] args) throws IOException {



        JFrame frame = new JFrame("Ambiente de Desenvolvimento Rodolfo Express");
        frame.setContentPane(new TelaIDE().context);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 800);
        frame.getSize();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);


    }


}
