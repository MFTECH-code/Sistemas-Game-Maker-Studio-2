// Desenhando o item do mouse no mouse
var item_id = global.mouse_slot[# 0, 0];
var qtd = global.mouse_slot[# 0, 1];

if (item_id != item.none) // Se tiver item no mouse
{
	draw_sprite(spr_item, item_id, mouse_x, mouse_y);
	draw_text(mouse_x + 8, mouse_y + 8, string(qtd));
}




















// Desenhando os itens na tela
// draw_sprite(spr_item, item.uva, mouse_x, mouse_y);





















// Acessando uma ds_grid
/*
draw_text(mouse_x, mouse_y, ds_grid_get(global.item_index, item.banana, item_stat.nome));
draw_text(mouse_x, mouse_y + 20, ds_grid_get(global.item_index, item.banana, item_stat.desc));
draw_text(mouse_x, mouse_y + 40, ds_grid_get(global.item_index, item.banana, item_stat.tipo));
draw_text(mouse_x, mouse_y + 60, ds_grid_get(global.item_index, item.banana, item_stat.dano));
draw_text(mouse_x, mouse_y + 80, ds_grid_get(global.item_index, item.banana, item_stat.cura));*/














/*
draw_set_color(c_red);
// Exibindo toda nossa grid
for (var i = 0; i < item.total; i++) // Colunas
{
	var width = sprite_get_width(spr_item) * 2;
	var sep = string_height("oi");
	// Desenhando a sprite
	draw_sprite(spr_item, i, i * width, 4);
	for (var j = 0; j < item_stat.total; j++) // Linhas
	{
		draw_text_ext(width * i, width * j + width, global.item_index[# i, j], sep, width);
	}
}
draw_set_color(c_white);
*/

// Desenhando slots do iventário
/*
for (var i = 0; i < 10; i++)
{
	draw_sprite(spr_item, global.inv[# i, 0], i * 64, 20);
	draw_text(i * 64, 64, global.inv[# i, 1]);
}
*/


