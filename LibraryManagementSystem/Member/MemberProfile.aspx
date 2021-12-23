<%@ Page Title="" Language="C#" MasterPageFile="~/Member/Member.Master" AutoEventWireup="true" CodeBehind="MemberProfile.aspx.cs" Inherits="LibraryManagementSystem.Member.MemberProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../img/user.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span>Account Status - </span>
                                    <asp:Label ID="status" runat="server" Text="Your Status" 
                                        CssClass="badge badge-pill badge-info"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtFullname" runat="server" CssClass="form-control"
                                        placeholder="Enter Fullname..."></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date Of Birth:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtDob" runat="server" CssClass="form-control"
                                        TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact No:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtCno" runat="server" CssClass="form-control"
                                        placeholder="Enter Contact Number..." TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email Address:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control"
                                        TextMode="Email" placeholder="Enter Email Address..."></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State:</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="Drpstate" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" value="Select" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtCity" runat="server" CssClass="form-control"
                                        placeholder="Enter City..."></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pincode:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Txtpin" runat="server" CssClass="form-control"
                                        TextMode="Number" placeholder="Enter pincode..."></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Full Address:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control"
                                        placeholder="Enter Address..." TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Label ID="Label1" runat="server" Text="Login Credentials" 
                                        CssClass="badge badge-pill badge-info"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>User Id:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtUID" runat="server" CssClass="form-control"
                                        TextMode="Email" ReadOnly></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtOldpass" runat="server" CssClass="form-control"
                                        TextMode="Password" ReadOnly></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <label>New Password:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtNpass" runat="server" CssClass="form-control"
                                        placeholder="Enter New Password..." TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <center>
                                
                            <div class="col-8">
                                <div class="form-group">
                                    <asp:Button ID="btnSignup" runat="server"
                                        CssClass="btn btn-primary btn-block btn-lg" Text="Update"/>
                                </div>
                                </div>
                                </center>
                            
                        </div>
                    </div>
                </div>
                 <a href="Homepage.aspx"> << Back to Home...</a>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../img/book.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Book Issued Book</h3>
                                    <asp:Label ID="bookissued" runat="server" Text="Your Book Info" 
                                        CssClass="badge badge-pill badge-info"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridBookInfo" CssClass="table table-striped table-bordered" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
               
        </div>
    </div>
</asp:Content>
