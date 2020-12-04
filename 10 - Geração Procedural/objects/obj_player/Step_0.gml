// Movimentação do player
var up, right, left, down, _velv, _velh, _atrito;
up = keyboard_check(vk_up);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
down = keyboard_check(vk_down);

/*
	Cálculo simples
	1 -> true
	0 -> false
	Então se eu apertar right o valor será 1 multiplicado pela velocidade
	Essa é uma prática de fazer uma condição sem ter que usar if/else
*/

// Fazendo o cálculo da velocidade
_velh = (right - left) * vel; 
_velv = (down - up) * vel;
/*
	Usando lerp para dar fluidez no movimento
	Também podemos usa-lo para tipos diferentes de atrito, como no gelo, o player deve deslizar mais
*/


// Mecânica de deslize no gelo, podemos usar else if para adicionar mais tipos de atritos
if (place_meeting(x, y, obj_gelo))
{
	_atrito = atr_gelo;
}
else
{
	_atrito = atr_normal;
}

velh = lerp(velh, _velh, _atrito);
velv = lerp(velv, _velv, _atrito);




/*
	Sistema de colisão
	Esse sistema se baseia em basicamente checar se adicionando a velocidade o player colide com algum objeto
*/
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