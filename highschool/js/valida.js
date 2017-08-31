function limparRG(){
  var passo1 = 0;
  var passo2 = 0;
  var palavra = "";
  var compara = "-";
  var compara2 = ".";
  var resultado_teste = 0;
  var resultado_teste2 = 0;
  var str = document.getElementById('cd_rg').value;
  var tamanho_str = str.length; 
  while(passo2 < tamanho_str){
    var caminho = str.substr(passo2, 1);
    passo2++;
    resultado_teste = caminho.localeCompare(compara);
    resultado_teste2 = caminho.localeCompare(compara2);
    if(resultado_teste != 0 && resultado_teste2 != 0){
      palavra += str.substr(passo1, 1);
    };
    passo1++;
  };
  $("#cd_rg").val(palavra);
};

function organiza_menu(){
  var largura = $(window).width();
  if(largura > 1155){
    $(".menu").css("display","inline-block");
  }else{
    $(".menu").css("display","none");
  }
}

$(function(){

  $('.dt_nascimento').mask("99/99/9999");

  function gup( name, url ) {
    if (!url) url = location.href;
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( url );
    return results == null ? null : results[1];
  }
  var pagina = window.location;
  pagina = gup('id', pagina);

  if (pagina == 7) {
    limparRG();
  };
  
  var dados = [$("#nome"),$("#sobrenome"),$("#dt_nascimento"),$("#cd_rg"),$("#email"),$("#nm_responsavel"),$("#endereco"),$("#numero"),$("#bairro"),$("cidade"),$("#cep"),$("#telefone"),$("#aula_prep"),$("#texto_imagem"),$("#outra_escola"),$("#digite_como_soube")];

  for(var i in dados){
    dados[i].val("");
    $("#escola").val("0");
    $("#como_soube").val("0");
    $("#concordo").val();
  };

  $(window).resize(function(){
    organiza_menu();
  });

  $("#como_soube").change(function(){
    var como_soube = $("#como_soube").val()
    if(como_soube == "1"){
      $("#qual_meio").slideDown();
    }else{
      $("#qual_meio").slideUp();
      $("#digite_como_soube").val("");
    }
  });

  $("#escola").change(function(){
    var escola = $("#escola").val();
    if(escola == "1"){
      $("#qual_escola").slideDown();
    }else{
      $("#qual_escola").slideUp();
      $("#outra_escola").val("");
    }
  });

  $("#form_inscricao").submit(function(){
    limparRG();
    //var dados = [$("#nome"),$("#sobrenome"),$("#cd_rg"),$("#dt_nascimento"),$("#email"),$("#nm_responsavel"),$("#endereco"),$("#numero"),$("#bairro"),$("#cidade"),$("#cep"),$("#telefone"),$("#aula_prep"),$("#texto_imagem"),$("#concordo")];   

    if($("#nome").val() == ""){
      alert($("#nome").attr("placeholder"));
      return false;
    }else if($("#sobrenome").val() == ""){
      alert($("#sobrenome").attr("placeholder"));
      return false;
    }else if($("#cd_rg").val() == ""){
      alert($("#cd_rg").attr("placeholder"));
      return false;
    }else if($("#dt_nascimento").val() == ""){
      alert($("#dt_nascimento").attr("placeholder"));
      return false;
    }else if($("#email").val() == ""){
      alert($("#email").attr("placeholder"));
      return false;
    }else if($("#nm_responsavel").val() == ""){
      alert($("#nm_responsavel").attr("placeholder"));
      return false;
     }else if($("#escola").val() == 0){
      alert($("#escola").attr("placeholder")); //escola
      return false;
    }else if($("#escola").val() == 1 && $("#outra_escola").val() == ""){
      alert($("#outra_escola").attr("placeholder"));
      return false;
    }else if($("#endereco").val() == ""){
      alert($("#endereco").attr("placeholder"));
      return false;
    }else if($("#numero").val() == ""){
      alert($("#numero").attr("placeholder"));
      return false;
    }else if($("#bairro").val() == ""){
      alert($("#bairro").attr("placeholder"));
      return false;
    }else if($("#cidade").val() == ""){
      alert($("#cidade").attr("placeholder"));
      return false;
    }else if($("#cep").val() == ""){
      alert($("#cep").attr("placeholder"));
      return false;
    }else if($("#telefone").val() == ""){
      alert($("#telefone").attr("placeholder"));
      return false;
    }else if($("#como_soube").val() == 0){
      alert($("#como_soube").attr("placeholder"));
      return false;
    }else if($("#como_soube").val() == 1 && $("#digite_como_soube").val() == ""){
      alert($("#digite_como_soube").attr("placeholder"));
      return false;
    }else if($("#aula_prep").val() == ""){
      alert($("#aula_prep").attr("placeholder"));
      return false;
    }else if($("#texto_imagem").val() == ""){
      alert($("#texto_imagem").attr("placeholder"));
      return false;
    }else if($("#concordo").val() == ""){
      alert($("#concordo").attr("placeholder"));
      return false;
    }
    

    // for(var i in dados){
    //   if (dados[i].val() == ""){
    //     alert(dados[i].attr("placeholder"));
    //     return false;
    //   };
    // };

    // var escola = $("#escola");
    // var outra_escola = $("#outra_escola");
    // var como_soube = $("#como_soube");
    // var soube = $("#digite_como_soube");
    
    // if(escola.val() == 0){
    //   alert(escola.attr("placeholder"));
    //   return false;
    // }else if(escola.val() == 1 && outra_escola.val() == ""){
    //   alert(outra_escola.attr("placeholder"));
    //   return false;
    // };

    if(como_soube.val() == 0){
      alert(como_soube.attr("placeholder"));
      return false;
    }else if(como_soube.val() == 1 && soube.val() == ""){
      alert(soube.attr("placeholder"));
      return false;
    };

    return true;
  });

  $("#formulario-contato").submit(function(){
    var nome = $("#nome").val();
    var email = $("#email").val();
    var telefone = $("#telefone").val();
    var mensagem = $("#mensagem").val();
    var qtdmsg = mensagem.length;
    if(nome == ""){
    alert("Digite o seu nome.");
    return false;
    }else{
        if(email == ""){
            alert("Digite o email.");
            return false;
        }else{
            if(telefone == ""){
                alert("Digite seu Telefone.");
                return false;
            }else{
                if(mensagem == "" || qtdmsg < 2){
                    alert("Digite sua mensagem.");
                    return false
                }
            }
        }
    }
    return true
  });

});
    

