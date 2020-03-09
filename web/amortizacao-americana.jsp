<%-- 
    Document   : amortizaçãoamericana.jsp
    Created on : 08/03/2020, 19:38:23
    Author     : Marcos Paulo da Rocha Moura Miúdo
------------------------------------------------------------------------------------------------
    REGRA DE NEGÓCIO:
        O usuario deve entrar com 3 valores (Valor Financiado, Total das Parcelas e Jurus)
    e deve sair na mesma pagina uma tabela.

    CALCULO:
        Tabela de 5 setores (Mês, Parcela, Amortizações,Jurus,Saldo Devedor).
        Mês: Mês da Percela.
        parcela:amortização+(taxa de juros sob o mes*valor total)
        Amortizações = valor total/tempo estipulado.
        Juros: Taxa de juros sob o mês.
        Saldo Devedor: O quanto foi Pago-Quanto falta a ser pago.

    ESTRUTURA:
        3 campos para digitar dados.
        1 Botão para envio do dados.
        1 Botão para limpar do dados.
        Criação da tabela com estrutura HTML.
        Popular a tabela com laço de repetição.
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
    </head>
    <body>
        <%-- Include do menu jspf --%> 
        <nav id="menu">
            <%@include file="WEB-INF/jspf/menu.jspf" %>
        </nav> 
        <div align="center">
        <h1>Amortização Americana</h1>
        <%--Inicio do FORM--%>
        <form>
            <label>Indique o valor financiado:</label><br>               
            <input type="text" name="montante"/><br><br>    
            <label>Indique a quantidade de prestações:</label><br>
            <input type="text" name="tempo"/><br><br>  
            <label>Indique o juros (mensal):</label><br>
            <input type="text" name="juros"/><br><br>  
            <br>
            <input type="submit" name="calcular" value="Calcular Amortização Constante"/><br><br>
            <input type="reset" name="cancelar" value="Cancelar" />
            <hr>
        </form> 


        <% try {%>
            <%--Recebendo Dados--%>
            <%
            double saldodevedor = Double.parseDouble(request.getParameter("montante"));          
            double tempo = Double.parseDouble(request.getParameter("tempo"));
            double taxa = Double.parseDouble(request.getParameter("juros"));

            
            double juros = taxa*saldodevedor/100;
            double prestacao = juros;
            double amortizacao = saldodevedor;
            DecimalFormat df = new DecimalFormat("#,##0.00");
            %>                                     
            <%--Construindo Tabela--%>
            <table border="1">
                <tr>
                <th>Mês</th>
                <th>Saldo Devedor</th>
                <th>Amortizações</th>
                <th>Juros</th>
                <th>Prestação</th>              
                </tr>

                <%--Populando Tabela              --%>
                
                
                <%for(int i=0; i<=(tempo+1); i++){
                    if (i == 0){%>     
                        <tr>
                        <td><%=i%></td>   
                        <td><%=df.format(saldodevedor)%></td>
                        <td>-</td>
                        <td>-</td
                <%}else if(i>=1/0 & i<=(tempo-1)){%>
                        <tr>
                        <td><%=i%></td>  
                        <td><%=df.format(saldodevedor)%></td>
                        <td>-</td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(prestacao)%></td>    
                <%}else if (i==tempo){%>
                       <tr>
                        <td><%=i%></td> 
                        <td>-</td>
                        <td><%=df.format(amortizacao)%></td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(prestacao+juros)%></td>
                <%}else{%>
                        <tr>
                        <td>Total</td> <%--Mês--%>   
                        <td></td>
                        <td><%=df.format(amortizacao)%></td>
                        <td><%=df.format(juros*(tempo-1))%></td>
                        <td><%=df.format(prestacao+juros)%></td>        
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

