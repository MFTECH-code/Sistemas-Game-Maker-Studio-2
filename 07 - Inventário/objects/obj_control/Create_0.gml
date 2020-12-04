//  Iniciando os itens
/*
	Cada item terá suas informações, e a informação mais importante de cada item será o ID, então temos que pensar em uma forma de identificar
	nossos itens.
	
	Para isso  iremos usar um tipo de variável chamado enumerator, que transforma os valores dentro dela em números e possui escopo GLOBAL
*/
enum item
{
	none, // -> 0
	banana,
	uva, 
	espada,
	cajado,
	escudo,
	capacete,
	frango,
	livro,
	orbe,
	caixa,
	moeda,
	total // -> 5
}
// enum é uma estrutura indexada, começando do 0.
// show_message(item.banana); // Acessando o item banana, temos um retorno -> 1, que é o index da banana.
// Essa é a vantagem de usar enum, em vez de usar um número para acessar cada item, podemos acessar pelos nomes.

// Iniciando as informações dos itens
/*
	Os itens devem ter informações, e para isso usaremos outro enumerator
	nome
	descrição
	tipo
	dano
	cura
*/
enum item_stat
{
	nome,
	desc,
	tipo, // Como teremos 2 tipos, iremos separa-los em outro enum
	dano,
	cura,
	total
}

// Iniciando tipos
enum item_tipo
{
	none, // Sem tipo definido
	arma, // Itens que dão status quando equipados
	consumivel // Itens que quando são consumidos recuperam HP
}

// Agora precisamos listar os nossos itens, para que eles não sejam somente números.
// Vamos utilizar uma data structure chamada ds_grid, que possui colunas e linhas
// A colunas serão o total de itens que temos, e as linhas serão as informações de cada item
/*
	Item1		item2		item3
	
	nome		nome		nome
	desc		desc		desc
	tipo		tipo		tipo
	dano		dano		dano
	cura		cura		cura
*/
global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); // Damos um clear, para garantir que a ds_grid irá começar zerada

// Adicionando nossos itens na ds_grid
ds_grid_set(global.item_index, item.banana, item_stat.nome, "Banana");
ds_grid_set(global.item_index, item.banana, item_stat.desc, "Fruta tropical");
ds_grid_set(global.item_index, item.banana, item_stat.tipo, item_tipo.consumivel);
ds_grid_set(global.item_index, item.banana, item_stat.dano, 0);
ds_grid_set(global.item_index, item.banana, item_stat.cura, 5);
// Em vez de usar uma função para adicionar itens, podemos usar um acessor
global.item_index[# item.uva, item_stat.nome] = "Uva";
global.item_index[# item.uva, item_stat.desc] = "Fruta, utilizada em bebidas alcoólicas";
global.item_index[# item.uva, item_stat.tipo] = item_tipo.consumivel;
global.item_index[# item.uva, item_stat.dano] = 0;
global.item_index[# item.uva, item_stat.cura] = 3;

// Note que cada vez que formos adicionar um novo item teremos que repetir varias vezes o mesmo código...
// Para resolver isso criaremos um script, que irá tornar esse processo mais rápido
scr_add_item(item.espada, "Espada", "Espada de iniciante", item_tipo.arma, 5, 0);
scr_add_item(item.cajado, "Cajado", "Cajado de iniciante", item_tipo.arma, 3, 0);
scr_add_item(item.escudo, "Escudo", "Escudo frágil", item_tipo.arma, 1, 0);
scr_add_item(item.capacete, "Capacete", "Capacete frágil", item_tipo.arma, 1, 0);
scr_add_item(item.frango, "Frango", "Frango da granja", item_tipo.consumivel, 0, 10);
scr_add_item(item.livro, "Livro", "Livro de histórias", item_tipo.none, 0, 0);
scr_add_item(item.orbe, "Orbe", "Orbe que vê o futuro", item_tipo.none, 0, 0);
scr_add_item(item.caixa, "Caixa", "O que tem dentro?", item_tipo.none, 0, 0);
scr_add_item(item.moeda, "Moeda", "1 centavo...", item_tipo.none, 0, 0);

/*
	Com esse sistema conseguimos adicionar mais itens, com pouco trabalho
*/

// Criando o inventário do player
/*
	Vamos fazer alguns slots de inventário, que deverá conter o ID do item e a quantidade
	Então criaremos mais uma ds_grid, agora para o inventário do player
*/
global.inv = ds_grid_create(10, 2);
// 10 -> slots de inventário, 2 -> ID, quantidade
ds_grid_clear(global.inv, 0); // Zerando nossa grid

// Vamos criar scripts para manipulação do inventário
// Pegando itens
// Mudando itens

// Iniciando os slots do inventário (OBS: obj_control e obj_slot devem ser PERSISTENTES)
var inv_width = ds_grid_width(global.inv);

for (var i = 0; i < inv_width; i++)
{
	// Criando slots
	var slot_width = sprite_get_width(spr_slot);
	var pos_x = i * slot_width + 8;
	var slot = instance_create_layer(pos_x, 8, "GUI", obj_slot);
	slot.slot_id = i; // Identificando os slots
	slot.pos_x = pos_x;
	slot.pos_y = 8;
}

// Iniciando a grid do mouse, para que possamos mover os itens utilizando o mouse
global.mouse_slot = ds_grid_create(1, 2);
ds_grid_clear(global.mouse_slot, 0);
















