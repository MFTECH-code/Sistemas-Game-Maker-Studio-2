var box_collision = collision_rectangle(x - 40, y - 40, x + 40, y + 22, obj_player, false, true);
var start_dialogue = keyboard_check_pressed(vk_space);

if (box_collision)
{
	if (start_dialogue)
	{
		if (text == noone) // Se o texto não existir, criamos ele
		{
			text = instance_create_layer(x, y, "Level", obj_text);
			text.text = npc_text[estado]; // O texto do objeto texto recebe o texto do npc
			
			// Vamos fazer o npc terminar o diálogo
			text.pagina_limite = array_length_1d(npc_text[estado]) - 1; // Pegando total de páginas
			
			// Alternando estado
			if (estado < array_length_1d(npc_text) - 1)
			{
				/*
					Dessa forma, quando um diáligo acabar, ele passa para o próximo estado
				*/
				estado++; 
			}
		}
		else if (text.pagina >= text.pagina_limite) // Se passar do total de textos/páginas
		{
			instance_destroy(text); // Destruimos o text
			text = noone; // Voltamos ao estágio inicial
		}
	}
	// Parando o player, para que ele não se mecha durante o diálogo
	if (text != noone)
	{
		// A função collision_rectangle, nos retorna o ID do player, então podemos usar ela para identifica-lo
		box_collision.estado = "parado";
	}
}
/*
	Criamos uma área de colisão maior para tornar mais fácil o acessoa ao diálogo
*/