<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_TipoAnuncio_Admin.aspx.cs" Inherits="UserInterface.Perfil_TipoAnuncio_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
	<div>
		<div class="formularioHead">
			<h2>Tipos de Anuncios</h2>
		</div>
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<div class="formularioContent">
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">
			<ContentTemplate>
				<div class="formularioContent2">
					<table>
						<tr>
							<td>
								<div class="formularioContent3">
									<p style="height:30px;"></p>
									<asp:Table ID="BoxTable" runat="server" CellPadding="10">
										<asp:TableRow>
											<asp:TableCell>
												Tipo:
											</asp:TableCell>
											<asp:TableCell>
												<asp:TextBox ID="Tipo" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="TipoValid1" EnableClientScript="false" runat="server" ControlToValidate="Tipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="TipoValid2" EnableClientScript="false" ControlToValidate="Tipo" ValidationExpression="[A-Z][a-z]+(([\s][a-z]+))?" runat="server" ErrorMessage="ej: Tipo o Tipo tipo" ForeColor="Red"></asp:RegularExpressionValidator>
											</asp:TableCell>
										</asp:TableRow>
										<asp:TableRow ID="HidenRow" Visible="false">
											<asp:TableCell>
												New Tipo:
											</asp:TableCell>
											<asp:TableCell>
												<asp:TextBox ID="TextBoxNewTipo" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="newTipoValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxNewTipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="newTipoValid2" EnableClientScript="false" ControlToValidate="TextBoxNewTipo" ValidationExpression="[A-Z][a-z]+(([\s][a-z]+))?" runat="server" ErrorMessage="ej: Tipo o Tipo tipo" ForeColor="Red"></asp:RegularExpressionValidator>					
											</asp:TableCell>
										</asp:TableRow>
									</asp:Table>
									<p style="height:20px;"></p>
                                    <asp:Table ID="ButtonTable1" runat="server" CellSpacing="10">
										<asp:TableRow ID="optionRow1">
											<asp:TableCell>
												<asp:Button ID="InsertarTipoA" runat="server" Text="Insertar" OnClick="InsertarTipoA_Click" /> 
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="BorrarTipoA" runat="server" Text="Borrar" OnClick="BorrarTipoA_Click" />
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="ModificarTipoA" runat="server" Text="Modificar" OnClick="ModificarTipoA_Click" />
											</asp:TableCell>
										</asp:TableRow>
										<asp:TableRow ID="modRow1" Visible="false">
											<asp:TableCell>
												<asp:Button ID="Cancelar1" runat="server" Text="Cancelar" OnClick="CancelarModTipo_Click" />
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="Update1" runat="server" Text="Update" OnClick="UpdateModTipo_Click" />
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
									<asp:GridView ID="GridViewTipoAnuncio" runat="server" EmptyDataText="La tabla esta vacia" AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewTipoAnuncio_SelectedIndexChanged" DataSourceID="SqlTipoAnuncio" >
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
									<asp:SqlDataSource ID="SqlTipoAnuncio" runat="server"  ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoAnuncio]"></asp:SqlDataSource>
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
			<h2>Localidades</h2>
		</div>
		<div class="formularioContent">
			<asp:UpdatePanel ID="UpdatePanel2" runat="server">
				<ContentTemplate>
				<div class="formularioContent2">
					<table>
						<tr>
							<td>
								<div class="formularioContent3">
									<p style="height:30px;"></p>
									<asp:Table ID="Table1" runat="server" CellPadding="10">
										<asp:TableRow>
											<asp:TableCell>
												Localidad:
											</asp:TableCell>
											<asp:TableCell>
												<asp:TextBox ID="Localidad" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="LocalidadValid1" EnableClientScript="false" runat="server" ControlToValidate="Localidad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="LocalidadValid2" EnableClientScript="false" ControlToValidate="Localidad" ValidationExpression="[A-Z]([\s]?[A-Z]?[a-z]+)+" runat="server" ErrorMessage="ej: Localidad" ForeColor="Red"></asp:RegularExpressionValidator>
											</asp:TableCell>
										</asp:TableRow>
										<asp:TableRow ID="HidenRow2" Visible="false">
											<asp:TableCell>
												New Localidad:
											</asp:TableCell>
											<asp:TableCell>
												<asp:TextBox ID="newLocalidad" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="newLocalidadValid1" EnableClientScript="false" runat="server" ControlToValidate="newLocalidad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="newLocalidadValid2" EnableClientScript="false" ControlToValidate="newLocalidad" ValidationExpression="[A-Z]([\s]?[A-Z]?[a-z]+)+" runat="server" ErrorMessage="ej: Localidad" ForeColor="Red"></asp:RegularExpressionValidator>
											</asp:TableCell>
										</asp:TableRow>
									</asp:Table>
									<p style="height:20px;"></p>
                                    <asp:Table ID="Table2" runat="server" CellSpacing="10">
										<asp:TableRow ID="optionRow2">
											<asp:TableCell>
												<asp:Button ID="InsertarLocalidad" runat="server" Text="Insertar" OnClick="InsertarLocalidad_Click" /> 
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="BorrarLocalidad" runat="server" Text="Borrar" OnClick="BorrarLocalidad_Click" />
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="ModificarLocalidad" runat="server" Text="Modificar" OnClick="ModificarLocalidad_Click" />
											</asp:TableCell>
										</asp:TableRow>
										<asp:TableRow ID="modRow2" Visible="false">
											<asp:TableCell>
												<asp:Button ID="Cancelar2" runat="server" Text="Cancelar" OnClick="CancelarModLocalidad_Click" />
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="Update2" runat="server" Text="Update" OnClick="UpdateModLocalidad_Click" />
											</asp:TableCell>
										</asp:TableRow>
                                    </asp:Table>
									<p>
										<asp:Label ID="Label_Estado2" runat="server" ForeColor="Red"></asp:Label>
									</p>
								</div>
							</td>
							<td>
								<div class="formularioTable">
									<asp:GridView ID="GridViewLocalidad" runat="server" EmptyDataText="La tabla esta vacia" AutoGenerateColumns="False" AllowPaging="True" PageSize="4" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="localidad" DataSourceID="sqlLocalidad" OnSelectedIndexChanged="GridViewLocalidad_SelectedIndexChanged">
										<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
										<Columns>
											<asp:CommandField ShowSelectButton="True" />
											<asp:BoundField DataField="localidad" ItemStyle-CssClass="itemStyle2" HeaderText="localidad" ReadOnly="True" SortExpression="localidad" >
											<ItemStyle CssClass="itemStyle2" />
											</asp:BoundField>
										</Columns>
										<EditRowStyle BackColor="#999999" />
										<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
										<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
										<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
										<RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
										<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
										<SortedAscendingCellStyle BackColor="#E9E7E2"  />
										<SortedAscendingHeaderStyle BackColor="#506C8C" />
										<SortedDescendingCellStyle BackColor="#FFFDF8" />
										<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
									</asp:GridView>
									<asp:SqlDataSource ID="sqlLocalidad" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [localidad] FROM [Localidad]"></asp:SqlDataSource>
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
