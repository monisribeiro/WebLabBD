
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.SubdominioBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/resultadoCss.css"> 
        <title>Resultados Subdomínio</title>
        <link rel="shortcut icon" type="image/x-icon" href="imagens/icon.ico">
        <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
        
        <script>
            function verificaForm()
            {
                if ($.trim($("#inputNome").val()).length == 0)
                {
                    alert("Por favor, preencha o campo \"Nome do subdominio\".");
                    return false;
                }
                return true;
            }
            /*function enviaConsulta() 
            {
                var inputNome = $("#inputNome").val();
                var mesDesejado = $("#selectMes").val();
                
            }*/

           /* $(document).ready(function()
            {
            });*/
        </script>

    </head>
    <body>
        <article id="corpo">
            <header>
                <img id="logo" src="imagens/logo.png"/>
                <form name="buscaSub" method="get" onsubmit="return verificaForm()" action="buscaSubdominio"> <!--!--> 
                    <div id="buscaDom">
                        <input class="inputBusca" name="inputNome" id = "inputNome" size="62" placeholder="Nome do Subdomínio" autofocus="on" title="Selecione o subdominio desejado."/>
                        <select name="mes" id="selectMes" title="Selecione o mês que deseja ver">
                            <optgroup  label="Meses">
                                <option value=1 class="option">Janeiro</option>
                                <option value=2 class="option">Fevereiro</option>
                                <option value=3 class="option">Março</option>
                                <option value=4 class="option">Abril</option>
                                <option value=5 class="option">Maio</option>
                                <option value=6 class="option">Junho</option>
                                <option value=7 class="option">Julho</option>
                                <option value=8 class="option">Agosto</option>
                                <option value=9 class="option">Setembro</option>
                                <option value=10 class="option">Outubro</option>
                                <option value=11 class="option">Novembro</option>
                                <option value=12 class="option">Dezembro</option>
                            </optgroup>
                        </select>
                        <button id="btPesquisa"  type="submit"><img id="lupa" src="imagens/search-icon.png" /></button>
                    </div>
                </form>
            </header>
            <div id="caminho">
                <a href="index.jsp">Ínicio</a>> <a href="paginas/buscaSub.jsp">Busca por Subdomínio</a>>
            </div>
            
            
            <a href="index.jsp">
                 <button id="voltarBt">
                    <img id="voltar" src="imagens/home.png"/>
                    Home
                 </button>
            </a>

            <div id="resultados">
                <%
                        DecimalFormat df = new DecimalFormat("#.00");
                        df.setMaximumFractionDigits(2);
                        ArrayList<SubdominioBean> s_list = (ArrayList<SubdominioBean>)request.getAttribute("s_list");
                        //System.out.println("oobaa"+users.isEmpty());
                        if(s_list.isEmpty()) {
                %>
                            <div id="noresults">
                                <p>Nenhum resultado para exibir <b style="color: green">:(</b></p>
                                <p>Tente uma nova consulta</p>
                            </div>
                <%
                          } else {
                %>
                        <table>
                            <tr>
                                <th>Descriçao do Subdominio</th><th>Gasto Total</th>
                            </tr>
                            <%
                            for(SubdominioBean s: s_list){
                            %><tr>
                                <td id="nomeprog"> <%= s.getName()%> </td><td> <%= df.format(s.getGastoTotal())%></td>
                            </tr>
                            <% } %>
                        </table>
                    <% } %>
                
            </div>

            <a href="index.jsp"><button id="grafico"><img id="graficoImg" src="imagens/grafico.png"/><br>Gráficos</button></a>
        </article>
    </body>
</html>
