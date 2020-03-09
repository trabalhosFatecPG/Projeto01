<%-- 
    Document   : index
    Created on : 03/03/2020, 11:03:02
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="Principal.css">
        <%@include file="WEB-INF/jspf/header.jspf" %> 
        <title>Home</title>
    </head>
    <body>
        <nav id="menu">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        </nav>
      
    <center> <h2>Cálculo de amortização</h2></center>
    <center><p>Amortização é um processo de extinção de uma dívida através de pagamentos periódicos, que são realizados em função de um planejamento, de modo que cada prestação corresponde à soma do reembolso do capital ou do pagamento dos juros do saldo devedor, podendo ser o reembolso de ambos, sendo que os juros são sempre calculados sobre o saldo devedor. </p></center>
        <p>A aplicação é capaz de gerar uma tabela de Amortização Constante, tabela de amortização Americana ou uma Trabela Price,uma por vez. Funciona através de formulário e as tabelas são geradas na própria página.</p>
        <center><h2>Integrantes do grupo: </h2></center>
        <center> <h3>Jane Fernanda Martins </h3></center>
        <p>Desing, Tabela Price e Amortização Americana.</p>
        <center><img src="imagem/jane.jpg"></center>
        <center> <h3>Marcos Paulo da Rocha Moura Miúdo </h3></center>
        <p>Home e Amortização Constante.</p>
        <center><img src="imagem/marcos.jpg"></center>   
        
         
     <footer>
       
<%@include file="WEB-INF/jspf/footer.jspf" %>
</footer>
   
       


    </body>

</html>
