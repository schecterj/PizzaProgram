'Program Name: Pizza Program
'CIS 141 Project: 7
'Date:   11/30/16
'Author: Jonathan Schecter
'Purpose: Create a web page for La Villa Pizzaria. Main page has phone number, and page for ordering pizza
'Order page should have validations and a drop down for size


Option Explicit On
Option Strict On


Public Class About
    Inherits Page

    'class variables pizza prices
    Dim _smallPizza As Decimal = 8.99D
    Dim _mediumPizza As Decimal = 12.99D
    Dim _largePizza As Decimal = 15.99D
    Dim _extraLargePizza As Decimal = 18.99D

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        txtLastName.Focus()
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        'variables
        Dim countOfToppings As Integer
        Dim toppingSubtotal As Decimal
        Dim orderTotal As Decimal
        Dim pizzaOrderPrice As Decimal

        'count topping variable
        countOfToppings = countNumberOfToppings()
        'send topping count to topping subtotal sub
        toppingSubtotal = getToppingSubtotal(countOfToppings)
        'get price of pizza based on size from dropdown
        pizzaOrderPrice = getPizzaSize()

        'extra validation, although web toolbox seems to have it covered
        If pizzaOrderPrice = 0 Then
            Exit Sub
        End If

        'get total (toppings subtotal and price based on size)
        orderTotal = getOrderTotal(toppingSubtotal, pizzaOrderPrice)
        'display order confirmation message
        displayOrderTotal(orderTotal)

    End Sub

    Private Function getPizzaSize() As Decimal
        'gets pizza size and price
        Dim pizzaOrderPrice As Decimal

        Try
            pizzaOrderPrice = CDec(ddlPizzaSize.SelectedValue)
        Catch ex As ArgumentOutOfRangeException
            MsgBox("Error, please select pizza size from dropdown menu.")
        End Try

        Select Case pizzaOrderPrice
            Case 1
                pizzaOrderPrice = _smallPizza
            Case 2
                pizzaOrderPrice = _mediumPizza
            Case 3
                pizzaOrderPrice = _largePizza
            Case 4
                pizzaOrderPrice = _extraLargePizza
            Case Else
                pizzaOrderPrice = 0
        End Select

        Return pizzaOrderPrice
    End Function

    Private Function getToppingSubtotal(countOfToppings As Integer) As Decimal
        'function for topping subtotal based on number of toppings
        Dim extraTopping As Decimal = 0.99D
        Dim toppingSubtotal = extraTopping * countOfToppings
        Return toppingSubtotal
    End Function

    Private Function getOrderTotal(toppingSubtotal As Decimal, pizzaOrderPrice As Decimal) As Decimal
        Dim total As Decimal
        total = toppingSubtotal + pizzaOrderPrice
        Return total

    End Function

    Private Sub displayOrderTotal(orderTotal As Decimal)
        'this sub displays the order total
        Dim orderMessage As String
        orderMessage = (txtFirstName.Text.Trim & ", your order total is $" & orderTotal & " . Your pizza will be delivered within 45 minutes to " _
                                       & txtAddress.Text & " . If we have questions we will call you at " & txtPhoneNumber.Text & ". Thank you!")

        lblOrder.Text = orderMessage
        lblOrder.Visible = True
    End Sub

    Private Function countNumberOfToppings() As Integer
        'this function counts the number of toppings selected and sends count back
        Dim count As Integer = 0

        Dim i As Integer

        For i = 0 To cblToppings.Items.Count - 1
            If cblToppings.Items(i).Selected Then
                count += 1
            End If
        Next i

        Return count

    End Function

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        'clear all text, reset size to default large, reset order confirmation message and clear selected toppings
        txtFirstName.Text = Nothing
        txtLastName.Text = Nothing
        txtAddress.Text = Nothing
        txtPhoneNumber.Text = Nothing
        lblOrder.Visible = False
        lblOrder.Text = Nothing
        ddlPizzaSize.SelectedValue = CType(3, String)
        clearToppings()

    End Sub

    Private Sub clearToppings()

        Dim i As Integer

        For i = 0 To cblToppings.Items.Count - 1
            If cblToppings.Items(i).Selected = True Then
                cblToppings.Items(i).Selected = False
            End If
        Next i

    End Sub

End Class