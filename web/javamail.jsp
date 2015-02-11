<%@ page import = "java.util.Properties, javax.mail.*, javax.mail.internet.*, javax.activation.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
try {
String to = request.getParameter("para");
String from = request.getParameter("de");
Properties props = new Properties();
props.put("mail.smtp.from", "luciano_turrini@yahoo.com.br"); 
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.mail.yahoo.com");
props.put("mail.smtp.port", "587");
 
Session sessao = Session.getInstance(props,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("luciano_turrini@yahoo.com.br", "luqazwsxcdevfr");
			}
		  });
sessao.setDebug(true);
 
MimeMessage message = new MimeMessage(sessao);
message.setFrom(new InternetAddress(from));
 
Address toAddress = new InternetAddress(to);
message.addRecipient(Message.RecipientType.TO, toAddress);
message.setSubject(request.getParameter("assunto"));
 
BodyPart corpoPartes = new MimeBodyPart();
corpoPartes.setText(request.getParameter("comenta"));
 
Multipart variasPartes = new MimeMultipart();
variasPartes.addBodyPart(corpoPartes);
 
message.setContent(variasPartes);
Transport.send(message);
out.println("Compra Realizada com Sucesso! Seu pedido esta sendo Enviado!");
}
catch (MessagingException e) {
out.println("Email nao pode ser enviado! " + e.getMessage());
}
%>