<%-- 
    Document   : index
    Created on : 03/03/2020, 11:03:02
    Author     : Marcos Paulo da Rocha Moura Miúdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="C:\Users\Fernanda\Documents\NetBeansProjects\Projeto01\web\Principal.css" rel="stylesheet" type="text/css">
        <title>Home</title>
    </head>
    
    <body>
        <nav id="menu">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        </nav>
        <center><h1><strong>Projeto 001 - Calculo de Amortizações</strong></h1></center>
        <br><br><br>
        
        
        <center> <h3>A aplicação é capaz de gerar uma tabela de Amortização Constante, tabela de amortização Americana ou uma Trabela Price por vez. Funciona através de formulário e as tabelas são geradas na própria pagina.</h3></center>
        <hr>
        <center> <h4>Integrantes:</h4></center>
        <center> <h4>Jane Fernanda - Desing, Tabela Price e Amortização Americana.</h4></center>
        <center> <h4>Marcos Paulo da Rocha Moura Miúdo - Home e Amortização Constante.</h4></center>
        <footer>      
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>

</html>
