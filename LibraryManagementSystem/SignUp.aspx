<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="LibraryManagementSystem.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br />
    
    <br />
    
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="img/user.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Registration</h3>
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
                                    <asp:DropDownList ID="Drpstate" CssClass="form-control" runat="server" AutoPostBack = "true" OnSelectedIndexChanged="Drpstate_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City:</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DrpCity" CssClass="form-control" runat="server" AutoPostBack = "true" >
                                    </asp:DropDownList>
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
                            <div class="col-md-6">
                                <label>Password:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Txtpass" runat="server" CssClass="form-control"
                                        placeholder="Enter Password..." TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Confirm Password:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtCpass" runat="server" CssClass="form-control"
                                        TextMode="Password" placeholder="Enter Confirm Password..."></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button ID="btnSignup" runat="server"
                                        CssClass="btn btn-success btn-block btn-lg" Text="Sign Up" OnClick="btnSignup_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <a href="Homepage.aspx"> << Back to Home...</a>
            </div>
               
        </div>
    </div>
</asp:Content>
