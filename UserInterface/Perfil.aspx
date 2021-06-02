<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="UserInterface.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div class="formularioHead">
        <h2>Perfil&nbsp; <asp:TextBox ID="Nif" runat="server" Enabled="false" Width="100px" ReadOnly="true" BorderStyle="None" Font-Size="14pt"></asp:TextBox></h2>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <div class="formularioContent">
        <div id="perfilInf">
            <asp:Table ID="Table1" runat="server" Width="400px">
                <asp:TableRow>
                    <asp:TableCell>
                        Nombre <asp:RequiredFieldValidator ID="NombreValid1" EnableClientScript="false" runat="server" ControlToValidate="Nombre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        Apellido <asp:RequiredFieldValidator ID="Apellidoalid1" EnableClientScript="false" runat="server" ControlToValidate="Apellido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="Nombre" runat="server" Enabled="false"></asp:TextBox> 
                        <br /> <asp:RegularExpressionValidator ID="NombreValid2" EnableClientScript="false" ControlToValidate="Nombre" ValidationExpression="[A-Z][a-z]+" runat="server" ErrorMessage="ej:Nombre" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Apellido" runat="server" Enabled="false"></asp:TextBox> 
                        <br /> <asp:RegularExpressionValidator ID="Apellidoalid2" EnableClientScript="false" ControlToValidate="Apellido" ValidationExpression="[A-Z][a-z]+" runat="server" ErrorMessage="ej:Apellido" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Telefono<asp:RequiredFieldValidator ID="TelefonoValid1" EnableClientScript="false" runat="server" ControlToValidate="Telefono" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        Email<asp:RequiredFieldValidator ID="EmailValid1" EnableClientScript="false" runat="server" ControlToValidate="Emali" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="Telefono" runat="server" Enabled="false"></asp:TextBox>
                        <br /> <asp:RegularExpressionValidator ID="TelefonoValid2" EnableClientScript="false" ControlToValidate="Telefono" ValidationExpression="([+]|\d)\d+" runat="server" ErrorMessage="ej: 000000 o +00000" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="Emali" runat="server" Enabled="false"></asp:TextBox>
                        <br /> <asp:RegularExpressionValidator ID="EmailValid2" EnableClientScript="false" ControlToValidate="Emali" ValidationExpression="\w+[@]\w+([.]\w)+" runat="server" ErrorMessage="ej: algo@algo.algo" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Premium <asp:CheckBox ID="Premium" runat="server" Enabled="false"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
            <p>
            </p>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <asp:Panel ID="PasswordPanel" runat="server" Visible="false">
                Contrasenya <asp:TextBox ID="Password" runat="server" EnableTheming="True" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordValid1" EnableClientScript="false" runat="server" ControlToValidate="Password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="LabelPassword" runat="server" Text="" ForeColor="Red"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="newPasswordPanel" runat="server" Visible="false">
                <asp:Table ID="Table3" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            Nueva Contrasenya
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="newPassword" runat="server" EnableTheming="True" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="newPasswordValidator1" EnableClientScript="false" runat="server" ControlToValidate="newPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Repite la Contrasenya
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="newPassword2" runat="server" EnableTheming="True" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="newPasswordValidator2" EnableClientScript="false" runat="server" ControlToValidate="newPassword2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelNewPassword" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <p>
            </p>
            <asp:Table ID="Table2" runat="server" CellSpacing="5">
                <asp:TableRow>
                    <asp:TableCell Width="200px"><asp:Button ID="ModPerfil" runat="server" OnClick="ModPerfil_Click" Text="Modificar Informacion" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="CancelarUpdate" runat="server" Text="Cancelar" OnClick="Cancelar_Click" Visible="false" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="UpdatePerfil" runat="server" OnClick="UpdatePerfil_Click" Text="Update" Visible="false" /></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell Width="200px"><asp:Button ID="ModPassword" runat="server" OnClick="ModPassword_Click" Text="Cambiar Contrasenya" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="CancelarPassword" runat="server" Text="Cancelar" OnClick="CncelarPassword_Click" Visible="false" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="UpdatePassword" runat="server" OnClick="UpdatePassword_Click" Text="Change" Visible="false" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="200px"><asp:Button ID="BorrarUser" runat="server" OnClick="DeleteUser_Click" Text="Borrar Usuario" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="CancelarDelete" runat="server" Text="Cancelar" OnClick="NoToDeleteUser_Click" Visible="false" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="Delete" runat="server" OnClick="YesToDeleteUser_Click" Text="Delete" Visible="false" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="200px"><asp:Button ID="SessionOff" runat="server" OnClick="OffSession_Click" Text="Serrar Sesion" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="CancelarOff" runat="server" Text="Cancelar" OnClick="NoToOffSession_Click" Visible="false" /></asp:TableCell>
                    <asp:TableCell><asp:Button ID="SerrarOff" runat="server" OnClick="YesToOffSession_Click" Text="Serrar" Visible="false" /></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        <p><asp:Label ID="LabelEstado" runat="server" Text="" ForeColor="Red"></asp:Label></p>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
