///@desc scr_add_item(item_id, nome, desc, tipo, dano, cura)
function scr_add_item(item_id, nome, desc, tipo, dano, cura){
	global.item_index[# item_id, item_stat.nome] = nome;
	global.item_index[# item_id, item_stat.desc] = desc;
	global.item_index[# item_id, item_stat.tipo] = tipo;
	global.item_index[# item_id, item_stat.dano] = dano;
	global.item_index[# item_id, item_stat.cura] = cura;
}