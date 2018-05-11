package br.com.rodolfo.view;

import javax.swing.*;
import java.io.File;

public class CarregarArquivo  extends TelaCompilador{


    public CarregarArquivo(JTextPane editor) {

        File arquivo  = null;

        try {

            JFileChooser fc = new JFileChooser();
            fc.setDialogTitle("Escolha o arquivo...");
            fc.setDialogType(JFileChooser.OPEN_DIALOG);
            fc.setApproveButtonText("OK");
            fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
            fc.setMultiSelectionEnabled(false);
            int resultado = fc.showOpenDialog(fc);
            if (resultado == JFileChooser.CANCEL_OPTION){
                System.exit(1);
            }
            arquivo = fc.getSelectedFile();
            editor.setPage(arquivo.toURI().toURL());

        } catch (Exception e) {

        }

    }

}
