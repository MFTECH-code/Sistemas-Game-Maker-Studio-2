// Variáveis iniciais
vel = 5;
velh = 0;
velv = 0;

atr_normal = .25;
atr_gelo = .01;

sprite_antiga = sprite_index;
estado = "parado";
baixo = spr_baixo;
cima = spr_cima;
esquerda = spr_esquerda;
baixo_ataque = spr_baixo_ataque;
cima_ataque = spr_cima_ataque;
esquerda_ataque = spr_esquerda_ataque;
face = 0;
/*
	0 -> Direita
	1 ->  Cima
	2 -> Esquerda
	3 -> Baixo
*/

atacando = false;
/*
	Para fazer as animações, usaremos a state machine, o que torna nosso trabalho mais prático.
	estados:
	parado -> animação de ficar parado ou somende deixar image_speed = 0
	movendo -> animação de andar
	atacando -> animação de atacar
*/
max_vida = 20;
vida = 5;
arma = 0;
dano = 0;


// Aplicando a hurtbox no player, assim que o player for criado
hurtbox = instance_create_layer(x, y, "Instances", obj_player_hurtbox);
hurtbox.pai = self;

espera_dano = room_speed / 4;