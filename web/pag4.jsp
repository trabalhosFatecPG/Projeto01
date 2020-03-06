<%-- 
    Document   : pag4
    Created on : 03/03/2020, 17:22:43
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
          <nav id="menu">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        </nav>
    <center> <h1>Tabela Price</h1></center>
    <form action =" pag4.jsp">
        <p>Valor Financiado: </p>
        <input type="number" name="valorFinanciado"/>
        <p>Taxa de juros: </p>
        <input type="number" name="taxaJuros"/>
        <p>Número de prestações: </p>
        <input type="number" name="prestacoes"/>
        <input type="submit" name="calcular" value="Calcular"/>
    </form>
    
        <footer>
       
<%@include file="WEB-INF/jspf/footer.jspf" %>
</footer>
    </body>
</html>
