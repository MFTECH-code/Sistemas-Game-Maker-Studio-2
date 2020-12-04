draw_self();

var item_id = global.inv[# slot_id, 0]; // Pegando ID do item
var qtd = global.inv[# slot_id, 1]; // Pegando quantidade

// Desenhando item do slot, caso tenha...
if (item_id != item.none)
{
	// Desenhando o item
	draw_sprite(spr_item, item_id, x, y);
	// Desenhando a quantidade
	draw_text(x + 4, y + 4, string(qtd));
}

// Desenhando descrição do item
var mouse_sobre = position_meeting(mouse_x, mouse_y, self);

// Checando se o mouse está sobre o slot, e tem item
if (mouse_sobre && item_id != item.none)
{
	// Iniciando contagem
	timer++;
	if (timer >= room_speed)
	{
		// Tirando transparencia
		transp = lerp(transp, 1, .05);
		draw_set_alpha(transp);
		// Para evitar um possível overflow de memória, limitamos o valor do timer
		timer = room_speed * 2;
		
		// Desenhando retângulo
		var width = sprite_width;
		var height = sprite_height;
		
		switch(global.item_index[# item_id, item_stat.tipo])
		{
			case item_tipo.consumivel:
				var info = "Cura: +" + string(global.item_index[# item_id, item_stat.cura]);
				break;
			case item_tipo.arma:
				var info = "Dano: +" + string(global.item_index[# item_id, item_stat.dano]);
				break;
			case item_tipo.none:
				var info = "Desconhecido";
				break;
		}
		
		var texto = string(global.item_index[# item_id, item_stat.desc]);	
		draw_set_color(c_olive);
		draw_rectangle(x +  width / 2, y + height, x  + width / 2 + width * 5, y + height * 9, false);
		draw_set_color(c_white);
		// Desenhando o texto
		draw_set_font(fnt_normal);
		draw_text_ext(x + width / 2 + 4, y + height + 4, texto + "\n" + info, 20,  width * 4);
		draw_set_font(-1);
		draw_set_alpha(1);
	}
}
// Assim que o mouse estiver fora ou não tiver item no slot, zeramos o timer
else
{
	timer = 0;
}