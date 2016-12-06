<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="PizzaProgram._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>
            <asp:Image ID="imgPizza" runat="server" ImageUrl="http://www.cicis.com/media/1138/pizza_trad_pepperoni.png" Height="200px" Width="300px" /><br />

            Welcome to La Villa Pizzaria</h1>
        <p class="lead">Click
            <asp:HyperLink ID="hplToOrder" runat="server" Font-Bold="True" NavigateUrl="~/orderPizza.aspx">here</asp:HyperLink>
&nbsp;to see menu and order. You can also call us at (520) 55P-IZZA. </p>
        <p>&nbsp;</p>
    </div>

</asp:Content>
