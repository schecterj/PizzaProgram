<%@ Page Title="Order Pizza" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="orderPizza.aspx.vb" Inherits="PizzaProgram.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>
       
    </h2>

    
        <table class="nav-justified">
            <tr>
                <td style="width: 180px">Pizza Order Form:</td>
                <td style="width: 310px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 180px">Last Name:</td>
                <td style="width: 310px">
                    <asp:TextBox ID="txtLastName" runat="server" Width="310px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please enter last name for order."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 180px">First Name:</td>
                <td style="width: 310px">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="310px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please enter first name for order."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 180px">Phone Number:</td>
                <td style="width: 310px">
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Width="310px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Please enter phone number for order."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhoneValidation" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Please enter a valid phone number for order." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 180px">Address:</td>
                <td style="width: 310px">
                    <asp:TextBox ID="txtAddress" runat="server" Width="310px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 180px">Pizza Size (cheese):</td>
                <td style="width: 310px">
                    <asp:DropDownList ID="ddlPizzaSize" runat="server" Width="280px">
                        <asp:ListItem Value="1">Small            $  8.99</asp:ListItem>
                        <asp:ListItem Value="2">Medium       $12.99</asp:ListItem>
                        <asp:ListItem Selected="True" Value="3">Large            $15.99</asp:ListItem>
                        <asp:ListItem Value="4">Extra Large   $18.99</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 180px">Toppings:<br />
                    (Each topping $0.99)</td>
                <td style="width: 310px">
                    <asp:CheckBoxList ID="cblToppings" runat="server" RepeatColumns="2" Width="310px">
                        <asp:ListItem>Pepperoni</asp:ListItem>
                        <asp:ListItem>Sausage</asp:ListItem>
                        <asp:ListItem>Chicken</asp:ListItem>
                        <asp:ListItem>Ham</asp:ListItem>
                        <asp:ListItem>Olives</asp:ListItem>
                        <asp:ListItem>Bell Peppers</asp:ListItem>
                        <asp:ListItem>Mushrooms</asp:ListItem>
                        <asp:ListItem>Pineapple</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                <td style="font-size: large">
                    <asp:Image ID="imgPizza" runat="server" Height="150px" ImageUrl="http://www.cicis.com/media/1138/pizza_trad_pepperoni.png" Width="200px" />
                    La Villa Pizzaria</td>
            </tr>
            <tr>
                <td style="width: 180px">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear data"  />
                     
                </td>
                <td style="width: 310px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="lblOrder" runat="server" Text="Label" Width="310px" Visible="False"></asp:Label>
    </p>
</asp:Content>
