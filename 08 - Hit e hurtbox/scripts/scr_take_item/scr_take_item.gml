///@desc scr_take_item(item_id, qtd)
function scr_take_item(item_id, qtd){
	var tam = ds_grid_width(global.inv);
	// Checando se o player já possui o item
	for (var i = 0; i < tam; i++)
	{
		// Checando se o slot atual já possui o item
		var item_atual = global.inv[# i, 0]; // Checando o item do slot atual
		// Checando se os items são iguais
		if (item_atual == item_id)
		{
			global.inv[# i, 0] = item_id;
			global.inv[# i, 1] += qtd; // Aumentamos a quantidade do item
			return true;
		}
	}
	
	// Checando se o player não possui o item
	for (var i = 0; i < tam; i++)
	{
		// Checando qual item está no slot atual
		var item_atual = global.inv[# i, 0];
		// Checando se o slot está vazio
		if (item_atual == item.none)
		{
			global.inv[# i, 0] = item_id;
			global.inv[# i, 1] = qtd; // Como não tem nada não somamos
			return true;
		}
	}
	
	// Não existe espaço para adicionar o item
	return false;
}