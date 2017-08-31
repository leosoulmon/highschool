<%@LANGUAGE="VBSCRIPT"%> 
<!--#include file="../../Connections/formulario_provahighschool.asp" -->
<!--#include file="../../Connections/biblioteca.asp" -->
<!--#include file="../include/adovbs.inc" -->
<!--#include file="../include/functions.asp" -->

<%
Response.Charset="ISO-8859-1"
%>
<%

'VERIFICA O CODIGO DE SEGURANÇA PARA PROSSEGUIR COM O CADASTRO, CASO SEJA INVÁLIDO, RETORNO P/ O FORMULÁRIO
hd_texto = request("hd_texto")
texto_imagem = ucase(request("texto_imagem")) 'Como usamos no array somente letras maiusculas, então passamos tudo o que foi digitado para maiuscula.

if hd_texto <> texto_imagem then

	response.write "<font color=""red"">Código de segurança inválido, tente novamente!</font>"
	response.write "<br><input name=""Submit"" type=""submit"" class=""botao"" value=""Voltar"" onclick=""javascript:history.go(-1);"">"
	response.end

response.End()
end if

'FUNÇÃO PARA GERAR CODIGO ALEATÓRIO

'dim CODIGOALEATORIO
'CODIGOALEATORIO = Gera2(30)

'if (Request("Gera2(30)") <> "") then CODIGOALEATORIO = Request("Gera2(30)") end if

'COLETA DE DADOS DO FORMULÁRIO PARA ARMAZENAR NO BANCO DE DADOS E ENVIAR POR EMAIL

ip_usuario = Request.ServerVariables("remote_addr")

nome 					= ProtectSQL(Ucase(request.form("nome")))
sobrenome               = ProtectSQL(Ucase(request.form("sobrenome")))
nome = nome &" "&sobrenome
dt_nascimento 			= ProtectSQL(Ucase(request.form("dt_nascimento")))
nomeescolaorigem 		= ProtectSQL(Ucase(request.form("nomeescolaorigem")))
'alterações feitas'
outra_escola 		    = ProtectSQL(Ucase(request.form("outra_escola")))
'alterações feitas'
'ano 					= ProtectSQL(Ucase(request.form("ano")))
rg 						= ProtectSQL(Ucase(request.form("cd_rg")))
nomeresponsavel 		= ProtectSQL(Ucase(request.form("nomeresponsavel")))
NomeAlunoJP 			= ProtectSQL(Ucase(request.form("NomeAlunoJP")))
strAlunoJP 				= ProtectSQL(Ucase(request.form("strAlunoJP")))
endereco 				= ProtectSQL(Ucase(request.form("endereco")))
numero                  = ProtectSQL(Ucase(request.form("numero")))
complemento             = ProtectSQL(Ucase(request.form("complemento")))
bairro 					= ProtectSQL(Ucase(request.form("bairro")))
cidade 					= ProtectSQL(Ucase(request.form("cidade")))
cep 					= ProtectSQL(Ucase(request.form("CEP")))
telefone 				= ProtectSQL(Ucase(request.form("telefone")))
celular 				= ProtectSQL(Ucase(request.form("celular")))
'alterações feitas'
'varias dos campos novos campo como_soube e campo soube_como'
como_soube				= ProtectSQL(Ucase(request.form("como_soube")))
soube_outro				= ProtectSQL(Ucase(request.form("digite_como_soube")))
'alterações feitas'
email 					= ProtectSQL(Ucase(request.form("email")))
assunto 				= ProtectSQL(Ucase(request.form("assunto")))
destino 				= ProtectSQL(Ucase(request.form("destino")))
end_obrigado 			= ProtectSQL(Ucase(request.form("redirecionar")))
cd_confirmacao_TESTES 	= ProtectSQL(request.form("cd_confirmacao_TESTES"))
cd_inscricao 			= ProtectSQL(request.form("codigo_inscricao"))

Response.write(cd_confirmacao_TESTES)

'if cd_confirmacao_TESTES = "on" then
'	cd_confirmacao_TESTES = "true"
'	assunto = assunto & " + Aula Preparatória"
'else
'	cd_confirmacao_TESTES = "false"
'end if

if nomeescolaorigem = "1" then
	nomeescolaorigem = outra_escola
end if

if como_soube = "1" then
	como_soube = soube_outro
end if

if cd_confirmacao_TESTES = "1" then
	cd_confirmacao_TESTES = True
