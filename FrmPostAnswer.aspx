<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrmPostAnswer.aspx.cs" Inherits="FrmPostAnswer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <header style="font-size:x-large; font-weight :200">Answers</header>
        <style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 550px;
        height: 300px;
    }
</style>
  

    <table style="width:100%; padding-top :10px" >
        
        <tr>
            <td style="padding-top :10px">
               <p> <asp:Label ID="LblQuestion" runat="server" Text="Label" Font-Bold="true" Font-Size="Medium"></asp:Label></p>
                <asp:Label ID="Lblmsg" runat="server" Text="Label" Visible ="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td  style="width:100%">
                  <asp:GridView ID="GvAnswers" runat="server" AutoGenerateColumns="False" Width="100%" word-wrap= "break-word" table-layout="fixed" HorizontalAlign="Justify" Height="180px">
             <Columns>
          <asp:TemplateField HeaderText = "Answer"  ItemStyle-Width="78%" >
            <ItemTemplate>
               <asp:Label ID="LblAnswer" runat="server" Text='<%# Eval("answer") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    <asp:TemplateField HeaderText = "Posted by"  ItemStyle-Width="10%" >
            <ItemTemplate>
               <asp:Label ID="LblAnswer" runat="server" Text='<%# Eval("Postedby") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                  <asp:TemplateField HeaderText = "Date and time"  ItemStyle-Width="15%">
            <ItemTemplate>
               <asp:Label ID="LblAnswer" runat="server" Text='<%# Eval("Datetime") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

                 </Columns>
                 </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width:100%; padding-top :10px">
                <asp:Button ID="BtnPostAnswer" runat="server" Text="Post answer" OnClick="BtnPostAnswer_Click" Width="215px" Font-Bold ="true" />
              
                
                <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="BtnBack_Click" Width="215px" Font-Bold ="true" />
                 <cc1:ModalPopupExtender ID="BtnPostAnswer_ModalPopupExtender" runat="server" PopupControlID="Panel1" TargetControlID="BtnPostAnswer"
    CancelControlID="BtnClose" BackgroundCssClass ="modalBackground">
</cc1:ModalPopupExtender>
            </td>
        </tr>
    </table>
                 <!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="BtnPostAnswer"
    CancelControlID="BtnClose" BackgroundCssClass ="modalBackground">
</cc1:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style = "display:none">
    <table>
         <tr>
            <td >
                <asp:Label ID="LblPostAnswer" runat="server" Text="Post answer:" Font-Bold="true"></asp:Label>
            </td>
            <td>
               <asp:TextBox id="TxtPostAnswer" TextMode="multiline" Columns="50" Rows="10" runat="server" Width="100%" />
               
           <asp:RequiredFieldValidator ID="ValidateTxtPostAnswer" runat="server" ErrorMessage="Please enter answer." ControlToValidate ="TxtPostAnswer" ValidationGroup="txtvalidate" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
                   
                </td>
        </tr>
        </table>
     <table style="align-self:center">
        </table>
    <table>
        <tr>
            
            <td style="padding-left:70px; padding-top:20px">
                <asp:Button ID="BtnAnswer" runat="server" text="Post answer" Width="216px" Height="28px" OnClick="BtnAnswer_Click" ValidationGroup="txtvalidate" />
                
            </td>
            <td style=" padding-top:20px">
                <asp:Button ID="BtnClose" runat="server" Text="Close" Width="216px" Height="28px"/>
            </td>
        </tr>
    </table>
    
   
</asp:Panel>
<!-- ModalPopupExtender -->
</asp:Content>

