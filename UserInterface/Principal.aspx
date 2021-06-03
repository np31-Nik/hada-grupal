<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="UserInterface.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <link rel="Stylesheet" type="text/css" href="css/Busqueda.css" />
    <asp:ScriptManager ID="ScriptManager2" runat="server" />

    <link rel="stylesheet" type="text/css" href="css/MargenLupa.css" />
    <div style="background-color: #151719; color:white; padding:10px; text-align:center;">
        Referencia: <asp:TextBox ID="ref_id" runat="server" Height="25px" Width="200px" />
        
        <asp:DropDownList runat="server" ID="CasaoCoche" AutoPostBack="True" Height="25px" Width="175px">
            <asp:ListItem Selected="True" Value="Propiedad"> Propiedad </asp:ListItem>
            <asp:ListItem Value="Coche"> Coche </asp:ListItem>
        </asp:DropDownList>

        <asp:DropDownList runat="server" ID="ALQoVENT" AutoPostBack="True" Height="25px" Width="175px">
            <asp:ListItem Selected="True" Value="Alquiler"> Alquiler </asp:ListItem>
            <asp:ListItem Value="Venta"> Venta </asp:ListItem>
        </asp:DropDownList>
        
        <asp:DropDownList runat="server" ID="localidades" AutoPostBack="True" Height="25px" Width="175px">
            <asp:ListItem Selected="True" Value="Localidad"> Localidad </asp:ListItem>
            <asp:ListItem Value="Alicante"> Alicante </asp:ListItem>
        </asp:DropDownList>

        Precio Mínimo: <asp:TextBox ID="BoxNumeros" runat="server" Height="25px" Width="175px" />
           
        Precio Límite: <asp:TextBox ID="BoxNumeros2" runat="server" Height="25px" Width="175px"/>

        <asp:ImageButton ID="LupaBuscar" runat="server" ImageUrl="~/imagenes/455-4559731_icono-de-lupa-para-legal-design-thinking-lupa.png"  
        Width="30px" ImageAlign="Middle" Height="30px" CssClass="MargenLupa" OnClick="LupaBuscar_Click"/>
        
    </div>
    <div style="font-size:15px; text-align:center; font-family:'sans-serif';">
        <br /><br /><br />

        <p style="font-size:40px; text-align:center; font-family:'sans-serif'; background-color:#151719; color:white;">
            <b>
                Portada
            </b>
        </p>

        <p style="color:white; text-align:center; font-family:'sans-serif'; font-size:30px; background-color:#151719;">
            <b>
                Ofertas de interés
            </b>
        </p>

        <br /><br /><br /><br /><br />
    
        </div>

        <div style="background-color:#ffffff;color:black;>
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>

                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="4">
                   
                    <EmptyItemTemplate>
                <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                   
                    <ItemTemplate>
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;border:ridge;border-color:black">
                            <asp:ImageButton ID="FOTO" runat="server" ImageUrl='<%#"data:Image/jpb;base64,"+Convert.ToBase64String((byte[])Eval("foto")) %>' Width="300px" Height="200px"
                                PostBackUrl='<%#"~/Anuncio.aspx?anuncio_id="+ Eval("id") %>'/>
                            <br />
                            <asp:Label ID="tipoLabel" runat="server" style="float:left" Text='<%# Eval("tipo") %>' />
                            <asp:Label runat="server" Text="€" style="float:right"></asp:Label>
                            <asp:Label ID="precioLabel" runat="server" style="float:right" Text='<%# Eval("precio") %>' />
                            <br />
                            <asp:Label ID="localidadLabel" runat="server" style="float:right" Text='<%# Eval("localidad") %>' />
                            </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table width="100%">
                   <tr>
                     <td align="center">
                       <table>
                         <tr>
                            <td>
                                <div id="groupPlaceholderContainer" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;" >
                                        <span runat="server" id="groupPlaceholder" />
                                    </div>
                
                            </td>
                         </tr>
                       </table>
                     </td>
                   </tr>
                </table>

                    </LayoutTemplate>
                   
                </asp:ListView>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand=
                    "SELECT Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio, Usuario CROSS JOIN Foto 
                    WHERE (Anuncio.categoria = 'Propiedad') AND ((Anuncio.usuario = Usuario.nif) AND Usuario.premium = 1) 
                    AND (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand=
                    "SELECT Anuncio.id, Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio, Usuario CROSS JOIN Foto 
                    WHERE (Anuncio.categoria = 'Propiedad') AND ((Anuncio.usuario = Usuario.nif) AND Usuario.premium = 1) 
                    AND (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource></asp:SqlDataSource>
            <br />
                                            
            
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <br /><br /><br />
        <div style="background-color:#ffffff;color:black;>
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>

                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="4">
                   
                    <EmptyItemTemplate>
                <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                   
                    <ItemTemplate>
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;border:ridge;border-color:black">
                            <asp:ImageButton ID="FOTO" runat="server" ImageUrl='<%#"data:Image/jpb;base64,"+Convert.ToBase64String((byte[])Eval("foto")) %>' Width="300px" Height="200px"
                                PostBackUrl='<%#"~/Anuncio.aspx?anuncio_id="+ Eval("id") %>'/>
                            <br />
                            <asp:Label ID="tipoLabel" runat="server" style="float:left" Text='<%# Eval("tipo") %>' />
                            <asp:Label runat="server" Text="€" style="float:right"></asp:Label>
                            <asp:Label ID="precioLabel" runat="server" style="float:right" Text='<%# Eval("precio") %>' />
                            <br />
                            <asp:Label ID="localidadLabel" runat="server" style="float:right" Text='<%# Eval("localidad") %>' />
                            </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table width="100%">
                   <tr>
                     <td align="center">
                       <table>
                         <tr>
                            <td>
                                <div id="groupPlaceholderContainer" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;" >
                                        <span runat="server" id="groupPlaceholder" />
                                    </div>
                
                            </td>
                         </tr>
                       </table>
                     </td>
                   </tr>
                </table>

                    </LayoutTemplate>
                   
                </asp:ListView>
                
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand=
                    "SELECT Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio, Usuario CROSS JOIN Foto 
                    WHERE (Anuncio.categoria = 'Coche') AND ((Anuncio.usuario = Usuario.nif) AND Usuario.premium = 1) 
                    AND (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand=
                    "SELECT Anuncio.id, Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio, Usuario CROSS JOIN Foto 
                    WHERE (Anuncio.categoria = 'Coche') AND ((Anuncio.usuario = Usuario.nif) AND Usuario.premium = 1) 
                    AND (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource></asp:SqlDataSource>
            <br />
                                            
            
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <br /><br /><br /><br /><br /><br /><br />
        
        <div style="font-size:20px; text-align:left; font-family:sans-serif; background-color:#151719; color:white; padding:20px;">
            
            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/agencias-inmobiliarias-idolatria-de-la-exclusiva.jpg" Width="720px" Height="450px" ImageAlign="Left"/>

            <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/productividad-agencia-inmobiliaria-2-e1571754106299.jpg"  Width="720px" Height="450px" ImageAlign="Right"/>
            
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

            Todo el mundo merece sentirse cómodo con su casa de en sueño o con su coche ideal, en "Casas y Coches de la DeepWeb" tenemos lo que la clientela 
            nos ha demandado desde 1980, con total discreción, calidad y comodidad a precio más que justo. Nuestra empresa tiene como prioridad a cumplir los sueños de nuestros clientes
            al precio y calidad más competitivo del mercado líder actual. Contamos con más de 100 establecimientos en toda España para estar al alcance
            de nuestro público y poder satisfacer con efectividad sus demandas. Ya saben, con deepweb, nuestras prioridades son su satisfacción.
            "Discreción, calidad, y precio justo", son los valores de nuestra empresa.
        </div>

        <br /><br /><br /><br /><br />
</asp:Content>
