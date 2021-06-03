<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Publicar.aspx.cs" Inherits="UserInterface.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="css/StyleSheet1.css">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanelPublicar" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
        </Triggers>
        <ContentTemplate>
            <div class="todoContenido">

                <div runat="server" id="main">
                    <h2 style="text-align: center">Publicar Articulo:</h2>

                    <div style="padding-left: 100px; padding-right: 100px;">
                        <asp:RadioButtonList
                            ID="RadioButtonList1"
                            runat="server"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                            ClientIDMode="AutoID">
                            <asp:ListItem Selected="True">Vehiculo</asp:ListItem>
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
                            <asp:RequiredFieldValidator ID="tituloValidator" runat="server" ValidationGroup="main"
                                ControlToValidate="titulo" ForeColor="Red" ErrorMessage="Campo obligatorio!">
                            </asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div>
                            <asp:Label runat="server" Text="Localidad:"></asp:Label>
                        </div>
                        <div>
                            <asp:DropDownList ID="localidad" runat="server" DataSourceID="SqlDataSource1" DataTextField="localidad" DataValueField="localidad">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [localidad] FROM [Localidad]"></asp:SqlDataSource>
                        </div>
                        <br />
                        <div>


                            <asp:Label runat="server" Text="Descripcion:"></asp:Label>
                        </div>

                        <div>
                            <asp:TextBox ID="descripcion" runat="server" Style="width: 80%; height: 100px" TextMode="MultiLine"> </asp:TextBox>
                            <asp:RequiredFieldValidator ID="descrValidator" runat="server" ValidationGroup="main"
                                ControlToValidate="descripcion" ForeColor="Red" ErrorMessage="Campo obligatorio!"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <asp:RadioButtonList
                            ID="tipoAnuncio"
                            runat="server"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                            <asp:ListItem Selected="True">Alquiler</asp:ListItem>
                            <asp:ListItem>Venta</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <div>

                    <div runat="server" id="vehiculo" class="bloque" visible="false">

                        <br />
                        <div>
                            <asp:Label runat="server" Text="Marca:"></asp:Label>
                        </div>
                        <div>
                            <asp:DropDownList ID="marca" runat="server" DataSourceID="MarcaCocheDataSource" DataTextField="marca" DataValueField="marca">

                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="MarcaCocheDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [marca] FROM [MarcaCoche]"></asp:SqlDataSource>
                        </div>
                        <br />
                        <div>
                            <asp:Label runat="server" Text="Tipo:"></asp:Label>
                        </div>
                        <div>
                            <asp:DropDownList ID="tipoCoche" runat="server" DataSourceID="TipoCocheDataSource" DataTextField="tipo" DataValueField="tipo">

                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="TipoCocheDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoCoche]"></asp:SqlDataSource>
                        </div>
                        <br />
                        <div>
                            <asp:Label runat="server" Text="Año:"></asp:Label>
                        </div>
                        <div>
                            <asp:TextBox ID="anyo" runat="server"> </asp:TextBox>
                            <asp:RequiredFieldValidator ID="anyoValidator" ValidationGroup="vehiculo" runat="server"
                                ControlToValidate="anyo" ForeColor="Red" ErrorMessage="Campo obligatorio!"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div>
                            <asp:Label runat="server" Text="Precio:"></asp:Label>
                            
                        </div>

                        <div>
                            <asp:TextBox ID="precioVehiculo" runat="server"> </asp:TextBox>
                            <asp:RequiredFieldValidator ID="precioValidator" ValidationGroup="vehiculo" runat="server"
                                ControlToValidate="precioVehiculo" ForeColor="Red" ErrorMessage="Campo obligatorio!"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                    </div>

                    <div runat="server" id="propiedad" class="bloque" visible="false">
                        <div>
                            <asp:Label runat="server" ID="precioProp"></asp:Label>
                        </div>
                        <div>
                            <asp:TextBox ID="precio" runat="server"> </asp:TextBox>
                            €
                            <asp:RequiredFieldValidator ID="precioValidator2" ValidationGroup="propiedad" runat="server"
                                ControlToValidate="precio" ForeColor="Red" ErrorMessage="Campo obligatorio!"></asp:RequiredFieldValidator>
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
                            <asp:DropDownList ID="TipoCasa" runat="server" DataSourceID="TipoPropiedadDataSource" DataTextField="tipo" DataValueField="tipo">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="TipoPropiedadDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoPropiedad]"></asp:SqlDataSource>
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
                            <asp:RequiredFieldValidator ID="superficieValidatro" ValidationGroup="propiedad" runat="server"
                                ControlToValidate="Superficie" ForeColor="Red" ErrorMessage="Campo obligatorio!"></asp:RequiredFieldValidator>
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

                </div>
                <div style="padding-left:100px;">
                <asp:Label ID="mensaje" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                <br />
                <br />

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="bloque">
        <h3>Imagenes de articulo:</h3>
        <asp:FileUpload ID="cargarimg1" runat="server" Text="Cargar imagenes" AllowMultiple="true" />
        

        <br />
        <br />
    </div>
    <div style="text-align: center;">
        <asp:Button ID="publicar" runat="server" ValidationGroup="cargarimg" Text="Publicar" OnClick="PublicarClick" CausesValidation="true" />
        <asp:Button ID="inicio" runat="server" Text="Inicio" OnClick="InicioClick" />

    </div>


</asp:Content>
