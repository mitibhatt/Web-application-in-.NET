<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
          <header style="font-size:x-large; font-weight :200">Developer Forum </header>
    <div style="align-self:auto; padding-top:100px; padding-left :300px">
  
        <table style="align-self:center ">
            <tr>
                <td >
                    <asp:Label ID="LblUsername" runat="server" Text="User name:" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtUSername" runat="server" Width="240px"></asp:TextBox>
                    </td>
            
                <td style="padding-left:20px">
                   
                    <asp:Button ID="BtnContinue" runat="server" Text="Go" Width="52px" OnClick="BtnContinue_Click" />
                   </td>
            </tr>
           
            </table>
         <table style="align-self:center">
               <tr>
              <td>
                    <asp:Label ID="LblMsg" runat="server" Text="" Visible="false" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                </td>
                    </tr>
        </table>
      
        
    </div>
</asp:Content>

