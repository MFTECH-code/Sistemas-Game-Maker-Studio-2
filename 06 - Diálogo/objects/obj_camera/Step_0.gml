var click, click_res;
click = mouse_check_button_pressed(mb_left);
click_res = mouse_check_button_released(mb_left);

switch(modo)
{
	case "normal":
		tam_cam = lerp(tam_cam, 1, 0.1);
		camera_set_view_size(camera, largura / tam_cam, altura / tam_cam);
		
		if (instance_exists(obj_player))
		{
			// Se o player existir
			alvo = obj_player;
		}
		
		// Fazendo a câmera seguir o alvo
		x = lerp(x, alvo.x, vel);
		y = lerp(y, alvo.y, vel);
		
		// Indo para modo mira
		if (click)
		{
			modo = "mira";
		}
		
		break;
	
	case "mira":
		// Fazendo a câmera seguir o mouse
		x = lerp(x, mouse_x, vel / 2);
		y = lerp(y, mouse_y, vel / 2);
		
		// Dando zoom
		tam_cam = lerp(tam_cam, 2, .01);
		camera_set_view_size(camera, largura / tam_cam, altura / tam_cam);
			
		// Indo para modo normal
		if (click_res)
		{	
			modo = "normal";	
		}
		
		break;
}


