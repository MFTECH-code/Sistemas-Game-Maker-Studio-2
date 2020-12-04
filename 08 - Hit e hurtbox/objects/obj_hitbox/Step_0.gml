// Checando a colisão
/*
	Para checar a colisão, queremos que cheque várias colisões, então não podemos usar o instance_place.
	Para resolver isso, usaremos instance_place_list, que nos retorna uma ds_list com todos os objetos que colidiram
*/

var lista_dano = ds_list_create();
if (!check_player) // Se foi o player que criou a hitbox, não precisa checar ele.
{
	// Checando os inimigos
	var col = instance_place_list(x, y, obj_entidade, lista_dano, false);
}
else // O inimigo criou a hitbox
{
	// Checando o player
	var col = instance_place_list(x, y, obj_player, lista_dano, false);
}

// Executar o dano
if (col) // Houve colisão
{
	// Vamos ter que usar um laço de repetição, para verificar por toda lista
	var size = ds_list_size(lista_dano);
	for (var i = 0; i < size; i++)
	{
		// Código para gerenciar o dano
		var outro = lista_dano[| i];
		
		// Checando, se não é o pai que colidiu
		if (outro != pai)
		{
			// Não vai afetar o criador da hitbox
			outro.vida -= dano; // Diminui a vida
			outro.estado =  "dano"; // Mudando o estado
			outro.dir = dir;
		}
	}
}
// Sempre destrua a ds_list depois de usá-la
ds_list_destroy(lista_dano);
// Destruimos o objeto de dano, pra ele n ficar pra sempre ali
instance_destroy();