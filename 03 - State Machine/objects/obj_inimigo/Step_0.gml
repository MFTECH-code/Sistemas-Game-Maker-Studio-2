dist = point_distance(x, y, obj_player.x, obj_player.y);
switch(estado)
{
	case "espera":
		timer--;
		espera_ataque--;
		image_blend = c_lime;
		var persegue_player = collision_circle(x, y, area_persegue, obj_player, false, true);
		
		// Saindo do estado de espera
		if (timer <= 0)
		{
			estado = choose("espera", "patrulha");
			timer = room_speed * irandom(espera) + 1;
			// Definindo a direção que o inimigo vai olhar
			xx = irandom(room_width);
			yy = irandom(room_height);
			dir = point_direction(xstart, ystart, xx, yy);
		}
		
		if (persegue_player && espera_ataque < 0)
		{
			estado = "persegue";
			espera_ataque = room_speed;
		}
		
		break;
	
	case "patrulha":
		timer--;
		espera_ataque--;
		image_blend = c_yellow;
		// Usando um círculo para pegar o id de uma colisão
		var persegue_player = collision_circle(x, y, area_persegue, obj_player, false, true);
		
		// Fazendo inimigo andar sozinho
		if ((abs(x - xstart) < 100 // -> Se a diferença entre a posXatual - posXinicial for menor do que 100
		&& abs(y - ystart) < 100) // -> Se a diferença entre a posYatual - posYinicial for menor do que 100
		&& patrulha_volta == false) 
		{
			/*
				Fazendo cálculo da distância
				posiçãoAtual - posiçãoInicial = Distância
				Para evitar números negativos usamos o abs
			*/
			// Se o inimigo não estiver longe da posição inicial ele poderá se mover
			x += lengthdir_x(1, dir);
			y += lengthdir_y(1, dir);
		}
		else
		{
			// Fazendo o inimigo voltar o ponto inicial
			dir = point_direction(x, y, xstart, ystart);
			x += lengthdir_x(1, dir);
			y += lengthdir_y(1, dir);
			patrulha_volta = true; // Está voltando
			
		}
		
		if ((abs(x - xstart) < 20
		&& abs(y - ystart) < 20)
		&& patrulha_volta == true)
		{
			// Se o inimigo estiver próximo da posição onde estava e estiver voltando, ele deve alterar a direção dele
			dir = point_direction(xstart, ystart, irandom(room_width), irandom(room_height));
			patrulha_volta = false;
			show_debug_message("Lento?");
		}
		// Dessa forma Conseguimos Limitar até onde o inimigo pode andar
		
		
		// Saindo do estado de patrulha utilizando o timer
		if (timer <= 0)
		{
			estado = choose("espera", "patrulha");
			timer = room_speed * irandom(espera) + 1;
		}
		
		if (persegue_player && espera_ataque < 0)
		{
			estado = "persegue";
			espera_ataque = room_speed;
		}

		break;
		
	case "persegue":
		image_blend = c_yellow;
		var persegue_player = collision_circle(x, y, area_persegue + 50, obj_player, false, true);
		var ataque_player = collision_circle(x, y, area_ataca, obj_player, false, true);
		// Saindo do modo de perseguição
		if (!persegue_player) // Se o player não estiver mais dentro da área
		{
			estado = "espera";
		}
		else // Se o player estiver dentro da área persegue
		{
			dir = point_direction(x, y, obj_player.x, obj_player.y);
			x += lengthdir_x(2, dir);
			y += lengthdir_y(2, dir);
			// Vamos usar len = 2 para que o inimigo ande mais rápido enquanto persegue o player
		}
		
		// Indo para o estado de ataque
		if (ataque_player)
		{
			estado = "ataque";
		}
		
		break;
		
	case "ataque":
		image_blend = c_red;
		timer_ataque--;
		// Para que o player possa desviar não mudaremos a direção do ataque.
		if (timer_ataque > 0)
		{
			x += lengthdir_x(7, dir);
			y += lengthdir_y(7, dir);
		}
		else
		{
			estado = "espera";
			timer_ataque = room_speed / 4;
			espera_ataque = room_speed;
		}
		// Usamos um timer para a duração do ataque
		
		break;
}
show_debug_message(estado);
/*
	Em cada estado precisamos de um meio de sair dele.
	Podemos usar um sistema com timer para ficar alternando entre estados, como do espera para patrulha e vice versa.
*/