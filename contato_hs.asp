<%@LANGUAGE="VBSCRIPT"%> 
<%
'Response.CodePage = 65001
Response.Charset="ISO-8859-1"
'Response.ContentType = "application/json"
 
nome_cliente=request.form("nome")
'empresa=request.form("empresa")
email_cliente=request.form("email")
fonefax_cliente=request.form("fonefax")
mensagem_cliente=request.form("mensagem")
assunto=request.form("assunto")
destino=request.form("destino")
end_obrigado=request.form("redirecionar")

Dim ip_usuario
ip_usuario = Request.ServerVariables("remote_addr")
Dim nome_usuario
nome_usuario = Request.ServerVariables("logon_user")
Set Mail = Server.CreateObject("Persits.MailSender")


Mail.Reset
Mail.Host = "firstclass.jeanpiaget.g12.br" 
Mail.From = "jeanpiaget@jeanpiaget.g12.br" 
Mail.FromName = nome_cliente  
Mail.AddAddress destino 
Mail.Subject = assunto
	mensagem = mensagem & "<html><head><meta charset='ISO-8859-1'/><title>" & assunto & "</title></head><body>"
	mensagem = mensagem & " Nome: <i>" & nome_cliente & vbcrlf & "</i><br>"
if not fonefax_cliente = "" then
	mensagem = mensagem & " Telefone: <i>" & fonefax_cliente & vbcrlf & "</i><br>"
end if
	mensagem = mensagem & " E-mail remetente: <i>" & email_cliente & vbcrlf & "</i><br>"
	mensagem = mensagem & " Assunto: <i>" & assunto & vbcrlf & "</i><br>"
	mensagem = mensagem & " Mensagem: <i>" & mensagem_cliente & vbcrlf & "</i><br>"
	mensagem = mensagem & " IP do remetente: <i>" & ip_usuario & vbcrlf & "</i><br>"
	mensagem = mensagem & " E-mail destinatário: <i>" & destino & vbcrlf & "</i><br>"
	mensagem = mensagem & "</body></html>"
Mail.Body = mensagem
Mail.IsHTML = True

'response.write(mensagem)

On Error Resume Next 

If Err <> 0 Then     
	Set Mail = nothing
	response.write ("<script>alert('Sua mensagem não foi enviada!')</script>")
Else
	Mail.Send 
	response.write(mensagem)
	response.write ("<script>alert('Sua mensagem foi enviada com sucesso!');window.location = '/highschool/';</script>")
	Set Mail = nothing
End If 
Set Mail = nothing

%>
