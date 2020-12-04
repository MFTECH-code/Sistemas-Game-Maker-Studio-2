/*
	Vamos criar um objeto camera para ser responsável pela camera.
	É comum criarmos objetos para tarefas especificas, assim nosso código fica mais organizado e melhor estruturado
*/

alvo = noone;
vel = 0.1; // Velocidade da camera
modo = "normal";
// Pegando valores da câmera
camera = view_camera[0];
altura = camera_get_view_height(camera);
largura = camera_get_view_width(camera);
tam_cam = 1;
// Vamos fazer um sistema onde o alvo não seja só 1 objeto, queremos que a câmera possa ter outros alvos
/*
	A câmera também terá state machine, com varios modos
	normal -> segue o player
	mira -> segue o mouse
*/

// Para garantir que a câmera já fique mirando no player, colocamos ele em primeiro na ordem de criação da room.
if (instance_exists(obj_player))
{
	// Botamos a posição da câmera na mesma que o player
	x = obj_player.x;
	y = obj_player.y;
}
// Mas se quisermos dar um efeito de inicio de level, podemos deixar ela ir até o player, fica um efeito bem legal até