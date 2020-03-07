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
        <link href="C:\Users\Fernanda\Documents\NetBeansProjects\Projeto01\web\Principal.css" rel="stylesheet" type="text/css">
        
        <title>Home</title>
    </head>
    <body>
        <nav id="menu">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        </nav>
    
        
        
    <center> <h1>Oi sou home</h1></center>
                <center> <h2>Tabela Price</h2></center>
    <form action =" price.jsp">
        <p>Valor Financiado: </p>
        <input type="number" name="emprestimo"/>     
        <p>Taxa de juros: </p>
        <input type="number" name="taxa"/>      
        <p>Número de prestações: </p>
        <input type="number" name="tempo"/>            
        <input type="submit" name="calcular" value="Calcular"/>
    </form>
       
   
     <footer>
       
<%@include file="WEB-INF/jspf/footer.jspf" %>
</footer>
   
       


    </body>

</html>
