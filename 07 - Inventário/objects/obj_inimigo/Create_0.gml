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
area_persegue = 200;
area_ataca = 100;
timer_ataque = room_speed / 4;
espera_ataque = room_speed;



/*
	Estados
	espera -> fica parado
	patrulha -> ele anda
*/
