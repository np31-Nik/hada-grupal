<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Hipoteca-Banco_Admin.aspx.cs" Inherits="UserInterface.Perfil_Hipoteca_Banco_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <div class="formularioHead">
            <h2>Banco</h2>
        </div>
        <div class="formularioContent">
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p>
                        Banco <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        Telefono <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        Email <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </p>
                    <p >
                        <asp:Button ID="Button1" runat="server" Text="Insertar" /> 
                        &nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Borrar" />
                        &nbsp;
                        <asp:Button ID="Button3" runat="server" Text="Modificar" />
                    </p>
                </div>
                <div class="formularioTable">
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="formularioHead">
            <h2>Hipoteca</h2>
        </div>
        <div class="formularioContent">
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p>
                        Banco <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        Desde <asp:TextBox ID="TextBox5" runat="server" Width="40px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hasta <asp:TextBox ID="TextBox7" runat="server" Width="40px"></asp:TextBox>
                    </p>
                    <p>
                        Interes% <asp:TextBox ID="TextBox6" runat="server" Width="40px"></asp:TextBox>
                    </p>
                    <p >
                        <asp:Button ID="Button4" runat="server" Text="Insertar" /> 
                        &nbsp;
                        <asp:Button ID="Button5" runat="server" Text="Borrar" />
                        &nbsp;
                        <asp:Button ID="Button6" runat="server" Text="Modificar" />
                    </p>
                </div>
                <div class="formularioTable">
                    <asp:GridView ID="GridView2" runat="server"></asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
