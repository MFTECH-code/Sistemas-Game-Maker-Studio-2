image_blend = c_black;

/*
	Queremos que, ele encha a room de blocos, e depois delete alguns para fazer o caminho
*/

// Criando a room
// Definindo  a altura e a largura da room
var size = sprite_width; // 64
width = irandom_range(40, 100) * size;
height = width / 1.333333333;
/*
	Proporção de tela
	a largura é 1.33333333X maior que a altura.
*/
room_width = width;
room_height = height;

// Dividindo a room em colunas e linhas
var colunas = width div size;
var linhas = height div size;

// Defininfo a posição inicial do criador
x = irandom_range(colunas div 4, colunas div 2) * size;
y = irandom_range(linhas div 4, linhas div 2) * size;

// Criando blocos
for (var i = 0; i < colunas; i++)
{
	for (var j = 0; j < linhas; j++)
	{
		instance_create_layer(i * size, j * size, "Level", obj_bloco);
	}
}

// Regra pra poder formar o caminho

// Drunken walk -> andar bêbado
/*
	escolher uma entre 4 direções (cima, baixo, esquerda, direita) e dar um passo na quela direção "uma casa"
*/
// Definindo o número de passos
var passo = irandom_range(300, 1000);
var dir = 0;
var limite = irandom_range(30, 90);
var player_x = 0;
var player_y = 0;
var cont = 0;
repeat(passo)
{
	// Aumentando a chance de repetir a direção
	var chance = irandom(100);
	if (chance > limite) // Se a chance for maior que limite
	{
		// Escolhendo a direção do objeto criador
		var dir = irandom(3) * 90;
	}
	// Se for menor, ele mantêm a direção
	
	// Movendo o objeto criador
	x += lengthdir_x(size, dir);
	y += lengthdir_y(size, dir);
		
	// Destruindo os blocos em que colidir
	var bloco = instance_place(x, y, obj_bloco);
	if (bloco)
	{
		instance_destroy(bloco);
	}
	
	// Posição do player
	cont++
	if (cont == 180)
	{
		player_x = x;
		player_y = y;
	}
	
	// Limitando	a posição do criador para que ele não saia da room
	x = clamp(x, 5 * size, (colunas - 5) * size);
	y = clamp(y, 5 * size, (linhas - 5) * size);
}

// Criando player
instance_create_layer(player_x, player_y, "Instances", obj_player);

// Criando a câmera
instance_create_layer(x, y, "Instances", obj_camera);

mapa = true;








