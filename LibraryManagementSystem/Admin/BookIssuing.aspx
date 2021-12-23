<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BookIssuing.aspx.cs" Inherits="LibraryManagementSystem.Admin.BookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
    <br />
   
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../img/book.jpg" />
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
                                <label>Member ID:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtMemberID" runat="server" CssClass="form-control"
                                        placeholder="Enter ID..."></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Id:</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TxtBookID" runat="server" CssClass="form-control"
                                       placeholder="Book ID..."></asp:TextBox>
                                        <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="btn btn-primary"/>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                       
                         <div class="row">
                            <div class="col-md-6">
                                <label>Member Name:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtMName" runat="server" CssClass="form-control"
                                        placeholder="Member Name..." ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name:</label>
                                <div class="form-group">
                                        <asp:TextBox ID="TxtBName" runat="server" CssClass="form-control"
                                       placeholder="Book Name..." ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                
                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Date:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtStartDate" runat="server" CssClass="form-control"
                                        TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>End Date:</label>
                                <div class="form-group">
                                        <asp:TextBox ID="TxtEndDate" runat="server" CssClass="form-control"
                                       TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="btnIssue" runat="server" Text="Issue" CssClass="btn btn-lg btn-block btn-primary" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="btnDelete" runat="server" Text="Return" CssClass="btn btn-lg btn-block btn-success" />
                            </div>

                        </div>
                    </div>

                </div>
                     <a href="AdminHomePage.aspx"> << Back to Home...</a>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Issued Book List</h3>
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
                                <asp:GridView ID="GridPublisherInfo" CssClass="table table-striped table-bordered" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
               
        </div>
    </div>
        </div>

</asp:Content>
