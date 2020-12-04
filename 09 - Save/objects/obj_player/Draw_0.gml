draw_self();

// Vamos desenhar a barra de vida do player
var vida_atual = (vida / max_vida)* 100;
draw_healthbar(x - 16, y - 22, x + 16, y - 32, vida_atual, c_black, c_red, c_green, 0, true, true);
draw_text(x + 16, y - 26, string(poder));