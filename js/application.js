/**
 * Application Javascript File
 */

function displayMessage(message, title, type, timer){
	$.alert(message, {
		title: title,
		type: type,
		closeTime: timer * 1000
	});
}

function register(_url){

	let _userUri = "Não Logado";
	let _userLogado = getCustomer();

	if(_userLogado){
		_userUri = _userLogado.nome;
	}

	$.ajax({
		url: 'ajax-requisicao.php',
		type : 'get',
		dataType: 'json',
		data: {
		  url: _url,
		  user: _userUri
		}
	  }).done(function (response){    
	  }).fail(function(data, textStatus, xhr) {
	  });
}

(function( $ ) {
	$(function() {
	
		$('.dinheiro').mask("#.##0,00", {reverse: true});
		
		var SPMaskBehavior = function (val) {
			return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
		},
		spOptions = {
			onKeyPress: function(val, e, field, options) {
				field.mask(SPMaskBehavior.apply({}, arguments), options);
			}
		};

		$('.telefone').mask(SPMaskBehavior, spOptions);

	});
})(jQuery);