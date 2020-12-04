text = "Testando texto, para ver se não da erro, testando som, testando tamanho do texto se vai quebrar linhas";
box_size_ini = 1;

// Vamos ter uma variáver que irá conter o texto atual do diálogo
text_atual = "";
// Tamanho total do texto
text_limite = 1;
// Indice da letra
indice = 0;

/*
	Nós iremos fazer um sistema que desenha uma letra por vez, no estilo undertale
*/

margin_left = 10;
margin_right = 20;

// Cada texto veremos como uma página, que no caso seria o indice
pagina = 0;

// Total de páginas, ou total de textos
pagina_limite = 1;

color = choose(c_white, c_yellow, c_blue);