// Vamos usar o end Step para se certificar que o código de colisão será a última coisa do nosso código
/*
	Esse sistema ao invés de fazermos a checagem primeiro, fazemos o laço de repetição antes
*/
repeat(abs(velh))
{
	// OBS: abs -> retorna o valor absoluto de um número, ou seja, a parte positiva dele.
	/*
		Se o player estiver se mechendo o código será executado 5 vezes
		Se não o código não será executado nenhuma vez
	*/
	
	// Ajustando código para rampas
	// Subindo rampa
	if (place_meeting(x + sign(velh), y, obj_bloco) // -> Existe um bloco do lado
	&& !place_meeting(x + sign(velh), y - 1, obj_bloco)) // -> Em cima do objeto não há bloco
	{
		y--; // Então o objeto sobe 1 pixel
	}
	// Descendo rampa
	if (!place_meeting(x + sign(velh), y, obj_bloco) // -> Não está colidindo com o bloco horizontalmente
	&& !place_meeting(x + sign(velh), y + 1, obj_bloco) // -> Não existe colisão embaixo do objeto
	&& place_meeting(x + sign(velh), y + 2, obj_bloco)) // -> existe colisão 2 pixels abaixo do objeto
	{
		y++; // Então o objeto desce 1 pixel
	}
	
	if (!place_meeting(x + sign(velh), y, obj_bloco))
	{
		// Se o objeto não colidir avance 1 pixel
		x += sign(velh);
	}
	else
	{
		// Colidiu, pare!
		velh = 0;
		break; // Sair do laço de repetição
	}
}

// DESAFIO: fazer a colisão vertical
repeat(abs(velv))
{
	if (!place_meeting(x, y + sign(velv), obj_bloco))
	{
		y += sign(velv);
	}
	else
	{
		velv = 0;
		break;
	}
}
