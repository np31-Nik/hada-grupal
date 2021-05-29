<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_MisAnuncios.aspx.cs" Inherits="UserInterface.Perfil_MisAnuncios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
	<div>
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<div class="formularioHead">
			<h2>Mis Anuncios</h2>
		</div>
		<div class="formularioContent">
		<asp:UpdatePanel ID="UpdatePanelGrid" runat="server">
			<ContentTemplate>
				<div class="formularioContent2">
					<asp:GridView ID="AnuncioGridView"  runat="server" CellSpacing="5" PageSize="6" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLAnuncio" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="AnuncioGridView_SelectedIndexChanged">
						<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
						<Columns>
							<asp:CommandField ShowSelectButton="True" />
							<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
							<asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
							<asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
							<asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
						</Columns>
						<EditRowStyle BackColor="#999999" />
						<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
						<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
						<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
						<SortedAscendingCellStyle BackColor="#E9E7E2" />
						<SortedAscendingHeaderStyle BackColor="#506C8C" />
						<SortedDescendingCellStyle BackColor="#FFFDF8" />
						<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
					</asp:GridView>
					<asp:SqlDataSource ID="SQLAnuncio" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [id], [titulo], [tipo], [categoria] FROM [Anuncio]"></asp:SqlDataSource>
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
		</div>
		<asp:UpdatePanel ID="UpdatePanelID" runat="server">
		<ContentTemplate>
			<div class="formularioHead">
				<h2><asp:TextBox ID="IdAnuncio" runat="server" Enabled="false" BorderStyle="None" Font-Size="Larger" ReadOnly="True"></asp:TextBox></h2>
			</div>
		</ContentTemplate>
		</asp:UpdatePanel>
		
		<div class="formularioContent">
			<div class="formularioContent2">
				<table>
					<tr>
						<td>
							<div class="formularioContent3">
								<asp:UpdatePanel ID="UpdatePanelAnuncio" runat="server" Visible="true">
									<ContentTemplate>
										<asp:Table ID="AnuncioTitulo" runat="server" CellSpacing="1">
											<asp:TableRow>
												<asp:TableCell>
													<asp:TextBox ID="Titulo" runat="server" Font-Size="15" BorderStyle="None" Enabled="false"></asp:TextBox>
													<asp:RequiredFieldValidator ID="TituloValid" runat="server" EnableClientScript="false" ControlToValidate="Titulo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<asp:Table ID="AnuncioTable" runat="server" CellSpacing="10">
											<asp:TableRow>
												<asp:TableCell>
													Localidad:
													<asp:RequiredFieldValidator ID="LocalidadValid" runat="server" EnableClientScript="false" ControlToValidate="Localidad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<br />
													<asp:TextBox ID="Localidad" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
													
													<asp:DropDownList ID="LocalidadList" runat="server" OnSelectedIndexChanged="LocalidadList_SelectedIndexChanged" DataSourceID="SQLLocalidad" DataTextField="localidad" DataValueField="localidad" Visible="false"></asp:DropDownList>
													<asp:SqlDataSource ID="SQLLocalidad" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [localidad] FROM [Localidad]"></asp:SqlDataSource>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>
													Tipo de Anuncio:
													<asp:RequiredFieldValidator ID="TipoAnuncioValid" runat="server" EnableClientScript="false" ControlToValidate="TipoAnuncio" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<br />
													<asp:TextBox ID="TipoAnuncio" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
													
													<asp:DropDownList ID="TipoAnuncioList" runat="server" OnSelectedIndexChanged="TipoAnuncioList_SelectedIndexChanged" DataSourceID="SQLTipoAnuncio" DataTextField="tipo" DataValueField="tipo" Visible="false"></asp:DropDownList>
													<asp:SqlDataSource runat="server" ID="SQLTipoAnuncio" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [tipo] FROM [TipoAnuncio]"></asp:SqlDataSource>
												</asp:TableCell>
												<asp:TableCell>
													Categoria:
													<asp:RequiredFieldValidator ID="CategoriaValid" runat="server" EnableClientScript="false" ControlToValidate="CategoriaAnuncio" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<br />
													<asp:TextBox ID="CategoriaAnuncio" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>
													Precio:
													<asp:RequiredFieldValidator ID="PrecioValid1" runat="server" EnableClientScript="false" ControlToValidate="PrecioAnuncio" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="PrecioValid2" EnableClientScript="false" ControlToValidate="PrecioAnuncio" ValidationExpression="\d+" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>											
													<br />
													<asp:TextBox ID="PrecioAnuncio" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<asp:Table ID="CocheTable" runat="server" CellSpacing="10" Visible="false">
											<asp:TableRow>
												<asp:TableCell>
													Anyo:
													<asp:RequiredFieldValidator ID="AnyoCocheValid1" runat="server" EnableClientScript="false" ControlToValidate="AnyoCoche" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RangeValidator ID="AnyoCocheValid2" runat="server" EnableClientScript="false" ControlToValidate="AnyoCoche" MinimumValue="0" MaximumValue="2021" ErrorMessage="0-2021" ForeColor="Red"></asp:RangeValidator>												
													<br />
													<asp:TextBox ID="AnyoCoche" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>
													Marca:
													<asp:RequiredFieldValidator ID="MarcaCocheValid" runat="server" EnableClientScript="false" ControlToValidate="MarcaCoche" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<br /> 
													<asp:TextBox ID="MarcaCoche" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
													
													<asp:DropDownList ID="MarcaCocheList" runat="server" OnSelectedIndexChanged="MarcaCocheList_SelectedIndexChanged" DataSourceID="SQLMarcaCoche" DataTextField="marca" DataValueField="marca" Visible="false"></asp:DropDownList>
													<asp:SqlDataSource runat="server" ID="SQLMarcaCoche" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [marca] FROM [MarcaCoche]"></asp:SqlDataSource>
												</asp:TableCell>
												<asp:TableCell>
													Tipo:
													<asp:RequiredFieldValidator ID="TipoCocheValid" runat="server" EnableClientScript="false" ControlToValidate="TipoCoche" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<br />
													<asp:TextBox ID="TipoCoche" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
													
													<asp:DropDownList ID="TipoCocheList" runat="server" OnSelectedIndexChanged="TipoCocheList_SelectedIndexChanged" DataSourceID="SQLTipoCoche" DataTextField="tipo" DataValueField="tipo" Visible="false"></asp:DropDownList>
													<asp:SqlDataSource runat="server" ID="SQLTipoCoche" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [tipo] FROM [TipoCoche]"></asp:SqlDataSource>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<asp:Table ID="PropiedadTable" runat="server" CellSpacing="10" Visible="false">
											<asp:TableRow>
												<asp:TableCell>
													Tipo:
													<asp:RequiredFieldValidator ID="TipoPropiedadValid" runat="server" EnableClientScript="false" ControlToValidate="TipoPropiedad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>									
													<br />
													<asp:TextBox ID="TipoPropiedad" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
                                                    <asp:DropDownList ID="TipoPropiedadList" runat="server" OnSelectedIndexChanged="TipoPropiedadList_SelectedIndexChanged" DataSourceID="SQLTipoPropiedad" DataTextField="tipo" DataValueField="tipo" Visible="false"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SQLTipoPropiedad" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [tipo] FROM [TipoPropiedad]"></asp:SqlDataSource>
                                                </asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>
													Superficie:
													<asp:RequiredFieldValidator ID="SuperficiValid1" runat="server" EnableClientScript="false" ControlToValidate="Superficie" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="SuperficiValid2" EnableClientScript="false" ControlToValidate="Superficie" ValidationExpression="\d+" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>											
													<br />
													<asp:TextBox ID="Superficie" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
												</asp:TableCell>
												<asp:TableCell>
													NºCatastral:
													<br />
													<asp:TextBox ID="Catastral" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>
													NºDorm.:
													<asp:RegularExpressionValidator ID="NdormValid1" EnableClientScript="false" ControlToValidate="Ndorm" ValidationExpression="\d*" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>											
													<br />
													<asp:TextBox ID="Ndorm" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
												</asp:TableCell>
												<asp:TableCell>
													NºBanyo:
													<asp:RegularExpressionValidator ID="NbanyoValid1" EnableClientScript="false" ControlToValidate="Nbanyo" ValidationExpression="\d*" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>											
													<br />
													<asp:TextBox ID="Nbanyo" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<p>
											Descripcion:
											<asp:RequiredFieldValidator ID="DescripcionValid" runat="server" EnableClientScript="false" ControlToValidate="Descripcion" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
											<br />
											<asp:TextBox ID="Descripcion" runat="server" Width="420" Enabled="false" BorderStyle="None"></asp:TextBox>
										</p>
										<asp:Table ID="ButtonTable1" runat="server" CellSpacing="10" >
											<asp:TableRow ID="optionRow1">
												<asp:TableCell>
													<asp:Button ID="BorrarAnuncio" runat="server" Text="Borrar" OnClick="BorrarAnuncio_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="ModificarAnuncio" runat="server" Text="Modificar" OnClick="ModificarAnuncio_Click"  />
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow ID="modRow1" Visible="false">
												<asp:TableCell>
													<asp:Button ID="Cancelar1" runat="server" Text="Cancelar" OnClick="CancelarModAnuncio_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="Update1" runat="server" Text="Update" OnClick="UpdateModAnuncio_Click" />
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow ID="modRow2" Visible="false">
												<asp:TableCell>
													<asp:Button ID="Cancelar2" runat="server" Text="Cancelar" OnClick="Cancelar2ModAnuncio_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="Delete2" runat="server" Text="Update" OnClick="DeleteModAnuncio_Click" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<p>
											<asp:Label ID="Label_Estado" runat="server" ForeColor="Red"></asp:Label>
										</p>
									</ContentTemplate>
								</asp:UpdatePanel>
							</div>
						</td>
						<td>
							<div class="formularioTable">
								<asp:UpdatePanel ID="UpdatePanel4" runat="server">
									<ContentTemplate>
                                        
                                        <asp:Table ID="ImageModButtons" runat="server" CellSpacing="10">
											<asp:TableRow>
												<asp:TableCell Width="150px"><asp:Button ID="BorrarFoto" runat="server" OnClick="BorrarFoto_Click" Text="Borrar Usuario" /></asp:TableCell>
												<asp:TableCell><asp:Button ID="NoBorrarFoto" runat="server" Text="Cancelar" OnClick="NoBorrarFoto_Click" Visible="false" /></asp:TableCell>
												<asp:TableCell><asp:Button ID="YesBorrarFoto" runat="server" OnClick="YesBorrarFoto_Click" Text="Delete" Visible="false" /></asp:TableCell>
											</asp:TableRow>
										</asp:Table>
									</ContentTemplate>
								</asp:UpdatePanel>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</asp:Content>
