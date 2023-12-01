// INICIANDO VARIÁVEIS

sel				= 0; // valor selecionado no menu





#region //MÉTODOS DO MENU
teclado			= function(_menu)// SELECIONANDO MENU PELO TECLADO
{
	var  _up, _down, _menu_comprimento;
	_up				= keyboard_check_pressed(vk_up); // checando se eu apertei a tecla UP do teclado
	_down			= keyboard_check_pressed(vk_down); // checando se eu apertei a tecla DOWN do teclado
	_menu_comprimento	= array_length(_menu);
	if(_down or _up) 
	{
		sel += _down - _up; // MOVENDO SELEÇÃO PARA CIMA PI BAIXO
		if(sel > _menu_comprimento -1) sel = 0; // se o valor da seleção ultrapassar o valor máximo a seleção volta para posição inicial
		if(sel < 0) sel = _menu_comprimento -1; // se o valor da seleção ultrapassar o valor mínimo a seleção vai para posição final
	}
	
}



// Escrevendo o Menu na tela
criar_menu		= function(_menu)
{
	
		draw_set_font(fnt_menu) // definindo a font a ser utilizada

	var _menu_comprimento	= array_length(_menu); // Pegando a quantidade de opções no menu

	var _menu_pos_x			= display_get_gui_width()/2; // Posição X do menu 
	var _menu_pos_y			= display_get_gui_height()/2; // Posição Y do menu
	var _mouse_pos_x		= device_mouse_x_to_gui(0)
	var _mouse_pos_y		= device_mouse_y_to_gui(0)
	var _texto_altu			= string_height("I") + 10; // Altura do texto + uma margem 
	var _menu_altu			= (_texto_altu * _menu_comprimento) / 2; // Posição central do menu
	var _cor				= c_white;
	for(var i = 0; i < _menu_comprimento; i++)
	{
	
		var _text_option	= _menu[i] // peganod os valores de menu
	
		// SELECIONANDO OPÇÃO
		if(sel == i)
		{
			_cor			= c_red;
		}
		else _cor			= c_white
		draw_set_halign(fa_center) // alinhando texto ao centro da tela
		draw_text_color(_menu_pos_x, _menu_pos_y - _menu_altu + (i * _texto_altu), _text_option, _cor, _cor, _cor, _cor, 1) // desenhando menu PRINCIPAL
	
	}
	draw_set_font(-1)
	draw_set_halign(-1)	
}


#endregion
menu_principal		= ["Jogar", "Configurações", "Sair"]; // lista com as opções do menu principal
menu_opcoe			= ["Volume", "Tela Cheia", "Voltar"]; // lista com as opções do menu opções