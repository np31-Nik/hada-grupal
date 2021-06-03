<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Propiedad_Admin.aspx.cs" Inherits="UserInterface.Perfil_Propiedad_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
	<div>
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<div class="formularioHead">
			<h2>Tipo de Propiedad</h2>
		</div>
		<div class="formularioContent">
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">
			<ContentTemplate>
			<div class="formularioContent2">
				<table>
					<tr>
						<td>
							<div class="formularioContent3">
								<p style="height:30px;"></p>
								<asp:Table ID="Table2" runat="server" CellSpacing="10">
									<asp:TableRow>
										<asp:TableCell>
											Tipo:
										</asp:TableCell>
										<asp:TableCell>
											<asp:TextBox ID="Tipo" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="TipoValidE" EnableClientScript="false" runat="server" ControlToValidate="Tipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
											<asp:RegularExpressionValidator ID="TipoValidR" EnableClientScript="false" ControlToValidate="Tipo" ValidationExpression="[A-Z][a-z]+(([\s][A-Z]?[a-z]+))?" runat="server" ErrorMessage="ej: Tipo o Tipo tipo" ForeColor="Red"></asp:RegularExpressionValidator>
								
										</asp:TableCell>
									</asp:TableRow>
									<asp:TableRow ID="newTipo" Visible="false">
										<asp:TableCell>
											New Tipo:
										</asp:TableCell>
										<asp:TableCell>
											<asp:TextBox ID="TextBoxNewTipo" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="newTipoValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxNewTipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
											<asp:RegularExpressionValidator ID="newTipoValid2" EnableClientScript="false" ControlToValidate="TextBoxNewTipo" ValidationExpression="[A-Z][a-z]+(([\s][A-Z]?[a-z]+))?" runat="server" ErrorMessage="ej: Tipo o Tipo tipo" ForeColor="Red"></asp:RegularExpressionValidator>
								
										</asp:TableCell>
									</asp:TableRow>
                                </asp:Table>
								<p style="height:20px;"></p>
                                <asp:Table ID="Table1" runat="server" CellSpacing="10">
									<asp:TableRow ID="optionRow">
										<asp:TableCell>
											<asp:Button ID="InsertarTipo" runat="server" Text="Insertar" OnClick="InsertarTipo_Click" /> 
										</asp:TableCell>
										<asp:TableCell>
											<asp:Button ID="BorrarTipo" runat="server" Text="Borrar" OnClick="BorrarTipo_Click"  />
										</asp:TableCell>
										<asp:TableCell>
											<asp:Button ID="ModificarTipo" runat="server" Text="Modificar" OnClick="ModificarTipo_Click"  />
										</asp:TableCell>
									</asp:TableRow>
									<asp:TableRow ID="modTipoRow" Visible="false">
										<asp:TableCell>
											<asp:Button ID="Cancelar" runat="server" Text="Cancelar" OnClick="CancelarModTipo_Click" />
										</asp:TableCell>
										<asp:TableCell>
											<asp:Button ID="Update" runat="server" Text="Update" OnClick="UpdateModTipo_Click" />
										</asp:TableCell>
									</asp:TableRow>
                                </asp:Table>
								<p>
									<asp:Label ID="Label_Estado" runat="server" ForeColor="Red"></asp:Label>
								</p>
								
							</div>
						</td>
						<td>
							<div class="formularioTable">
								<asp:GridView ID="GridViewTipoPropiedad" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" Width="100px" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" DataSourceID="SqlTipoPropiedad" OnSelectedIndexChanged="GridViewTipoPropiedad_SelectedIndexChanged" >
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
								<asp:SqlDataSource ID="SqlTipoPropiedad" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [TipoPropiedad]"></asp:SqlDataSource>
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
