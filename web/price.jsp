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
    
         <%double emprestimo = Double.parseDouble(request.getParameter("emprestimo"));%>
         <%out.println(emprestimo);%>
     <%double taxa = Double.parseDouble(request.getParameter("taxa"));%>
     <%out.println(taxa);%>
     <%double tempo = Double.parseDouble(request.getParameter("tempo"));%>
     <%out.println(tempo);%>
     <% 
     double p = 0;
     taxa = taxa / 100;
     p = (emprestimo * taxa) / (1 - (1 / Math.pow((1 + taxa), tempo)));
     out.println(p);
     %>
  
    
    

        <footer>
       
<%@include file="WEB-INF/jspf/footer.jspf" %>
</footer>
    </body>
</html>
