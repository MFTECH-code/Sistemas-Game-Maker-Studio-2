// Movimentação do player
var up, right, left, down, _velv, _velh, _atrito, ataque;
up = keyboard_check(vk_up);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
down = keyboard_check(vk_down);
ataque = keyboard_check_pressed(ord("Z"));


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


// Ajustando a image_xscale
if (velh != 0) // Se não estiver parado
{
	image_xscale = -sign(velh);
}

switch(estado)
{
	case "parado":
		image_index = 0;
		image_speed = 0;
		velh = 0;
		velv = 0;
		
		// Apartir do momento em que _velv ou _velh obtiverem um valor, o player deve ir para o estado movendo
		if (_velv != 0 || _velh != 0)
		{
			estado = "movendo";
		}
		
		// Ataque parado
		if (ataque)
		{
			estado = "ataque";
			image_speed = 1;
		}
		
		break;
	
	case "movendo":
		image_speed = 1;
		// Só vai ter velocidade, se o player estiver no estado de movimento
		velh = lerp(velh, _velh, _atrito);
		velv = lerp(velv, _velv, _atrito);
		
		// Fazendo animações do player cima e baixo
		if (abs(velh) > 0.5 && abs(velv) < 1) // Indo para esquerda e para direita
		{
			// Para que funcione a direita, usamos != 0, pois assim essa condição se aplica as duas direções, não precisando se preucupar com image index pois ja tem uma verificação antes
			// Novamente, por causa do lerp a animação demora um pouco para acontecer, então ajustamos o nosso código para que n demore tanto
			sprite_index = esquerda;
		}
		else if (velv > 0) // Indo para baixo
		{
			sprite_index = baixo;
		}
		else if (velv < 0) // Indo para cima
		{
			sprite_index = cima;
		}
		
		
		
		// Se velv e velh forem igual a 0, o player deve ir para o estado parado
		// Como estamos usando lerp em velv e velh, pode demorar um pouquinho para ir para o estado parado
		// Para resolver esse problema com lerp, usamos o valor absoluto, e definimos um número um pouco maior q zero para considerar parado
		// Ou podemos usar _velv e _velh já que não estão usando lerp, os valores deles são exatos
		if (abs(velv) < 0.5 && abs(velh) < 0.5)
		{
			estado = "parado";
		}
		
		// Indo para o estado de ataque
		if (ataque)
		{
			estado = "ataque";
		}
		
		break;
	
	case "ataque":
		// O ataque será realizado parado
		velh = 0;
		velv = 0;
		
		
		if (atacando == false)
		{
			image_index = 0;
			sprite_antiga = sprite_index;
		}

		atacando = true;
		// Lados do ataque
		if (sprite_antiga == spr_baixo)
		{
			sprite_index = baixo_ataque;
		}
		else if (sprite_antiga == spr_cima)
		{
			sprite_index = cima_ataque;
		}
		else if (sprite_antiga == spr_esquerda)
		{
			sprite_index = esquerda_ataque;
		}
		
		
		// Pegando o fim da animação
		if (image_index > image_number - 1)
		{
			// image_number -> retorna o número de subimagens da sprite
			atacando = false; // Depois de terminar a animação, o ataque termina
		}
		
		if (!atacando)
		{
			sprite_index = sprite_antiga;
			estado = "movendo";	
		}
		
		
		break;
}
//show_debug_message(estado);




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