// Dropando itens no chão
var item_id = global.mouse_slot[# 0, 0];
var qtd = global.mouse_slot[# 0, 1];


// Soltar o item
if (item_id != item.none) // Se tiver item no mouse
{
	var mouse_click = mouse_check_button_pressed(mb_left);
	var espaco_livre = !position_meeting(mouse_x, mouse_y, obj_slot);
	if (mouse_click && espaco_livre) // Se clickar, e o espaço estiver livre(fora do slot)
	{
			// Criando item no chão
		var item_criado = instance_create_layer(mouse_x, mouse_y, "Level", obj_item);
		item_criado.item_id = item_id;
		item_criado.qtd = qtd;
		item_criado.image_index = item_criado.item_id;
		item_criado.image_speed = 0;
		
		// Zerando as informaçoes do mouse
		global.mouse_slot[# 0, 0] = item.none;
		global.mouse_slot[# 0, 1] = 0;
	}
}




// Criando itens
// DEBUG
var posso = keyboard_check(vk_shift);
var mouse_click = mouse_check_button_pressed(mb_left);
if (posso && mouse_click)
{
	// Criando item no chão
	var item_criado = instance_create_layer(mouse_x, mouse_y, "Level", obj_item);
	item_criado.item_id = irandom_range(1, item.total - 1);
	item_criado.qtd = 1;
	item_criado.image_index = item_criado.item_id;
	item_criado.image_speed = 0;
}

