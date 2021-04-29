<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Coche_Admin.aspx.cs" Inherits="UserInterface.Perfil_Coche_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <div class="formularioHead">
            <h2>Marca de Coche</h2>
        </div>
        <div class="formularioContent">
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p style="margin-top:30px">
                        Marca <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </p>
                    <p style="margin-top:40px">
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
            <h2>Tipo de Coche</h2>
        </div>
        <div class="formularioContent">
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p style="margin-top:30px">
                        Tipo <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </p>
                    <p style="margin-top:40px">
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
