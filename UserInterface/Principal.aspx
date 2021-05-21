<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="UserInterface.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <link rel="stylesheet" type="text/css" href="css/MargenLupa.css" />
    <div style="background-color: #151719; color:white; padding:10px; text-align:center;">
        Referencia: <asp:TextBox ID="ref" runat="server" Height="25px" Width="200px" />
        
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

        <asp:ImageButton ID="LupaBuscar" runat="server" ImageUrl="~/imagenes/455-4559731_icono-de-lupa-para-legal-design-thinking-lupa.png"  Width="30px" ImageAlign="Middle" Height="30px" CssClass="MargenLupa"/>
        
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

            <asp:ImageButton ID="ImageButton1" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta1"/>
            <asp:ImageButton ID="ImageButton2" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta2"/>

            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton3" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta3"/>
            <asp:ImageButton ID="ImageButton4" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta4"/>
            
            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton5" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta5"/>
            <asp:ImageButton ID="ImageButton6" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta6"/>
            
            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton7" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta7"/>
            <asp:ImageButton ID="ImageButton8" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta8"/>

            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton9" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta9"/>
            <asp:ImageButton ID="ImageButton10" runat="server" Width="360px" Height="240px" BorderWidth="20px" OnClick="Oferta10"/>
            
            <br /><br /><br /><br /><br />

        <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/agencias-inmobiliarias-idolatria-de-la-exclusiva.jpg" Width="720px" Height="450px" ImageAlign="Left"/>

        <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/productividad-agencia-inmobiliaria-2-e1571754106299.jpg"  Width="720px" Height="450px" ImageAlign="Right"/>

        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        
        <p style="font-size:20px; text-align:left; font-family:sans-serif; background-color:#151719; color:white; padding:20px;">
            Todo el mundo merece sentirse cómodo con su casa de en sueño o con su coche ideal, en "Casas y Coches de la DeepWeb" tenemos lo que la clientela 
            nos ha demandado desde 1980, con total discreción, calidad y comodidad a precio más que justo. Nuestra empresa tiene como prioridad a cumplir los sueños de nuestros clientes
            al precio y calidad más competitivo del mercado líder actual. Contamos con más de 100 establecimientos en toda España para estar al alcance
            de nuestro público y poder satisfacer con efectividad sus demandas. Ya saben, con deepweb, nuestras prioridades son su satisfacción.
            "Discreción, calidad, y precio justo", son los valores de nuestra empresa.    
        </p>

        <br /><br /><br /><br />

        <asp:Image ID="Image3" runat="server" ImageUrl="~/imagenes/shutterstock_499614244-1080x675.jpg" Width="720px" Height="450px" ImageAlign="AbsMiddle"/>
        
        <br /><br /><br /><br /><br />
    </div>
</asp:Content>
