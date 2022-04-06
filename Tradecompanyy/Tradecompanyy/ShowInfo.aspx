<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowInfo.aspx.cs" Inherits="Tradecompanyy.ShowInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="CustomersTable" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSourceCustomers">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                    <asp:BoundField DataField="YearOfBirth" HeaderText="Год рождения" SortExpression="YearOfBirth" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyyDBConnectionString %>" DeleteCommand="delete from Customers where Id=@Id" InsertCommand="insert into Customers (Name, Surname, YearOfBirth) values (@Name, @Surname, @YearOfBirth)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="update Customers set Name=@Name, Surname=@Surname, YearOfBirth=@YearOfBirth where Id=@Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="CustomersTable" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Surname" Name="Surname" PropertyName="Text" />
                    <asp:ControlParameter ControlID="YearOfBirth" Name="YearOfBirth" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="CustomersTable" Name="Name" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersTable" Name="Surname" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersTable" Name="YearOfBirth" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersTable" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="AddCustomer" runat="server" OnClick="AddCustomer_Click" Text="Добавить покупателя" />
&nbsp;<asp:Button ID="EditCustomers" runat="server" OnClick="EditCustomers_Click" Text="Редактировать покупателей" />
&nbsp;<asp:Button ID="DeleteCustomer" runat="server" OnClick="DeleteCustomer_Click" Text="Удалить покупателя" />
            <br />
            <br />
            <asp:Panel ID="PanelCustomer" runat="server" Visible="False">
                Имя:&nbsp;
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                <br />
                Фамилия:&nbsp;
                <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
                <br />
                Год рождения:&nbsp;
                <asp:TextBox ID="YearOfBirth" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="AddNewCustomer" runat="server" OnClick="AddNewCustomer_Click" Text="Добавить" />
                &nbsp;
                <asp:Button ID="CancelAddingCustomer" runat="server" OnClick="CancelAddingCustomer_Click" Text="Отмена" />
            </asp:Panel>
            <br />
            <asp:GridView ID="OrderTable" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceOrder">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Название товара" SortExpression="Title" />
                    <asp:BoundField DataField="IdCust" HeaderText="Номер заказчика" ReadOnly="True" SortExpression="IdCust" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Количество" SortExpression="Quantity" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyyDBConnectionString %>" DeleteCommand="delete from Orders where Id=@Id" InsertCommand="insert into Orders (Title, IdCust, Price, Quantity) values (@Title, @IdCust, @Price, @Quantity)" SelectCommand="SELECT * FROM [Orders] WHERE ([IdCust] = @IdCust)" UpdateCommand="update Orders set Title=@Title, IdCust=@IdCust, Price=@Price, Quantity=@Quantity where Id=@Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="OrderTable" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="ProductName" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="CustomersTable" Name="IdCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="Price" Name="Price" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Amount" Name="Quantity" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="CustomersTable" Name="IdCust" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="OrderTable" Name="Title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersTable" Name="IdCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="OrderTable" Name="Price" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="OrderTable" Name="Quantity" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="OrderTable" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="AddOrder" runat="server" OnClick="AddOrder_Click" Text="Добавить заказ" Width="182px" />
&nbsp;
            <asp:Button ID="EditOrders" runat="server" OnClick="EditOrders_Click" Text="Редактировать заказы" />
&nbsp;
            <asp:Button ID="DeleteOrder" runat="server" OnClick="DeleteOrder_Click" Text="Удалить заказ" />
            <br />
            <br />
            <asp:Panel ID="OrdersPanel" runat="server" Visible="False">
                Название товара:
                <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
                <br />
                Цена:
                <asp:TextBox ID="Price" runat="server"></asp:TextBox>
                <br />
                Количество:
                <asp:TextBox ID="Amount" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="AddNewOrder" runat="server" OnClick="AddNewOrder_Click" Text="Добавить" />
                &nbsp;<asp:Button ID="CancelOrder" runat="server" OnClick="CancelOrder_Click" Text="Отменить" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
