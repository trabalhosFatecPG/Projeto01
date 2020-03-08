<%-- 
    Document   : amortizaçãoconstante.jsp
    Created on : 03/03/2020, 15:57:38
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
        <h1>Amortização Constante</h1>
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
    </body>
</body>
