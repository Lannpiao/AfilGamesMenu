// INICIANDO VARIÁVEIS

sel				= 0; // valor selecionado no menu
menu_pagina		= 0;




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
	var _confirma			= keyboard_check_pressed(vk_enter);
	for(var i = 0; i < _menu_comprimento; i++)
	{
	
		var _text_option	= _menu[i][0] // peganod os valores de menu
	
		// SELECIONANDO OPÇÃO
		if(sel == i)
		{
			_cor			= c_red;
		}
		else _cor			= c_white
		
		// confirmando opção selecionada
		if(_confirma)
		{
			switch(_menu[sel][1]) // checa qual opção estou selecionado e pega a acção dessa opção
			{
				case 0: _menu[sel][2]() // rodando o método da primeira opção
				case 1: _menu[sel][2]() // rodando o método da primeira opção
				
			}
		}
		draw_set_halign(fa_center) // alinhando texto ao centro da tela
		draw_text_color(_menu_pos_x, _menu_pos_y - _menu_altu + (i * _texto_altu), _text_option, _cor, _cor, _cor, _cor, 1) // desenhando menu PRINCIPAL
	
	}
	draw_set_font(-1)
	draw_set_halign(-1)	
}

iniciar_jogo			= function() // função que inicia o jogo
{
	room_goto(rm_gameplay) // INDO PARA A SALA GAMEPLAY
}

fechar_jogo			= function()
{
	show_message("close")
}

#endregion
menu_principal		=	[

						["Iniciar", MENU_ACAO.CHAMA_METODO, iniciar_jogo], // Opção Iniciar do menu, chamamos o metodo para selecionar a opção certa na função cria_menu() e teclado() -- inicia o jogo
						["Opções", MENU_ACAO.CHAMA_MENU, MENU_LISTA.MENU_OPCOES], // Opção Opções do menu, chamamos o metodo para selecionar a opção certa na função cria_menu() e teclado() -- chama o menu opções
						["Sair", MENU_ACAO.CHAMA_METODO, fechar_jogo] // Opção Sair do menu, chamamos o metodo para selecionar a opção certa na função cria_menu() e teclado() -- fecha o jogo
					
];
menu_opcoes			=	[

						["Volume", MENU_ACAO.CHAMA_METODO, iniciar_jogo], // Opção Iniciar do menu, chamamos o metodo para selecionar a opção certa na função cria_menu() e teclado() -- inicia o jogo
						["Tela Cheia", MENU_ACAO.CHAMA_MENU, MENU_LISTA.MENU_OPCOES], // Opção Opções do menu, chamamos o metodo para selecionar a opção certa na função cria_menu() e teclado() -- chama o menu opções
						["Voltar", MENU_ACAO.CHAMA_MENU, MENU_LISTA.MENU_PRINCIPAL] // Opção Sair do menu, chamamos o metodo para selecionar a opção certa na função cria_menu() e teclado() -- fecha o jogo
					
];


menus				= [menu_principal, menu_opcoes]