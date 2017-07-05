$(function(){

	  		//navegação automatica do banner (sliding) 

	  		var limiteSlides = $(".banner > img").length;
	  		var segundos = 5000;
	  		var num = 1;
	  		$(".s"+num).css("background","#f1b518");
			$(".s"+num).css("border-color","white");
	  		$(".slide"+num).stop().fadeIn();

	  		function mudaSlide(){
	  			$(".slide"+num).stop().fadeOut(100,function(){
	  				if(num == limiteSlides){
	  					$(".indice_slide").css("background","#ccc");
		  				$(".indice_slide").css("border-color","white");
	  					num = 1;
	  					$(".s"+num).css("background","#f1b518");
		  				$(".s"+num).css("border-color","white");
	  					$(".slide"+num).stop().fadeIn();
		  			}else{
		  				$(".s"+num).css("background","#ccc");
		  				$(".s"+num).css("border-color","white");
		  				num++;
		  				$(".s"+num).css("background","#f1b518");
		  				$(".s"+num).css("border-color","white");
		  				$(".slide"+num).stop().fadeIn();
		  			}
	  			});
	  		}

	  		var tempo = setInterval(mudaSlide, segundos);

	  		function voltaSlide(){
	  			$(".slide"+num).stop().fadeOut(100,function(){
	  				if(num < 2){
	  					$(".indice_slide").css("background","black");
		  				$(".indice_slide").css("border-color","#f1b518");
	  					num = 5;
	  					$(".s"+num).css("background","#f1b518");
		  				$(".s"+num).css("border-color","white");
	  					$(".slide"+num).stop().fadeIn();
		  			}else{
		  				$(".s"+num).css("background","black");
		  				$(".s"+num).css("border-color","#f1b518");
		  				num--;
		  				$(".s"+num).css("background","#f1b518");
		  				$(".s"+num).css("border-color","white");
		  				$(".slide"+num).stop().fadeIn();
		  			}
	  			});
	  		}

	  		//menu de indices do banner

	  		$(".indice_slide").click(function(){
	  			var id = this.id;
	  			if(id == "a"){
					indicar_slide(1);
	  			}else if(id == "b"){
					indicar_slide(2);
	  			}else if(id == "c"){
					indicar_slide(3);
	  			}else if(id == "d"){
					indicar_slide(4);
				}else if(id == "e"){
					indicar_slide(5);
	  			}else{
	  				alert("nenhum slide selecionado")
	  			};
	  		});

	  		function indicar_slide(id){
	  			$(".slide"+num).stop().fadeOut(100,function(){
	  				$(".indice_slide").css("background","black");
					$(".indice_slide").css("border-color","#f1b518");
	  				$(".s"+num).css("background","#f1b518");
					$(".s"+num).css("border-color","white");
	  				$(".slide"+id).stop().fadeIn();
	  				clearInterval(tempo);
	  				tempo = setInterval(mudaSlide, segundos);
	  			});
	  			num = id;
	  		};

	  		//setas de navegação do banner

	  		$(".proximo").click(function(){
	  			mudaSlide();
	  		});

	  		$(".anterior").click(function(){
	  			voltaSlide();
	  		});

	  		//botao do menu mobile
	  		
	  		$(".bt_menu").click(function(){
	  			$(".menu").stop().slideToggle()
	  		})


	  	});