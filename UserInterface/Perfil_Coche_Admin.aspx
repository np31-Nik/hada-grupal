<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Coche_Admin.aspx.cs" Inherits="UserInterface.Perfil_Coche_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="formularioHead">
            <h2>Marca de Coche</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="formularioContent2">
                        <table>
                        <tr>
                            <td>
                                <div class="formularioContent3">
                    <p style="margin-top:30px">
                        Marca <asp:TextBox ID="Marca" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="MarcaValid1" EnableClientScript="false" runat="server" ControlToValidate="Marca" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="MarcaValid2" EnableClientScript="false" ControlToValidate="Marca" ValidationExpression="[a-z]*" runat="server" ErrorMessage="Solo se permiten caracteres" ForeColor="Red"></asp:RegularExpressionValidator>
                    </p>
                    <p style="margin-top:40px">
                        <asp:Button ID="InsertarMarca" runat="server" Text="Insertar" OnClick="InsertarMarca_Click" /> 
                        &nbsp;
                        <asp:Button ID="BorrarMarca" runat="server" Text="Borrar" OnClick="BorrarMarca_Click" />
                        &nbsp;
                        <asp:Button ID="ModificarMarca" runat="server" Text="Modificar" OnClick="ModificarMarca_Click" />
                    </p>
                </div>
                            </td>
                            <td>
                                <div class="formularioTable">
                                <asp:GridView ID="GridViewMarca" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="marca" ForeColor="#333333" GridLines="None" DataSourceID="SqlMarcaCoche" >
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="marca" ItemStyle-CssClass="itemStyle2" HeaderText="marca" ReadOnly="True" SortExpression="marca" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle  BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                <asp:SqlDataSource ID="SqlMarcaCoche" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [marca] FROM [MarcaCoche]"></asp:SqlDataSource>
                                </div>
                            </td>
                        </tr>
                        </table>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div>
        <div class="formularioHead">
            <h2>Tipo de Coche</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            <div class="formularioContent2">
                <table>
                    <tr>
                        <td>
                            <div class="formularioContent3">
                    <p style="margin-top:30px">
                        Tipo <asp:TextBox ID="Tipo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TipoValid1" EnableClientScript="false" runat="server" ControlToValidate="Tipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="TipoValid2" EnableClientScript="false" ControlToValidate="Tipo" ValidationExpression="[a-z]*" runat="server" ErrorMessage="Solo se permiten caracteres" ForeColor="Red"></asp:RegularExpressionValidator>
                    </p>
                    <p style="margin-top:40px">
                        <asp:Button ID="InsertarTipo" runat="server" Text="Insertar" OnClick="InsertarTipo_Click" /> 
                        &nbsp;
                        <asp:Button ID="BorrarTipo" runat="server" Text="Borrar" OnClick="BorrarTipo_Click" />
                        &nbsp;
                        <asp:Button ID="ModificarTipo" runat="server" Text="Modificar" OnClick="ModificarTipo_Click" />
                    </p>
                </div>
                        </td>
                        <td>
                            <div class="formularioTable">
                    <asp:GridView ID="GridViewTipoCoche" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" DataSourceID="SqlTipoCoche" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="tipo" ItemStyle-CssClass="itemStyle2" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle  BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    <asp:SqlDataSource ID="SqlTipoCoche" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoCoche]"></asp:SqlDataSource>
                </div>
                        </td>
                    </tr>
                </table>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
