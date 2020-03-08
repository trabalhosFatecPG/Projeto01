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
        parcela: 1° Mês = (valor/tempo)+(taxa*valor).
                 2° Mês = (valor/tempo)+(taxa*(valor-1*(valor/tempo)).
                 3° Mês = (valor/tempo)+(taxa*(valor-2*(valor/tempo)).
        Amortizações = (valor/tempo).
        Jurus: Taxa de Jurus.
        Saldo Devedor: Quanto foi Pago - Quanto falta a ser pago.

    ESTRUTURA:
        3 campos para digitar dados.
        1 Botão Para envio do dados.
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
            <%--Inicio FORM--%>
            <form>
                <label>Indique o valor financiado:</label><br>               
                <input type="text" name="montante"/><br><br>    
                <label>Indique a quantidade de prestações:</label><br>
                <input type="text" name="tempo"/><br><br>  
                <label>Indique o jurus:</label><br>
                <input type="text" name="jurus"/><br><br>  
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
                double taxa = Double.parseDouble(request.getParameter("jurus"));
                
                double parecela;
                double vpresente ;
                DecimalFormat df = new DecimalFormat("#,##0.00");
                %>                                     
                <%--Construindo Tabela--%>
                <table border="1">
                    <tr>
                    <th>Mês</th>
                    <th>Parcela</th>
                    <th>Amortizações</th>
                    <th>Juros</th>
                    <th>Saldo Devedor</th>              
                    </tr>

                    <%--Populando Tabela--
F = valor futuro (muitas vezes chamado de M ou "montante")
P = valor presente (muitas vezes chamado de "principal")
n = número de períodos (em dias, meses, anos, ... dependendo do contexto)
i = taxa de juros (normalmente na forma percentual)
J = juros
                    
                    (saldodevedor .(1 + tempo)) / valor
---%>
                    
                     <%for(int i=1; i<=tempo; i++){
                
                double amortizacao = valor/tempo; //Amortizações  
                
                saldodevedor = saldodevedor - amortizacao; //Saldo Devedor
                
                double jurus =((saldodevedor*(1 + tempo))/tempo)-amortizacao;//Jurus        
                if(i<2){
                    parecela = amortizacao+jurus*valor; //1° Mês da parcela
                }else{
                    parecela = amortizacao+jurus*((valor-1)*amortizacao); //2° em diante Mês da parcela
                }
                
                
                     %>
                    <tr>
                    <td><%=df.format(i)%></td> <%--Mês--%>   
                    <td><%=df.format(parecela)%></td>
                    <td><%=df.format(amortizacao)%></td>
                    <td><%=df.format(jurus)%></td>
                    <td><%=df.format(saldodevedor)%></td>
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
