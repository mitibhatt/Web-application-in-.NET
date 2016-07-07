<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrmQuestions.aspx.cs" Inherits="FrmQuestions" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <header style="font-size:x-large; font-weight :200">Questions</header>
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
         width: 600px;
        height: 300px;
    }
</style>
    <script type="text/javascript">
       jQuery(document).ready(function()
        {
                var d = new Date();
                d = d.getTime();
                if (jQuery('#reloadValue').val().length == 0)
                {
                        jQuery('#reloadValue').val(d);
                        jQuery('body').show();
                }
                else
                {
                        jQuery('#reloadValue').val('');
                        location.reload();
                }
        });
   </script>
    <div style="padding-top :20px">
        
       <table style="width:100%; padding-top :10px" >
           <tr>
               <td style="width:100%">
                     <asp:Button ID="BtnAddQuestion" runat="server" Text="Post question" OnClick="BtnAddQuestion_Click" Width="215px" Font-Bold ="true" />
                     <br />
                     <br />
                    
                   <asp:GridView ID="GvQuestions" runat="server" AutoGenerateColumns="False" Width="100%" word-wrap= "break-word" table-layout="fixed" HorizontalAlign="Justify" Height="180px">
                          <Columns>
        <asp:TemplateField HeaderText = "Question" ItemStyle-Width="70%">
            <ItemTemplate>
                <asp:HyperLink ID ="HpQuestions" runat="server" Text='<%# Eval("question") %>' NavigateUrl='<%# "~/FrmPostAnswer.aspx?questionid="+Eval("questionid") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    
       <asp:TemplateField HeaderText = "Total answers"  ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:HyperLink ID ="HpAnswernum" runat="server" Text='<%# Eval("num") %>'/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText = "Question related to"  ItemStyle-Width="12%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
               <asp:Label ID="LblQueryRelatedto" runat="server" Text='<%# Eval("querydesc") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText = "Date and time"  ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
               <asp:Label ID="LblDatetime" runat="server" Text='<%# Eval("datetime") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                              </Columns>
                   </asp:GridView>
               </td>
           </tr>
           <input id="reloadValue" type="hidden" name="reloadValue" value="" />
       </table>
          <!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="BtnAddQuestion"
    CancelControlID="BtnClose" BackgroundCssClass ="modalBackground">
</cc1:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" style = "display:none;align-items :center">
    <table>
        <tr>
            <td>
                <asp:Label ID="LblDdlRelatedto" runat="server" Text="Query related to:" Font-Bold="true" Font-Size="Medium"></asp:Label>
            </td>
            <td>
              <asp:DropDownList ID="DdlRelatedto" runat="server" DataTextField="queryDesc" DataValueField="queryid" ></asp:DropDownList>
                    
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblPostQuestion" runat="server" Text="Post question:" Font-Bold="true"></asp:Label>
            </td>
            <td>
               <asp:TextBox id="TxtPostQuestion" TextMode="multiline" Columns="50" Rows="10" runat="server" Width="100%" />
                 <asp:RequiredFieldValidator ID="ValidateTxtPostQuestion" runat="server" ErrorMessage="Please enter question." ControlToValidate ="TxtPostQuestion" ValidationGroup="txtvalidate" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
    <table>
        <tr >
            
            <td style="padding-left:70px; padding-top:10px">
                <asp:Button ID="BtnPostQuestion" runat="server" Text="Post question" Width="216px" Height="28px" OnClick="BtnPostQuestion_Click"  ValidationGroup="txtvalidate"/>
            </td>
            <td style=" padding-top:10px">
                <asp:Button ID="BtnClose" runat="server" Text="Close" Width="216px" Height="28px"/>
            </td>
        </tr>
    </table>
    
</asp:Panel>
<!-- ModalPopupExtender -->
    </div>
  
</asp:Content>

