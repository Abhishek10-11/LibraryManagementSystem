<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageMember.aspx.cs" Inherits="LibraryManagementSystem.Admin.ManageMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-wrapper">
    <br />
            <div class="container-fluid">
      <div class="row">
         <div class="col-md-6">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Member Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="../img/user.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <label>Member ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TxtMID" runat="server" placeholder="Member ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="btnGo" runat="server" OnClick="btnGo_Click">Go</asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     
                  </div>
                   <div class="row">
                       <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtFName" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Account Status</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control mr-1" ID="TxtAStatus" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                              <asp:LinkButton class="btn btn-success mr-1" ID="btnActive" runat="server" OnClick="btnActive_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                              <asp:LinkButton class="btn btn-warning mr-1" ID="btnPending" runat="server" OnClick="btnPending_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                              <asp:LinkButton class="btn btn-danger mr-1" ID="btnDelete" runat="server" OnClick="btnDelete_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                   </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtDOB" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtCno" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtEmailID" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtState" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtCity" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Pin Code</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtPin" runat="server" placeholder="Pin Code" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Full Postal Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtAddress" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <asp:Button ID="btnDel" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="btnDel_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="AdminHomePage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-6">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Member List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridMemberDetails" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                <asp:BoundField DataField="email" HeaderText="Email Id" SortExpression="email" />
                                <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                            </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AM_LibraryConnectionString %>" SelectCommand="SELECT [full_name], [email], [full_address], [member_id], [account_status] FROM [member_master_tbl]"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
            </div>
</asp:Content>
