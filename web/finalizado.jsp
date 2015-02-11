<%@page language = "java" %>
<html>
<head>
<title>Teste de envio de e-mails !</title>
</head>
<body>
    <h1>Por favor, Entre com e-mail para confirmação!</h1>
<form action="javamail.jsp" method="post">
<p>
<input type="hidden" name="de" value="entrega@booksu4.com.br" size="45">
</p>
 
<p>E-mail destinatário:
<input type="text" name="para" size="45">
</p>
 
<p>
<input type="hidden" name="assunto" value="Envio de Produto" size="45">
</p>
 
<p>
<input type="hidden" value="Pedido finalizado. Seu produto est? sendo enviado para o endere?o de Cadastro!" name="comenta">
</p>
 
<p>&nbsp; </p>
 
<p>
<input type="submit" name="Submit" value="Enviar">
</html>