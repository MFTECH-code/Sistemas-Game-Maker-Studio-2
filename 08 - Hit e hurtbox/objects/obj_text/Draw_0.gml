// Ferramenta de debug para reiniciar a room
if (keyboard_check_pressed(vk_enter)) room_restart();

// Dados da câmera
var cam_posX = camera_get_view_x(view_camera[0]);
var cam_posy = camera_get_view_y(view_camera[0]);
var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);
// Dados da text box
var box_width = sprite_get_width(spr_text_box);
var box_height = sprite_get_height(spr_text_box);
// Fazendo cálculo do xscale
var size_width = box_size_ini / box_width;

// Fazendo tamanho inicial da caixa aumentar o valor com lerp
box_size_ini = lerp(box_size_ini, box_width, .05);

// Desenhando sprite
draw_sprite_ext(spr_text_box, 0, cam_posX, cam_posy + (cam_height - box_height), size_width, 1, 0, color, 1);


// Configurando a escrita do texto
text_atual = string_copy(text[pagina], 1, indice);
text_limite = string_length(text[pagina]);
	
if (indice < text_limite) 
{
	indice++;
}

// Dados do texto
var text_height = string_height(text[pagina]);

// Desenhando texto
draw_set_font(fnt_normal);
draw_text_ext(cam_posX + (cam_width - (cam_width - margin_left)), cam_posy + (cam_height - box_height), text_atual, text_height, box_width - margin_right);

draw_set_font(-1);
// Desafio, trocar a fonte para mostrar os acentos, e pensar em uma forma do texto acompanhar a nossa view
/*
	Solução:
	Para o problema dos acentos, criei uma nova fonte, que possui o range ASCII. Dessa forma podemos acentuar nosso texto.
	Para o problema da posição do texto, peguei a posição da câmera x e y, e apenas coloquei a posição do texto nas mesmas.
*/

/*
	Colocamos dados em variáveis pois torna muito mais fácil nosso trabalho, caso algum valor seja alterado, não precisamos alterar o código
*/