else
	cd_confirmacao_TESTES = False
end if

endereco = endereco &" "& numero &" "& complemento

'ARMAZENAMENTO NO BANCO DE DADOS DAS INFORMAÇÕES DO FORMULÁRIO
    Set MM_editCmd = Server.CreateObject("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_formulario_provahighschool_STRING

	MM_dbFields = "nm_aluno,nm_responsavel,dt_nascimento,cd_rg,strAlunoJP,nm_endereco_residencial,nm_bairro,nm_cidade,cd_CEP,cd_telefone,cd_celular,nm_email,dt_postagem,ip_usuario,cd_inscricao,nm_escola_origem,cd_confirmacao_TESTES,comosoube"
	MM_dbValues = "'" & nome & "','" & nomeresponsavel & "','" & dt_nascimento & "','" & rg & "','" & strAlunoJP & "','" & endereco & "','" & bairro & "','" & cidade & "','" & cep & "','" & telefone & "','" & celular & "','" & email & "','" & now() & "','" & ip_usuario & "','" & cd_inscricao & "','" & nomeescolaorigem & "'," & cd_confirmacao_TESTES & ", '" & como_soube & "'"

	MM_editQuery = "insert into candidatos (" & MM_dbFields & ") values (" & MM_dbValues & ")"
    MM_editCmd.CommandText = MM_editQuery
    
   	MM_editCmd.Execute        
    MM_editCmd.ActiveConnection.Close
%>

<html>
<head>
	<title>Comprovante de inscrição - Jean Piaget High School</title> 
	<meta name='viewport' content='width=device-width, initial-scale=1.0'> 
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel='stylesheet' href='/highschool/lib/materialize/css/materialize.min.css' media="screen,print"> 
	<link rel='stylesheet' href='/highschool/css/comprovante.css' media="screen,print"> 
	<link rel='stylesheet' href='/highschool/css/impressao.css' media="print"> 
	<script src='/highschool/lib/materialize/js/materialize.js'></script>
</head>
	<body class="row">
		<main class="col l4 m12 s12 offset-l4">
			<h1 class="tit-comp-hs">
				Comprovante de inscrição - Jean Piaget High School
			</h1>
			<div class="comp-container">
				<p class="light-blue-text text-darken-2" style="margin-top:0px;">
					<i class="material-icons small">check</i>
					<%=nome%> , sua inscrição para a <strong>prova de seleção do Jean Piaget High School</strong> foi concluída com sucesso.
				</p>
				<p>
					RG: <%=rg %>
				</p>
				<p class="bloco">
					Data de nascimento: <%=dt_nascimento %>
				</p>
				<p class="">
					<i class="material-icons small" style="vertical-align: -8px;">chrome_reader_mode</i> <strong>Prova de seleção</strong> 
				</p>
				<p>
					No dia da prova, traga o seu comprovante de inscrição e RG atualizado.
				</p>
				<p>
					Prova: 04/10/2017 - 15h
				</p>
				<p class="bloco">
					Local: Colégio Jean Piaget - Unidade de Ensino Médio. <br>Av. Almirante Cochrane, 136 - Aparecida - Santos.
				</p>

				<% if (cd_confirmacao_TESTES = "True") then %>
					<p>
						<i class="material-icons small"  style="vertical-align: -8px;">border_color</i> <strong>Aula de apoio</strong>
					</p>
					<p class="bloco2">
						Você optou por participar das aulas preparatórias, que acontecerão nos dias 29 de setembro e 03 de outubro, das 15h às 17h. Esperamos por você.
					</p>	
				<% end if %>
				<br>
				<p class="grey-text center">
					Para mais informações, acesse <a href="/highschool/" target="_blank"> www.jeanpiaget.g12.br/highschool</a>.
				</p>
				<!-- <p class="row logo-footer-comp">
					<img src="/highschool/img/logo_hs289x34.jpg" class="logo-hs-comp col l6 m12 s12 push-l1 center" style="min-width:289px;">
					<img src="/highschool/img/logo_jp144x81.jpg" class="logo-jp-comp col l3 m12 s12 push-l2 center" style="min-width:144px;">
				</p> -->
			</div>
			<p class="row center">
				<button class="btn waves-effect waves-light white-text grey" type="submit" name="action" onClick='window.print()'>
					<i class="material-icons left">print</i> Imprimir 
				</button>
			</p>
		</main>
	</body>
</html>