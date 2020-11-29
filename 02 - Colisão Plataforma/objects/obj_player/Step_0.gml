event_inherited();

// Movimentação
var right, left, jump, jump_r, _velh, chao;
chao = place_meeting(x, y + 1, obj_bloco);
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
jump = keyboard_check_pressed(ord("Z"));
jump_r = keyboard_check_released(ord("Z"));

_velh = (right - left) * vel;
velh = lerp(velh, _velh, .25);

// Aplicando gravidade
if (!chao)
{
	// Se não estiver colidindo com o "chão"
	velv += grav;
	// Controlando pulo
	if (jump_r && velv < 0)
	{
		// Soltou o butão de pulo e o player está caindo
		velv *= .5;
	}
}

// Pulando
if (chao)
{
	if (jump)
	{
		velv = -pulo;
	}
}

