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
        <p>
<%double emprestimo = Double.parseDouble(request.getParameter("emprestimo"));%>
<%double taxa = Double.parseDouble(request.getParameter("taxa"));%>
<%double tempo = Double.parseDouble(request.getParameter("tempo"));%>


<%taxa = taxa / 100;%>
<%double p= (emprestimo * taxa) / (1 -(1 / Math.pow((1 + taxa) , tempo)));%>
<%out.println("valor parcela: "+ p);%>
<%double K = p / emprestimo;
			 taxa = 0.00001;
                         double CT = 0;
			 if (K>CT)
			 {
			   while (K > CT)
			   { 
				   taxa = taxa + 0.00001;
				   CT = (taxa * Math.pow((1 + taxa),tempo)) / (Math.pow((1 + taxa),tempo)-1);				 
               }
             }
			 else
			  {
                  while (CT > K)
			   { 
				  taxa = taxa + 0.00001;
				   CT = (taxa * Math.pow((1 + taxa),tempo)) / (Math.pow((1 + taxa),tempo)-1); 
               }
			  }
			   taxa = taxa * 100;
out.println(CT);%>

        </p>

        <footer>
       
<%@include file="WEB-INF/jspf/footer.jspf" %>
</footer>
    </body>
</html>
