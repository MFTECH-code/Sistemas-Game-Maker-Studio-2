///@desc scr_change_slot(slot, qtd, sub)
function scr_change_slot(slot, qtd, sub){
	// Checando se o item será subtituido
	if (sub == false) // Não vai subtituir
	{
		global.inv[# slot, 1] += qtd; // Vamos somar a quantidade	
	}
	else // Será subtituido
	{
		global.inv[# slot, 1] = qtd;
	}
	
	// Checando se o slot está vazio
	if (global.inv[# slot, 1] <= 0) // Não tem item
	{
		global.inv[# slot, 0] = item.none; // Está sem item
		global.inv[# slot, 1] = 0;
	}
		
}