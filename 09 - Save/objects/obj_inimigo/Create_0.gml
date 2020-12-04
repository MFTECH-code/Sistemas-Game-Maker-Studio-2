/*
	State Machine
	Método mais organizado de deixar o seu código.
	Nós precisamos buscar um meio de alternar entre estados
*/
image_blend = c_lime;

xx = x;
yy = y;
dir = -1;
estado = "espera";
espera = 3;
timer = room_speed * irandom(espera) + 1;
patrulha_volta = false;
area_persegue = sprite_width * 4;
area_ataca = sprite_height * 3;
timer_ataque = room_speed / 4;
espera_ataque = room_speed;
/*
	Estados
	espera -> fica parado
	patrulha -> ele anda
*/

// ------------------------------------------- Hit e hurttbox -----------------------------------------------------------------
velh = 0;
velv = 0;
vel = .5;
vida = 10;
dano_levado = 0;
// Criando uma espera pro dano, pra quando ele tomar dano, ele ter que esperar pra tomar outro dano
espera_dano = room_speed;
dano = 2;







