/*
	Se o player tocar no item, o item vai para o iventário
*/

// Colidindo com o player
var player_col = instance_place(x, y, obj_player);

if  (player_col)
{
	// Se, for possível adicionar o item no inventário
	if  (scr_take_item(item_id, qtd))
	{
		// Se destroi
		instance_destroy();
	}
}	