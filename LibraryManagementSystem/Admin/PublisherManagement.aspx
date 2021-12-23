<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PublisherManagement.aspx.cs" Inherits="LibraryManagementSystem.Admin.PublisherManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
    <br />
   
        <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher Details</h4>
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
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Publisher ID:</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TxtPublisherID" runat="server" CssClass="form-control"
                                        placeholder="Enter ID..."></asp:TextBox>
                                    <asp:Button ID="btnpubGo" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="btnpubGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Publisher Name:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtPubName" runat="server" CssClass="form-control"
                                       placeholder="Publisher Name..."></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAddpub" runat="server" Text="Add" CssClass="btn btn-lg btn-block btn-success" OnClick="btnAddpub_Click"  />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnupdatepub" runat="server" Text="Update" CssClass="btn btn-lg btn-block btn-warning" OnClick="btnupdatepub_Click"  />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="btndeletepub" runat="server" Text="Delete" CssClass="btn btn-lg btn-block btn-danger" OnClick="btndeletepub_Click"  />
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
                                    <h3>Publisher Details</h3>
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
                                <asp:GridView ID="GridPublisherInfo" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Publisher_id" HeaderText="Publisher_id" ReadOnly="True" SortExpression="Publisher_id" />
                                        <asp:BoundField DataField="Publisher_name" HeaderText="Publisher_name" SortExpression="Publisher_name" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AM_LibraryConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
               
        </div>
    </div>
        </div>

</asp:Content>
