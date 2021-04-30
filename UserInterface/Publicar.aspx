<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Publicar.aspx.cs" Inherits="UserInterface.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="css/StyleSheet1.css">
    <div class="todoContenido">
        <div runat="server" id="main">
            <h2 style="text-align: center">Publicar Articulo:</h2>

            <div style="padding-left: 100px; padding-right: 100px;">
                <asp:RadioButtonList
                    ID="RadioButtonList1"
                    runat="server"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem>Vehiculo</asp:ListItem>
                    <asp:ListItem>Propiedad</asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <br />
            <div class="bloque">
                <div>
                    <asp:Label runat="server" Text="Titulo:"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="titulo" runat="server"> </asp:TextBox>
                </div>
                <br />
                <div>
                    <asp:Label runat="server" Text="Localidad:"></asp:Label>
                </div>
                <asp:DropDownList ID="localidad" runat="server">

                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Benidorm" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Alicante" Value="2"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <div>

                    <asp:Label runat="server" Text="Descripcion:"></asp:Label>
                </div>

                <div>
                    <asp:TextBox ID="descripcion" runat="server" style="width:80%;height:100px" TextMode="MultiLine"> </asp:TextBox>
                </div>
                <br />

                <div>
                    <asp:TextBox ID="cp" runat="server"> </asp:TextBox>
                </div>
                <br />


            </div>
        </div>
        <div runat="server" id="vehiculo" class="bloque" visible="false">
            <div>
                <asp:Label runat="server" Text="Marca:"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="marca" runat="server">

                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="--Select--" Value="1"></asp:ListItem>
                    <asp:ListItem Text="--Select--" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <div>
                <asp:Label runat="server" Text="Tipo:"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="tipoCoche" runat="server">

                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="--Select--" Value="1"></asp:ListItem>
                    <asp:ListItem Text="--Select--" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <div>
                <asp:Label runat="server" Text="Precio:"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="precioVehiculo" runat="server"> </asp:TextBox>
            </div>
        </div>

        <div runat="server" id="propiedad" class="bloque" visible="false">
            <asp:RadioButtonList
                ID="RadioButtonList2"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                <asp:ListItem>Alquiler</asp:ListItem>
                <asp:ListItem>Venta</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <div>
                <asp:Label runat="server" ID="precioProp"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="precio" runat="server"> </asp:TextBox>
                €
            </div>
            <br />

            <div>
                <asp:Label runat="server" Text="Numero Catastral"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="numCatastral" runat="server"> </asp:TextBox>
            </div>
            <br />
            <div>
                <asp:Label runat="server" Text="Tipo de propiedad"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="TipoCasa" runat="server">
                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="--Select--" Value="1"></asp:ListItem>
                    <asp:ListItem Text="--Select--" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <div>
                <asp:Label runat="server" Text="Direccion:"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="Direccion" runat="server"> </asp:TextBox>
            </div>
            <br />
            <div>
                <asp:Label runat="server" Text="Superficie:"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="Superficie" runat="server"> </asp:TextBox>
            </div>
            <br />
            <div>
                <asp:Label runat="server" Text="Numero de baños:"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="NumBanyos" runat="server"> </asp:TextBox>
            </div>
            <br />
            <div>
                <asp:Label runat="server" Text="Numero de habitaciones:"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="NumHabit" runat="server"> </asp:TextBox>
            </div>
            <br />

        </div>
        <asp:Label ID="mensaje" runat="server"></asp:Label><br />
        <br />
        <div class="bloque">
            <h3>Imagenes de articulo:</h3>
            <asp:FileUpload ID="cargarimg1" runat="server" Text="Cargar imagenes" AllowMultiple="true" /><br />
        </div>
        <div style="text-align: center;">
            <asp:Button ID="publicar" runat="server" Text="Publicar" OnClick="PublicarClick" />
            <asp:Button ID="inicio" runat="server" Text="Inicio" OnClick="InicioClick" />
        </div>
    </div>

</asp:Content>
