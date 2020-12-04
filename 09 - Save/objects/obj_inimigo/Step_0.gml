event_inherited();

dist = point_distance(x, y, obj_player.x, obj_player.y);
switch(estado)
{
	case "espera":
		velh = 0;
		velv = 0;
	
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
			velh = lengthdir_x(vel, dir);
			velv = lengthdir_y(vel, dir);
		}
		else
		{
			// Fazendo o inimigo voltar o ponto inicial
			dir = point_direction(x, y, xstart, ystart);
			velh = lengthdir_x(vel, dir);
			velv = lengthdir_y(vel, dir);
			patrulha_volta = true; // Está voltando
			
		}
		
		if ((abs(x - xstart) < 20
		&& abs(y - ystart) < 20)
		&& patrulha_volta == true)
		{
			// Se o inimigo estiver próximo da posição onde estava e estiver voltando, ele deve alterar a direção dele
			dir = point_direction(xstart, ystart, irandom(room_width), irandom(room_height));
			patrulha_volta = false;
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
			velh = lengthdir_x(2, dir);
			velv = lengthdir_y(2, dir);
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
		
		// Checando se houve colisão com a hurtbox do player
		var col = place_meeting(x, y, obj_player.hurtbox); 
		// Para garantir que seja só com a hurtbox do player usamos o obj_player.hurtbox
		if (col)
		{
			// Vai criar uma hitbox na posição do player
			var hitbox = instance_create_layer(obj_player_hurtbox.pai.x, obj_player_hurtbox.pai.y, "Instances", obj_hitbox);
			hitbox.check_player = true;
			hitbox.dano = dano;
			hitbox.dir = dir;
			// Fazer com que o inimigo saia do estado de ataque assim que atacar o player
			estado = "espera";
			timer_ataque = room_speed / 4;
			espera_ataque = room_speed;
		}
		
		
		
		// Para que o player possa desviar não mudaremos a direção do ataque.
		if (timer_ataque > 0)
		{
			velh = lengthdir_x(3, dir);
			velv = lengthdir_y(3, dir);
		}
		else
		{
			estado = "espera";
			timer_ataque = room_speed / 4;
			espera_ataque = room_speed;
		}
		// Usamos um timer para a duração do ataque
		
		break;
	
	case "dano":
		espera_dano--;
		
		image_blend = c_purple;
		
		if (espera_dano > 0)
		{
			velh = lengthdir_x(2, dir);
			velv = lengthdir_y(2, dir);
		}
		
		if (vida <= 0)
		{
			// Dropando itens
			var item_criado = instance_create_layer(x, y, "Level", obj_item);
			item_criado.item_id = irandom_range(1, item.total - 1);
			item_criado.qtd = 1;
			item_criado.image_index = item_criado.item_id;
			item_criado.image_speed = 0;
			instance_destroy();
		}
		
		if (espera_dano <= 0)
		{
			estado = "espera";
			espera_dano = room_speed;
			levar_dano = true;
		}
		
		break;
}
//show_debug_message(estado);
/*
	Em cada estado precisamos de um meio de sair dele.
	Podemos usar um sistema com timer para ficar alternando entre estados, como do espera para patrulha e vice versa.
*/