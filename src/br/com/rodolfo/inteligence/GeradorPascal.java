package br.com.rodolfo.inteligence;

import java.io.File;
import java.nio.file.Paths;

public class GeradorPascal {
	public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath(). toString();
        String subPath = "/src/br/com/rodolfo/inteligence/";

        String file = rootPath + subPath + "pascalgrammar.lex";

        File sourceCode = new File(file);

        jflex.Main.generate(sourceCode);

    }

}
