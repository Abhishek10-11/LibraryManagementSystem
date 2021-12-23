<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="LibraryManagementSystem.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    
    <br />
    <br />
   
    <div class="container">
        <div class="row">
            <div class="col-md-5 mx-auto">
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
                                    <h3>Login</h3>
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
                                <label>Email Id:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtEmailId" runat="server" CssClass="form-control"
                                        placeholder="Enter Email Id..." TextMode="Email"></asp:TextBox>
                                </div>
                                <label>Password:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control"
                                        placeholder="Enter Password..." TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success btn-block btn-lg" Text="Login" OnClick="btnLogin_Click"/>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnSignup" runat="server" PostBackUrl="~/SignUp.aspx"
                                        CssClass="btn btn-info btn-block btn-lg" Text="Sign Up"/>
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
