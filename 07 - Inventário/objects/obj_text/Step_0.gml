// Vamos trocar de página ou mudar o texto cada vez que o jogador apertar espaço

// Precisamos checar se é possivel trocar de página
if (keyboard_check_pressed(vk_space))
{
	if (indice >= text_limite)
	{
		pagina++;
		indice = 0; // Zerando indice, para que faça o efeito de digitação em todos os dialogos
	}
	else
	{
		indice = text_limite;
	}
}


