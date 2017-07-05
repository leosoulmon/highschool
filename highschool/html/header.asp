<!--#include file="../../../Connections/formulario_diadafamilia.asp" -->
<!--#include file="../../../Connections/biblioteca.asp" -->
<!--#include file="../../scripts/contato_diadafamilia_verifica_vagas.asp" -->
<!--#include file="../../include/adovbs.inc" -->
<!--#include file="../../include/functions.asp" -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<title>Prova de Seleção - High School &raquo; Colégio Jean Piaget - Santos - São Paulo</title>
	<link href="/highschool/css/estilo_novo.css" rel="stylesheet">
	<link href="/highschool/css/estilo_responsivo.css" rel="stylesheet">
  	<script src="/inc/js/jquery.js"></script>
  	<script src="/highschool/js/mascara.js"></script>
  	<script src="/highschool/js/valida.js"></script>
  	<script src="/highschool/js/banner.js"></script>
	<script>
		function Monta(){
			var texto_seguranca = "<%= codigo_seguranca %>"; 
			var comeco = "<img class='img_cap' src='/highschool2017/img/cap/"; //Abre a tag da imagem
			var meio = ".jpg'"; //propriedades da imagem, aqui tambem pode ser configurado o tamanho/altura
			var fim = " style='width:25px;height:auto;'> "; //Fecha a tag da imagem
			for(x = 0; x < texto_seguranca.length; x ++){
				p_texto = texto_seguranca.charAt(x); //Pega caracter por caracter para formar a imagem de cada um
				document.getElementById("resultado").innerHTML += comeco + p_texto + meio + p_texto + fim; //Junta as tags da imagem
			}
		}
	</script>
</head>
<header>
	<figure class="contem_logo">
		<a href="/highschool/html/"><img src="../img/logo_hs.png" class="logo_jp"></a>
	</figure>
	<!--#include file="menu.asp"-->
</header>	
<body class="align" onLoad="Monta()">
<!-- <h1 alt="Jean Piaget High School - Prova de seleção">Jean Piaget High School - Prova de seleção</h1> -->