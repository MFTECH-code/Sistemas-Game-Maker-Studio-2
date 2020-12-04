// Configurando a posição do X e do Y do slot

// Ajustando a posição
// Precisamos ajustar a posição do slot, á posição da câmera
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

x = cam_x + pos_x;
y = cam_y + pos_y;


// Pegando itens do slot (com o mouse)
var mouse_sobre = position_meeting(mouse_x, mouse_y, self);
var mouse_left_click = mouse_check_button_pressed(mb_left);

// Verificando se o mouse está sobre o slot e se o clickou
if (mouse_sobre)
{
	// Mouse está sobre o slot
	if (mouse_left_click)
	{
		// Clickou
		var item_id = global.inv[# slot_id, 0]; // Pegando ID do item
		var qtd = global.inv[# slot_id, 1]; // Pegando quantidade do item
		
		//  Informações do mouse
		var mouse_item_id = global.mouse_slot[# 0, 0]; 
		var mouse_qtd = global.mouse_slot[# 0, 1];
		
		// Checando se o slot está livre ou se o mouse está livre ou os itens são diferentes
		if (item_id == item.none || mouse_item_id == item.none || item_id != mouse_item_id)
		{
			// Pegando os itens do mouse
			global.inv[# slot_id, 0] = mouse_item_id;
			global.inv[# slot_id, 1] = mouse_qtd;
			
			// Colocando os itens no mouse
			global.mouse_slot[# 0, 0] = item_id;
			global.mouse_slot[# 0, 1] = qtd;
		}
		// Checando se é o mesmo item
		else if (mouse_item_id == item_id)
		{
			// Pegando os itens do mouse
			global.inv[# slot_id, 1] += qtd;
			
			// Zerando informações do mouse
			global.mouse_slot[# 0, 0] = item.none;
			global.mouse_slot[# 0, 1] = 0;
		}
	}
}

// Usando items
var mouse_right_click = mouse_check_button_released(mb_right);

if (mouse_sobre && mouse_right_click)
{
	var item_id = global.inv[# slot_id, 0];
	// Checando se possui item
	if (item_id != item.none)
	{
		// Checando se o item é consumivel
		if (global.item_index[# item_id, item_stat.tipo] == item_tipo.consumivel)
		{
			// O item é consumivel
			// Checando se o player existe
			if (instance_exists(obj_player))
			{
				obj_player.vida += global.item_index[# item_id, item_stat.cura]; // Curando o player
				scr_change_slot(slot_id, -1, false); // Diminuimos a quantidade
			}
		}
		else if (global.item_index[# item_id, item_stat.tipo] == item_tipo.arma)
		{
				// Equipando armas
			if (instance_exists(obj_player))
			{
				if (obj_player.arma == item.none)
				{
					obj_player.arma = item_id;
					// O recomendável é que para os equipamentos do player, seja criada uma grid
					obj_player.poder += global.item_index[# item_id, item_stat.dano];
					scr_change_slot(slot_id, -1, false);
				}
				else if (obj_player.arma != item.none && obj_player.arma != item_id)
				{
					// Já tem arma diferente
					// Salvando a arma do player
					var arma_nova = obj_player.arma;
					// Equpando a arma no player
					obj_player.arma = item_id;
					scr_change_slot(slot_id, -1, false);
					
					// tentando adicionar arma nova
					if (!scr_take_item(arma_nova, 1))
					{
						// Se não conseguir adicionar o item no inventário
						global.mouse_slot[# 0, 0] = arma_nova;
						global.mouse_slot[# 0, 1] = 1;
					}
				}
			}
		}
	}
}



