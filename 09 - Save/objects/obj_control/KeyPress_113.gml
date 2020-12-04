/*
	Sistema de save simples, ele é útil para salvar poucas coisas...
	Usaremos ini, que irá criar um arquivo de texto.ini, que vai armazenar algumas informações
	Lembrando que esse sistema de save não é bom quando queremos salvar muitas coisas
*/ 

// Abrir arquivo
ini_open("save.ini");

// Vamos salvar o inventário, como ele é uma ds_grid, ele possui recursos especiais para ser salvo, que transformam a ds_grid em string
var inv = ds_grid_write(global.inv);

if (instance_exists(obj_player)) // Se o player existir
{
	// Salvando informações do player: max_vida, vida, arma, posição
	var player_max_vida = obj_player.max_vida;
	var player_vida = obj_player.vida;
	var player_arma = obj_player.arma;
	var player_pos_x = obj_player.x;
	var player_pos_y = obj_player.y;
}
else
{
	var player_max_vida = 0;
	var player_vida = 0;
	var player_arma = 0;
	var player_pos_x = room_width / 2;
	var player_pos_y = room_height / 2;
}

// Escrevendo no arquivo
// Salvando dados do inventário
ini_write_string("itens", "inv", inv); // string, para salvar somente strings

// Salvando dados do player
ini_write_real("player", "max_vida", player_max_vida); // real, para salvar números
ini_write_real("player", "vida", player_vida);
ini_write_real("player", "arma", player_arma);
ini_write_real("player", "pos_x", player_pos_x);
ini_write_real("player", "pos_y", player_pos_y);

// Comfirmando salvamento
show_message("Jogo salvo com sucesso!");
// Fechar arquivo
ini_close();