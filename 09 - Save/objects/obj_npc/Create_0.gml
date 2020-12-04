image_speed = 0;
sprite_index = spr_baixo_ataque;

/*
	O nosso NPC deve iniciar o diálogo, então ele vai criar o o diálogo no game.
	O NPC então conterá os textos para realizar o diálogo, para isse vamos precisar pegar o texto do npc e passar para o obj_text
*/
// Vamos fazer uma forma de o NPC ter vários diálogos
text_um = ["Olá, meu nome é Jubileu!",
				"Tudo bem com você?",
				"Então ta bom, tchau!"];

text_dois = ["Eu descobri um segredo",
				"Há muitos anos atrás uma senhora morreu",
				"Fim, acabou a história..."];

text_tres = ["Só queria a att de arrays do curso :/",
				"mt chato ter que esperar..."]
// Nosso array terá vários arrays dentro dele isso se chama array 2D
npc_text = [text_um, text_dois, text_tres];

estado = 0;

/*
	Com esse tipo de sistema, de array 2D, podemos criar sistemas de diálogos que mudam comforme o humor do NPC
*/
text = noone;