_retornar					= "Retornar";
_posicao_x					= display_get_gui_width()/2;
_posicao_y					= display_get_gui_height()/2;
						
desenhar_botao				= function()
{
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	var _texto_larg			= string_width(_retornar) * 2;
	var _texto_altu			= string_height(_retornar) * 3;
	var _mouse_pos_x		= device_mouse_x_to_gui(0) // pegando posição x do moouse na tela
	var _mouse_pos_y		= device_mouse_y_to_gui(0)  // pegando posição y do moouse na tela 
	var _pos_tela_mouse		= point_in_rectangle(_mouse_pos_x, _mouse_pos_y, _posicao_x - _texto_larg, _posicao_y, _posicao_x + _texto_larg, _posicao_y + _texto_altu)
	var _confirm_mouse		= mouse_check_button(mb_left)
	var _fonfirm_tecl		= keyboard_check_pressed(vk_enter)
	if(_pos_tela_mouse)
	{
		if(_confirm_mouse) room_goto(rm_menu)	
	}
	if(_fonfirm_tecl) room_goto(rm_menu)
	draw_set_font(fnt_menu)
	draw_rectangle_color(_posicao_x - _texto_larg, _posicao_y, _posicao_x + _texto_larg, _posicao_y + _texto_altu, c_blue, c_blue, c_blue, c_blue, false)	
	draw_text_ext_transformed(_posicao_x, _posicao_y, _retornar, 0, _texto_larg, 2, 2, 1)
	draw_set_font(-1)
	draw_set_valign(-1)
	draw_set_halign(-1)
}