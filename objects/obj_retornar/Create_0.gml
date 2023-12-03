_retornar					= "Retornar"; // texto a ser mostrado no botão
_posicao_x					= display_get_gui_width()/2; // pegando posição central da tela no eixo X
_posicao_y					= display_get_gui_height()/2;  // pegando posição central da tela no eixo Y
						
desenhar_botao				= function() // função para desenhar o botão na tela
{
	draw_set_valign(fa_middle) // centralizando texto verticalmente
	draw_set_halign(fa_center) // centralizando texto horizontalmente
	var _texto_larg			= string_width(_retornar) * 2; // pegando largura do texto
	var _texto_altu			= string_height(_retornar) * 3; // pegando altura do texto
	var _mouse_pos_x		= device_mouse_x_to_gui(0) // pegando posição x do moouse na tela
	var _mouse_pos_y		= device_mouse_y_to_gui(0)  // pegando posição y do moouse na tela 
	var _pos_tela_mouse		= point_in_rectangle(_mouse_pos_x, _mouse_pos_y, _posicao_x - _texto_larg, _posicao_y, _posicao_x + _texto_larg, _posicao_y + _texto_altu) // pegando posição do mouse na tela
	var _confirm_mouse		= mouse_check_button(mb_left) // checando se apertei o botão esquerdo do mouse
	var _fonfirm_tecl		= keyboard_check_pressed(vk_enter) // cehcando se apertei enter
	if(_pos_tela_mouse) // cehcando se o mouse ta em cima do botão
	{
		
		if(_confirm_mouse) room_goto(rm_menu)	// voltando para tela de menu utilizando mouse
	}
	if(_fonfirm_tecl) room_goto(rm_menu) // voltando para tela de menu utilizando teclado
	draw_set_font(fnt_menu)
	draw_rectangle_color(_posicao_x - _texto_larg, _posicao_y, _posicao_x + _texto_larg, _posicao_y + _texto_altu, c_blue, c_blue, c_blue, c_blue, false)	// desenhando botão
	draw_text_ext_transformed(_posicao_x, _posicao_y, _retornar, 0, _texto_larg, 2, 2, 1) // escrenvendo o texto no botão
	draw_set_font(-1)
	draw_set_valign(-1)
	draw_set_halign(-1)
}