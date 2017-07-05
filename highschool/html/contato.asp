<!--#include file="header.asp"-->
	<main class="conteudo">

		<h2 class="tit_pagina">Contato</h2>

		<p>Preencha o formulário abaixo.</p>
		<br>
		<form id="formulario-contato" class="formulario-contato" action="/scripts/contato_hs.asp" method="post" name="form1">

		    <p>
		    	<label>
		    		<strong><span>Nome:</span></strong>    
		    		<input type="text" name="nome" id="nome" class="campo" placeholder="Digite seu nome">
		    	</label>
		    </p>
		    <p>
		    	<label>
		    		<strong><span>E-mail: </span></strong>		
		    		<input type="email" name="email" id="email" class="campo" placeholder="Digite seu email">
		    	</label> 
		    </p>
		    <p>
		    	<label>
		    		<strong><span>Telefone:</span></strong>
		    		<input type="number" name="fonefax" id="telefone" class="campo" placeholder="Digite seu telefone" maxlength="11">
		    	</label>
		    </p>
		    <p>
		    	<label>
		    		<strong><span>Mensagem:</span></strong>
		    		<textarea id="mensagem" name="mensagem" class="campo" rows="9" ></textarea>
	    		</label>
		    </p>

		    <input name="assunto" type="hidden" value="Formulario de Contato -  Colegio Jean Piaget">
            <input name="destino" type="hidden" value="jeanpiaget@jeanpiaget.g12.br">
		    <input name="enviar" type="submit" class="botao" value=Enviar />                 
		</form>
	</main>

<!--#include file="footer.asp"-->