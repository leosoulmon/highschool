<!--#include file="header.asp"-->


<main class="conteudo">
  
	 <%
      agora = CDate(Now())
      encerramento = "07/07/2017 08:00"
      data_abertura = "03/07/2017 00:00"
      aberto = DateDiff("s", encerramento, agora)
      'response.write(aberto)
      if DateDiff("s", encerramento, agora) >= 0 then  
    %>
      <h2 class="tit_pagina">Inscrições encerradas</h2>
      <p>As inscrições do exame de seleção para o Jean Piaget High School estão encerradas.</p>  

    <%else%>         

      <!--#include file="formulario.asp"-->

    <% end if %>
    
</main>


<!--#include file="footer.asp"-->