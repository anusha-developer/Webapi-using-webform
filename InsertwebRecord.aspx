<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertwebRecord.aspx.cs" Inherits="WebapiInsertFromWebform.InsertwebRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>
        function addEmpRecord() {
            var insert = {};
            insert.EmpName = $("#txtEmpName").val();
            insert.EmpEmailId = $("#txtEmpEmailId").val();
            insert.EmpPhoneno = $("#txtEmpPhoneno").val();
            insert.EmpAddress = $("#txtEmpAddress").val();
            $.ajax({
                url: "https://localhost:44365/api/Empinsert/Tbl_Employee1 ",
                type: "POST",
                contentType: "Application/json;charset=utf-8",
                data: JSON.stringify(insert),
                dataType: "json",
                success: function (responce)
                {
                    alert(responce)
                }

            });
        }
        $(document).ready(function () {
            $("#BtnSave").click(function (e) {
                addEmpRecord();
                e.preventDefault();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <div>
          <center>
                <h3>Consume webapi into webForm</h3>
                <hr />
                <table border="1">
                    <tr>
                        <td> EmpName</td>
                        <td><asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox></td>
                     </tr>
                     <tr>
                        <td> EmpEmailId</td>
                        <td><asp:TextBox ID="txtEmpEmailId" runat="server"></asp:TextBox></td>
                     </tr>
                     <tr>
                        <td> EmpPhoneno</td>
                        <td><asp:TextBox ID="txtEmpPhoneno" runat="server"></asp:TextBox></td>
                     </tr>
                     <tr>
                        <td> EmpAddress</td>
                        <td><asp:TextBox ID="txtEmpAddress" runat="server"></asp:TextBox></td>
                        </tr>
               
                    </table>
                    <asp:Button ID="BtnSave" runat="server" OnClick="BtnSave_Click" Text="Save"></asp:Button>
                     <br />
              <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="EmpName" HeaderText="EmpName" />
                    <asp:BoundField DataField="EmpEmailId" HeaderText="EmpEmailId" />
                    <asp:BoundField DataField="EmpPhoneno" HeaderText="EmpPhoneno" />
                    <asp:BoundField DataField="EmpAddress" HeaderText="EmpAddress" />
     
                </Columns>
            </asp:GridView>

              </center>
          <hr />
        </div>
    </form>
</body>
</html>
