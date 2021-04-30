<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="UserInterface.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div style="background-color: #151719; color:white; padding:10px; text-align:center ">
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

        <asp:ImageButton ID="LupaBuscar" runat="server" ImageUrl="~/imagenes/455-4559731_icono-de-lupa-para-legal-design-thinking-lupa.png"  Width="30px" ImageAlign="Middle" Height="30px"/>
        
    </div>
    <div style="font-size:15px; text-align:center; font-family:'sans-serif';">
        <br /><br /><br /><br /><br />

        <p style="font-size:40px; text-align:center; font-family:'sans-serif'; background-color:#151719; color:white;">
            <b>
                Portada
            </b>
        </p>

        <br /><br /><br /><br /><br />

        <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/agencias-inmobiliarias-idolatria-de-la-exclusiva.jpg" Width="720px" Height="450px" ImageAlign="Left"/>

        <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/productividad-agencia-inmobiliaria-2-e1571754106299.jpg"  Width="720px" Height="450px" ImageAlign="Right"/>

        <br /><br /><br /><br /><br /><br />
        
        <p style="font-size:15px; text-align:left">
            <br /><br /><br /><br /><br /><br />
            info..............................................................................................................................................
        </p>

        <br /><br /><br /><br /><br /><br />

        <asp:Image ID="Image3" runat="server" ImageUrl="~/imagenes/shutterstock_499614244-1080x675.jpg" Width="720px" Height="450px" ImageAlign="AbsMiddle"/>
        
        <br /><br /><br /><br /><br />

        <p style="color:white; text-align:center; font-family:'sans-serif'; font-size:30px; background-color:#151719;">
            <b>
                Ofertas de interés
            </b>
        </p>
            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton1" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            <asp:ImageButton ID="ImageButton6" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>

            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton2" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            <asp:ImageButton ID="ImageButton7" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            
            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton3" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            <asp:ImageButton ID="ImageButton8" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            
            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton4" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            <asp:ImageButton ID="ImageButton9" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>

            <br /><br /><br /><br /><br />

            <asp:ImageButton ID="ImageButton5" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            <asp:ImageButton ID="ImageButton10" runat="server" Width="360px" Height="240px" BorderWidth="20px"/>
            
            <br /><br /><br /><br /><br />

    </div>
</asp:Content>
