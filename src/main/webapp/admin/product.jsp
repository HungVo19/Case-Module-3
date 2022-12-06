<%@ page import="com.example.online_electronics_store.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Custom DataTables | Equation - Multipurpose Bootstrap Dashboard Template </title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css">
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/custom_dt_customer.css">
    <!-- END PAGE LEVEL CUSTOM STYLES -->
</head>
<body>


    <!--  BEGIN NAVBAR  -->
    <header class="header navbar fixed-top navbar-expand-sm">
        <a href="javascript:void(0);" class="sidebarCollapse d-none d-lg-block" data-placement="bottom"><i class="flaticon-menu-line-2"></i></a>

        <ul class="navbar-nav flex-row ml-lg-auto">

            <li class="nav-item dropdown user-profile-dropdown ml-lg-0 mr-lg-2 ml-3 order-lg-0 order-1">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="flaticon-user-12"></span>
                </a>
                <div class="dropdown-menu  position-absolute" aria-labelledby="userProfileDropdown">
                    <a class="dropdown-item" href="../shop/login-register.jsp">
                        <i class="mr-1 flaticon-power-button"></i> <span>Log Out</span>
                    </a>
                </div>
            </li>

        </ul>
    </header>
    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">
        <div class="overlay"></div>
        <div class="cs-overlay"></div>

        <!--  BEGIN SIDEBAR  -->

        <div class="sidebar-wrapper sidebar-theme">

            <div id="dismiss" class="d-lg-none"><i class="flaticon-cancel-12"></i></div>

            <nav id="sidebar">

                <ul class="navbar-nav theme-brand flex-row  d-none d-lg-flex">
                    <li class="nav-item theme-text">
                        <a href="index.jsp" class="nav-link"> GRONE </a>
                    </li>
                </ul>


                <ul class="list-unstyled menu-categories" id="accordionExample">
                    <li class="menu">
                        <a href="#dashboard"  aria-expanded="true" class="dropdown-toggle">
                            <div class="">
                                <i class="flaticon-computer-6 ml-3"></i>
                                <span>Dashboard</span>
                            </div>
                        </a>
                        <ul class="collapse submenu list-unstyled show" id="dashboard" data-parent="#accordionExample">
                            <li class="active">
                                <a href="index.jsp"> <i class="flaticon-package"></i> Product </a>
                            </li>
                            <li class="active">
                                <a href="index.jsp"> <i class="flaticon-user-1"></i> User </a>
                            </li>
                            <li class="active">
                                <a href="index.jsp"> <i class="flaticon-menu-dot-fill"></i> Category </a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </nav>

        </div>

        <!--  END SIDEBAR  -->

        <!--  BEGIN CONTENT PART  -->
        <div id="content" class="main-content">
            <div class="container">
                <div class="page-header">
                    <div class="page-title">
                        <h3>DataTables</h3>
                        <div class="crumbs">
                            <ul id="breadcrumbs" class="breadcrumb">
                                <li><a href="index.jsp"><i class="flaticon-home-fill"></i></a></li>
                                <li><a href="#">Dashboard</a></li>
                                <li><a href="#" style="font-weight: bold">Product</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row layout-spacing">
                    <div class="col-lg-12">
                        <div class="statbox widget box box-shadow">
                            <div class="widget-content widget-content-area">
                                <div class="table-responsive mb-4">
                                    <table id="customer-info-detail-3" class="table style-3 table-bordered  table-hover">
                                        <thead>
                                            <tr>
                                                <th class="checkbox-column text-center"> Record Id </th>
                                                <th class="align-center">Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Description</th>
                                                <th>Stock Status</th>
                                                <th class="align-center">Status</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${products}" var="p">
                                            <tr>
                                                <td class="align-center">
                                                    <span><img src="<c:out value="${p.getImage()}"/>" class="" alt="profile"></span>
                                                </td>
                                                <td><c:out value="${p.getName()}"/></td>
                                                <td><c:out value="${p.getPrice()}"/></td>
                                                <td><c:out value="${p.getDescription()}"/></td>
                                                <td><c:out value="${p.getDescription()}"/></td>
                                                <td class="align-center">
                                                    <c:if test="${p.isStockStatus()}">
                                                        <span class="shadow-none badge badge-success">In Stock</span>
                                                    </c:if>
                                                        <span class="shadow-none badge badge-warning">Out of Stock</span>
                                                </td>
                                                <td class="text-center">
                                                    <ul class="table-controls">
                                                        <li><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Settings"><i class="flaticon-settings-4  bg-primary p-1 text-white br-6 mb-1"></i></a> </li>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"><i class="flaticon-edit  bg-success p-1 text-white br-6 mb-1"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"><i class="flaticon-delete  bg-danger p-1 text-white br-6 mb-1"></i></a></li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--  END CONTENT PART  -->
    </div>
    <!-- END MAIN CONTAINER -->
    
    <!--  BEGIN FOOTER  -->
    <footer class="footer-section theme-footer">

        <div class="footer-section-1  sidebar-theme">

        </div>

        <div class="footer-section-2 container-fluid">
            <div class="row">
                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                    <ul class="list-inline mb-0 d-flex justify-content-sm-end justify-content-center mr-sm-3 ml-sm-0 mx-3">
                        <li class="list-inline-item  mr-3">
                            <p class="bottom-footer">&#xA9; 2022 <a target="_blank" href="../shop/index.jsp">GRONE HOME </a></p>
                        </li>
                        <li class="list-inline-item align-self-center">
                            <div class="scrollTop"><i class="flaticon-up-arrow-fill-1"></i></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--  END FOOTER  -->

    <!--  BEGIN CONTROL SIDEBAR  -->
    <!--  END CONTROL SIDEBAR  -->
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="assets/js/app.js"></script>
    
    <script>
        $(document).ready(function() {
            App.init();
        });
    </script>
    <script src="assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="plugins/table/datatable/datatables.js"></script>
    <script>
        // var e;
        c1 = $('#customer-info-detail-1').DataTable({
            "lengthMenu": [ 5, 10, 20, 50, 100 ],
            headerCallback:function(e, a, t, n, s) {
                e.getElementsByTagName("th")[0].innerHTML='<label class="new-control new-checkbox checkbox-outline-primary m-auto">\n<input type="checkbox" class="new-control-input chk-parent select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
            },
            columnDefs:[ {
                targets:0, width:"30px", className:"", orderable:!1, render:function(e, a, t, n) {
                    return'<label class="new-control new-checkbox checkbox-outline-primary  m-auto">\n<input type="checkbox" class="new-control-input child-chk select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
                }
            }],
            "language": {
                "paginate": {
                  "previous": "<i class='flaticon-arrow-left-1'></i>",
                  "next": "<i class='flaticon-arrow-right'></i>"
                },
                "info": "Showing page _PAGE_ of _PAGES_"
            }
        });

        multiCheck(c1);

        c2 = $('#customer-info-detail-2').DataTable({
            "lengthMenu": [ 5, 10, 20, 50, 100 ],
            headerCallback:function(e, a, t, n, s) {
                e.getElementsByTagName("th")[0].innerHTML='<label class="new-control new-checkbox checkbox-outline-primary m-auto">\n<input type="checkbox" class="new-control-input chk-parent select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
            },
            columnDefs:[ {
                targets:0, width:"30px", className:"", orderable:!1, render:function(e, a, t, n) {
                    return'<label class="new-control new-checkbox checkbox-outline-primary  m-auto">\n<input type="checkbox" class="new-control-input child-chk select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
                }
            }],
            "language": {
                "paginate": {
                  "previous": "<i class='flaticon-arrow-left-1'></i>",
                  "next": "<i class='flaticon-arrow-right'></i>"
                },
                "info": "Showing page _PAGE_ of _PAGES_"
            }
        });

        multiCheck(c2);

        c3 = $('#customer-info-detail-3').DataTable({
            "lengthMenu": [ 5, 10, 20, 50, 100 ],
            "language": {
                "paginate": {
                  "previous": "<i class='flaticon-arrow-left-1'></i>",
                  "next": "<i class='flaticon-arrow-right'></i>"
                },
                "info": "Showing page _PAGE_ of _PAGES_"
            }
        });

        multiCheck(c3);
    </script>
    <!-- END PAGE LEVEL SCRIPTS -->  
</body>
</html>