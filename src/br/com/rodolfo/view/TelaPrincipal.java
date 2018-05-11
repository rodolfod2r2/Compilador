package br.com.rodolfo.view;

import br.com.rodolfo.inteligence.PascalLexer;
import br.com.rodolfo.inteligence.parser;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TabPane;
import javafx.scene.control.TextArea;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

import java.io.*;
import java.nio.file.Paths;

public class TelaPrincipal extends Application {


    public static PascalLexer pascalLex = new PascalLexer();
    private final FileChooser fileChooser = new FileChooser();

    @FXML
    private TextArea editor;
    @FXML
    private TextArea saida;
    @FXML
    private TabPane tabPane;


    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws IOException {

        Parent root = FXMLLoader.load(getClass().getResource("activity.fxml"));
        primaryStage.setTitle("Ambiente de Desenvolvimento Rodolfo Express");
        primaryStage.setScene(new Scene(root, 800, 600));
        primaryStage.show();

    }


    public void open(ActionEvent actionEvent) {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        fileChooser.setTitle("Carregar Arquivos...");
        fileChooser.setInitialDirectory(new File(rootPath));
        fileChooser.getExtensionFilters().addAll(
                new FileChooser.ExtensionFilter("pascal Files", "*.pas")
        );

        File file = fileChooser.showOpenDialog(null);
        if (file != null) {
            try {
                FileReader reader = new FileReader(file);
                BufferedReader bufferedReader = new BufferedReader(reader);
                StringBuilder stringBuilder = new StringBuilder();
                String text;
                while ((text = bufferedReader.readLine()) != null) {
                    stringBuilder.append(text).append("\n");
                }
                editor.setText(stringBuilder.toString());

            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    }

    public void save(ActionEvent actionEvent) {

        pascalLex = null;

        try {

            String string = editor.getText();
            StringReader reader = new StringReader(string);
            pascalLex = new PascalLexer(reader);
            parser p = new parser(pascalLex);
            p.parse();

            if (parser.errors == 0) {
                saida.setText(String.valueOf(parser.code));
            } else {
                saida.setText("código não Produzido");
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void compile(ActionEvent actionEvent) {

       // saida.setText(editor.getText());
        tabPane.getSelectionModel().select(1);



        pascalLex = null;

        try {

            String string = editor.getText();
            StringReader reader = new StringReader(string);
            pascalLex = new PascalLexer(reader);
            parser p = new parser(pascalLex);
            p.parse();

            if (parser.errors == 0) {
                saida.setText(String.valueOf(parser.code));
            } else {
                saida.setText("código não Produzido");
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
