<script type="text/javascript">
jQuery(function($){
   $("#cep").change(function(){
      var cep_code = $(this).val();
      if( cep_code.length <= 0 ) return;
      $.get("http://apps.widenet.com.br/busca-cep/api/cep.json", { code: cep_code },
         function(result){
            if( result.status!=1 ){
               alert(result.message || "Houve um erro desconhecido");
               return;
            }
            $("input#cep").val( result.code );
            $("input#cidade").val( result.city );
            $("input#bairro").val( result.district );
            $("input#endereco").val( result.address );
         });
   });
});
</script>
<h2 class="tit_pagina">Inscrição para prova</h2>
<form action="/scripts/contato_provahighschool.asp" method="post" id="form_inscricao" class="form_inscricao" name="form2" accept-charset="ISO-8859-1">
        <p>
          <label>
            <strong><span>Nome:</span></strong> <input type="text" name="nome" class="nome campo" id="nome" placeholder="Digite seu nome">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Sobrenome:</span></strong> <input type="text" name="sobrenome" class="campo" id="sobrenome" placeholder="Digite seu sobrenome">
          </label>
        </p>
        <p>
          <label>
            <strong><span>RG:</span></strong> <input type="text" name="cd_rg" class="campo" id="cd_rg" placeholder="Digite seu RG">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Data de nascimento:</span></strong>
            <input type="text" name="dt_nascimento" class="campo dt_nascimento" id="dt_nascimento" placeholder="Digite sua data de nascimento">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Email:</span></strong> <input type="email" name="email" class="campo" id="email" placeholder="Digite seu email">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Nome do responsável:</span></strong>
              <input type="text" name="nm_responsavel" class="campo" id="nm_responsavel" placeholder="Digite seu responsável">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Nome da escola:</span></strong>
            <!--#include file="escola.asp"-->
          </label>
        </p>
        <p class="qual_escola" id="qual_escola" style="display:none;">
          <label>
            <strong><span>Qual escola?</span></strong>
            <input type="text" name="outra_escola" class="campo" id="outra_escola" placeholder="Digite qual escola">
          </label>
        </p>
        <p>
          <label>
            <strong><span>CEP:</span></strong>
            <input type="text" name="cep" class="campo infos_aluno" id="cep" placeholder="Digite seu CEP">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Endereço:</span></strong>
            <input type="text" name="endereco" id="endereco" class="campo infos_aluno" placeholder="Digite seu endereço">
          </label>
        </p>
        <p class="contem_endereco"> 
          <label>
            <strong><span>Nº:</span></strong>
            <input type="number" name="numero" id="numero" class="campo infos_aluno" placeholder="Digite o número" min="0">
          </label>
          <label>
            <strong><span>Complemento:</span></strong>
            <input type="text" name="complemento" id="complemento" class="campo infos_aluno" placeholder="Complemento">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Bairro:</span></strong>
            <input type="text" name="bairro" class="campo infos_aluno" id="bairro" placeholder="Digite seu bairro">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Cidade:</span></strong>
            <input type="text" name="cidade" class="campo infos_aluno" id="cidade" placeholder="Digite sua cidade">
          </label>
        </p>
        <p>
          <label>
            <strong><span>Telefone:</span></strong>
            <input type="text" name="telefone" class="campo infos_aluno" id="telefone" placeholder="Digite seu telefone" maxlength="11">
          </label>
        </p>
        <p>
          <label><strong><span>Como soube do concurso:</span></strong>
            <select name="como_soube" id="como_soube" class="campo como_soube" placeholder="Informe como soube" required>
              <option value="0">Escolha uma opção</option>
              <option value="Indicação">Indicação</option>
              <option value="Jornal ou Revista">Jornal ou revista</option> 
              <option value="Radio">Rádio</option>
              <option value="Redes Sociais">Redes sociais</option>
              <option value="Site da Instituição">Site da instituição</option>
              <option value="1">Outros</option> 
            </select>
          </label>
        </p>

        <p class="qual_meio" id="qual_meio" style="display:none;">
          <label>
            <span>Qual?</span>
            <input type="text" name="digite_como_soube" class="campo" id="digite_como_soube" placeholder="Informe como soube da prova de seleção">
          </label>
        </p>

        <p>
          <label style="cursor:pointer;">
            <input name="cd_confirmacao_TESTES" class="pointer concordo" type="checkbox" value="1" style="margin-right:5px;"> <strong>Quero participar das aulas preparatórias.
            <small>Quando? 19/10 e 21/10 - das 15h às 17h.</small></strong>
          </label>
        </p>
    <input name="assunto" type="hidden" value="Inscrição - Prova High School">
    <input name="destino" type="hidden" value="leonardosouza@jeanpiaget.g12.br">
    <input name="redirecionar" type="hidden" value="/highschool2015/inscricoes-ok.asp">
    <input name="Submit" type="submit" class="botao" value="Enviar"><br>
</form>  