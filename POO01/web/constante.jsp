<%-- 
    Document   : pag2
    Created on : 03/03/2020, 16:29:06
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
        <title>Amortização Constante</title>
    </head>
    <body>
         <nav id="menu">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        </nav> 
       
    <center> <h1>Amortização Constante</h1></center>
    <div align="center">
        <p>Neste sistema o saldo devedor é reembolsado em valores de amortização iguais. Desta forma, no sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação. O valor da amortização é calculado, dividindo-se o valor do principal pelo número de períodos de pagamento, ou seja, de parcelas.[1] Por sua vez, os juros são calculados sobre o saldo devedor, multiplicando-se a taxa pelo saldo. Finalmente, a soma da amortização e dos juros resultam no valor da parcela. </p>
  <form>
            <label>Valor empréstimo: </label><br> <input type="text" name="montante"/><br/>
            <label>Taxa juros (em %):</label> <br><input type="text" name="juros"/><br/>
            <label>Parcelas (em meses): </label> <br><input type="text" name="tempo"/><br/><br>
                        <input  type="submit" value="Enviar" />
                        <input type="reset" value="Cancelar" />
        </form><br>


        <% try {%>
            <%--Recebendo Dados--%>
            <%
            double valor = Double.parseDouble(request.getParameter("montante"));          
            double saldodevedor = Double.parseDouble(request.getParameter("montante"));          
            double tempo = Double.parseDouble(request.getParameter("tempo"));
            double taxa = Double.parseDouble(request.getParameter("juros"));

            double parcela;
            double totalparcela = 0;
            double totalamortizacao = 0;
            double totaljuros = 0;
            DecimalFormat df = new DecimalFormat("#,##0.00");
            %>                                     
            <%--Construindo Tabela--%>
            <table border="1">
                <tr>
                <th>#</th>
                <th>Parcela</th>
                <th>Amortizações</th>
                <th>Juros</th>
                <th>Saldo Devedor</th>              
                </tr>

                <%--Populando Tabela              --%>
                
                
                <%for(int i=1; i<=(tempo+1); i++){
                    if (tempo >= i){

                        double amortizacao = valor/tempo; //Amortizações
                        double juros = taxa*saldodevedor/100;//Juros        

                        if (i==1){
                            parcela = amortizacao+((taxa*valor)/100);//1° Mês da parcela}
                        }else{
                            parcela = amortizacao+((taxa*(valor-(i-1)*amortizacao))/100); //2° Mês da parcela
                        } 
                        saldodevedor = saldodevedor - amortizacao; //Saldo Devedor
                        totalparcela = totalparcela + parcela;
                        totalamortizacao = totalamortizacao + amortizacao;
                        totaljuros = totaljuros+juros;
                
                        %>
                        <tr>
                        <td><%=i%></td> <%--Mês--%>   
                        <td><%=df.format((parcela))%></td>
                        <td><%=df.format(amortizacao)%></td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(saldodevedor)%></td>
                    <%}else{%>
                        <tr>
                            <td>>></td>  
                            <td><%=df.format(totalparcela)%></td>
                            <td><%=df.format(totalamortizacao)%></td>
                            <td><%=df.format(totaljuros)%></td>
                            <td><<-TOTAL</td>
                        
                    <%}%>
                <%}%>
                </tr>
            </table>  
        <%} catch (Exception ex) {%>
            <b>Insira todos os dados.</b><br>
        <%}%>
        <br>          
    </div>
        <footer>      
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>

</html>
      
       
       

