<%-- 
    Document   : pag4
    Created on : 03/03/2020, 17:22:43
    Author     : Fernanda
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="Principal.css">
         <%@include file="WEB-INF/jspf/header.jspf" %>

       <title>Tabela Price</title>
        <%
            double pmt = 0;
            double juros = 0;
            double val = 0;
        %>     
    </head>
    <body>
        <%-- Include do menu jspf --%> 
        <nav id="menu">
            <%@include file="WEB-INF/jspf/menu.jspf" %>
        </nav> 

         <div align="center">
        <h1>Tabela Price</h1>
        <p>Tabela Price, também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações</p>
        <p>(ou parcelas) iguais.</p>
        <p>A tabela Price usa o regime de juros compostos para calcular o valor das parcelas de um empréstimo e, dessa parcela, há uma proporção relativa ao pagamento de juros e amortização do valor emprestado. </p>
        <div>
        <form>
            <label>Valor empréstimo: </label><br>
        <input type="text" name="PV"/><br>
        <label>Taxa juros (em %): </label> <br>      
        <input type="text" name="i"/><br>        
        <label>Parcelas (em meses): </label> <br>       
        <input type="text" name="n"/></br>
<br />
                   
                        <input type="submit" value="Enviar" />
                        <input type="reset" value="Cancelar" />
                        
        </form>
                <br>

            
            <% try{ %>
            <%   
                double PV = Double.parseDouble(request.getParameter("PV"));
                double i = Double.parseDouble(request.getParameter("i")) / 100 ;
                int n = Integer.parseInt(request.getParameter("n")); %>
            <div>
            <table border="1">
            <tr><th colspan="1">Periodo (Meses)</th><th>Saldo(R$)</th><th>Parcela(R$)</th><th>Juros(R$)</th><th>Prestação(R$)</th></tr>
           <%
                      val = PV;
                      pmt = PV /((1- Math.pow((1+i),-n))/i );
                      
                      for(int count =1; count <= n; count++){ 
                        juros = val * i ;
                        val = val -  ( pmt - juros);
                        
                      DecimalFormat df = new DecimalFormat("#,##0.00");
            %>
                
            
             <tr><th><%= count %></th><td><%=  df.format(val) %></td><td><%= df.format( pmt)  %></td><td><%=  df.format(juros) %></td><td><%=  df.format(pmt - juros) %></td></tr>
          <% }%> 
            <%-- </tbody> --%>

              </table>
        <%}catch(Exception ex){%>
        <b>Insira todos os dados.</b><br>
        <%}%>
        <br>
        </div>
        <%-- Include do rodapé --%>
          <footer>

                    <%@include file="WEB-INF/jspf/footer.jspf" %>
                </footer>

    </body>
</html>