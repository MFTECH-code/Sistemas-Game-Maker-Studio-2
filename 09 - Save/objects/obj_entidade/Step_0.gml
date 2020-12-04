// Checando Colisão Horizontal
if (place_meeting(x + velh, y, obj_bloco))
{
	// Está colidindo, então irá avançar 1 pixel por vez até não ter espaço entre o player e o bloco
	// "O jogador não colide, o código irá grudalo"
	while(!place_meeting(x + sign(velh), y, obj_bloco))
	{
		// Enquanto NÃO colidir +1 pixel com o bloco
		x += sign(velh); // Aproxima o player 1 pixel
	}
	// Fim do laço de repetição então Colidiu
	velh = 0; // Para
	/* 
		OBS: sign -> Função matemática que sempre irá retornar:
		1 -> número positivo
		0 -> ZERO
		-1 -> número negativo
	*/
}
// DESAFIO: Fazer a colisão vertical
if (place_meeting(x, y + velv, obj_bloco))
{
	while(!place_meeting(x, y + sign(velv), obj_bloco))
	{
		y += sign(velv);
	}
	velv = 0;
}

// Essa parte do código, PRECISA ficar DEPOIS do código de colisão, pois se ele ficar antes as colisões serão calculadas mas não aplicadas
x += velh;
y += velv;
