<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Hipoteca-Banco_Admin.aspx.cs" Inherits="UserInterface.Perfil_Hipoteca_Banco_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="formularioHead">
            <h2>Banco</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            <div class="formularioContent2">
                <table>
                    <tr>
                        <td>
                            <div class="formularioContent3">
                                <p>
                                    Banco <asp:TextBox ID="TextBoxBanco" runat="server"></asp:TextBox>
                                </p>
                                <p>
                                    Telefono <asp:TextBox ID="TextBoxTelefono" runat="server"></asp:TextBox>
                                </p>
                                <p>
                                    Email <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                                </p>
                                <p >
                                    <asp:Button ID="InsertarBanco" runat="server" Text="Insertar" OnClick="InsertarBanco_Click" /> 
                                    &nbsp;
                                    <asp:Button ID="BorrarBanco" runat="server" Text="Borrar" OnClick="BorrarBanco_Click" />
                                    &nbsp;
                                    <asp:Button ID="ModificarBanco" runat="server" Text="Modificar" OnClick="ModificarBanco_Click"  />
                                </p>
                                <p>
									<asp:Label ID="Label_Estado" runat="server" ForeColor="Red"></asp:Label>
								</p>
                            </div>
                        </td>
                        <td>
                            <div class="formularioTable">
                                <asp:GridView ID="GridViewBanco" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="banco" ForeColor="#333333" GridLines="None" DataSourceID="sqlBanco" OnSelectedIndexChanged="GridViewBanco_SelectedIndexChanged" >
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="banco" ItemStyle-CssClass="itemStyle2"  HeaderText="banco" ReadOnly="True" SortExpression="banco" />
                                            <asp:BoundField DataField="tel" ItemStyle-CssClass="itemStyle2" HeaderText="tel" SortExpression="tel" />
                                            <asp:BoundField DataField="email" ItemStyle-CssClass="itemStyle2" HeaderText="email" SortExpression="email" />
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
                                <asp:SqlDataSource ID="sqlBanco" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [Banco]"></asp:SqlDataSource>
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
            <h2>Hipoteca</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <div class="formularioContent2">
                <table>
                    <tr>
                        <td>
                            <div class="formularioContent3">
                                <p>
                                    ID <asp:TextBox ID="TextBoxId" runat="server" Enabled="false" Width="25"></asp:TextBox>
                                </p>
                                <p>
                                    Banco <asp:TextBox ID="TextBoxBancoH" runat="server"></asp:TextBox>
                                </p>
                                <p>
                                    Desde <asp:TextBox ID="TextBoxDesde" runat="server" Width="40px"></asp:TextBox>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hasta <asp:TextBox ID="TextBoxHasta" runat="server" Width="40px"></asp:TextBox>
                                </p>
                                <p>
                                    Interes% <asp:TextBox ID="TextBoxInteres" runat="server" Width="40px"></asp:TextBox>
                                </p>
                                <p >
                                    <asp:Button ID="InsertarHipoteca" runat="server" Text="Insertar" OnClick="InsertarHipoteca_Click" /> 
                                    &nbsp;
                                    <asp:Button ID="BorrarHipoteca" runat="server" Text="Borrar" OnClick="BorrarHipoteca_Click" />
                                    &nbsp;
                                    <asp:Button ID="ModificarHipoteca" runat="server" Text="Modificar" OnClick="ModificarHipoteca_Click" />
                                </p>
                                <p>
									<asp:Label ID="Label_Estado2" runat="server" ForeColor="Red"></asp:Label>
								</p>
                            </div>
                        </td>
                        <td>
                            <div class="formularioTable">
                    <asp:GridView ID="GridViewHipoteca" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" DataSourceID="SqlHipoteca" OnSelectedIndexChanged="GridViewHipoteca_SelectedIndexChanged" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="id" ItemStyle-CssClass="itemStyle2" HeaderText="id" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                                <asp:BoundField DataField="banco" ItemStyle-CssClass="itemStyle2" HeaderText="banco" SortExpression="banco" />
                                <asp:BoundField DataField="desde" ItemStyle-CssClass="itemStyle2" HeaderText="desde" SortExpression="desde" />
                                <asp:BoundField DataField="hasta" ItemStyle-CssClass="itemStyle2" HeaderText="hasta" SortExpression="hasta" />
                                <asp:BoundField DataField="interes" ItemStyle-CssClass="itemStyle2" HeaderText="interes" SortExpression="interes" />
                                <asp:BoundField DataField="numSolicitudes" ItemStyle-CssClass="itemStyle2" HeaderText="numSolicitudes" SortExpression="numSolicitudes" />
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
                    <asp:SqlDataSource ID="SqlHipoteca" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [Hipoteca]"></asp:SqlDataSource>
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
