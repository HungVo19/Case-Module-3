<%@ page import="com.example.online_electronics_store.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>GRONE Admin Dashboard</title>
    <link rel="icon" type="image/x-icon" href="/admin/assets/img/favicon.ico"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link href="/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="/admin/plugins/table/datatable/datatables.css">
    <link rel="stylesheet" type="text/css" href="/admin/plugins/table/datatable/custom_dt_customer.css">
    <!-- END PAGE LEVEL CUSTOM STYLES -->

    <link rel="stylesheet" type="text/css" href="cdn.jsdelivr.net/npm/sweetalert2@11.6.15/dist/sweetalert2.min.css">
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body>


<!--  BEGIN NAVBAR  -->
<header class="header navbar fixed-top navbar-expand-sm">
    <a href="javascript:void(0);" class="sidebarCollapse d-none d-lg-block" data-placement="bottom"><i
            class="flaticon-menu-line-2"></i></a>

    <ul class="navbar-nav flex-row ml-lg-auto">

        <li class="nav-item dropdown user-profile-dropdown ml-lg-0 mr-lg-2 ml-3 order-lg-0 order-1">
            <a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <a href="${pageContext.request.contextPath}/user?action=showAdminDashboard" aria-expanded="true" class="dropdown-toggle">
                        <div class="">
                            <i class="flaticon-computer-6 ml-3"></i>
                            <span>Dashboard</span>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled show" id="dashboard" data-parent="#accordionExample">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/product?action=viewByAdmin"> <i
                                    class="flaticon-package"></i> Product </a>
                        </li>
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/user?action=viewByAdmin"> <i class="flaticon-user-1"></i> User </a>
                        </li>
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/category?action=viewByAdmin"> <i class="flaticon-menu-dot-fill"></i> Category </a>
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
                            <li><a href="${pageContext.request.contextPath}/admin/index.jsp"><i
                                    class="flaticon-home-fill"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/user?action=showAdminDashboard">Dashboard</a></li>
                            <li><a href="#" style="font-weight: bold">Product</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="statbox widget box box-shadow">
                <div class="widget-header">
                    <div class="row">
                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                            <h4></h4>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <a href="#addProductModal" class="btn btn-success" data-toggle="modal"><i
                                class="flaticon-plus">&#xE147;</i>
                            <span>Add New</span></a>
                    </div>
                </div>
            </div>

            <div class="widget-content widget-content-area">
                <div class="table-responsive mb-4">
                    <table id="customer-info-detail-3" class="table style-3 table-bordered  table-hover">
                        <thead>
                        <tr>
                            <th class="text-center"> Record Id</th>
                            <th class="align-center">Image</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th class="align-center">Stock Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <td class="text-center" style="width: 50px">
                                    <c:out value="${p.getId()}"/>
                                </td>
                                <td class="align-center">
                                    <span><img style="height: 60px;width: 60px"
                                               src="${pageContext.request.contextPath}/${p.getImage()}"
                                               class="" alt="profile">
                                    </span>
                                </td>
                                <td style="width: 100px"><c:out value="${p.getName()}"/></td>
                                <td><c:out value="${p.getPrice()}"/></td>
                                <td style="width: 250px"><c:out value="${p.getDescription()}"/></td>
                                <td><c:out value="${p.getCategory().getName()}"/></td>
                                <td class="align-center">
                                    <c:if test="${p.isStockStatus()}">
                                        <span class="shadow-none badge badge-success">In Stock</span>
                                    </c:if>
                                    <c:if test="${!p.isStockStatus()}">
                                        <span class="shadow-none badge badge-danger">Out Stock</span>
                                    </c:if>
                                </td>
                                <td class="align-center">
                                    <ul class="table-controls">
                                        <li><a href="#v${p.getId()}" data-toggle="modal" title="View"
                                               data-original-title="Settings"><i data-toggle="tooltip"
                                                                                 class="flaticon-settings-4  bg-primary p-1 text-white br-6 mb-1"></i></a>
                                        </li>
                                        <li><a href="#e${p.getId()}" data-toggle="modal" data-placement="top" title=""
                                               data-original-title="Edit"><i
                                                class="flaticon-edit  bg-success p-1 text-white br-6 mb-1"></i></a>
                                        </li>
                                        <li><a href="#d${p.getId()}" data-toggle="modal" data-placement="top" title=""
                                               data-original-title="Delete"><i
                                                class="flaticon-delete  bg-danger p-1 text-white br-6 mb-1"></i></a>
                                        </li>
                                    </ul>
                                </td>
                                <div id="v${p.getId()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Product Information</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">&times;
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="align-center">
                                                    <img src="${pageContext.request.contextPath}/${p.getImage()}"
                                                         class="" alt="profile">
                                                </div>
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" class="form-control"
                                                           value="${p.getName()}" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label>Price</label>
                                                    <input type="text" class="form-control"
                                                           value="${p.getPrice()}$" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <textarea class="form-control" name="description" rows="5" readonly>
                                                            ${p.getDescription()}
                                                    </textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>Stock Status</label>
                                                    <c:if test="${p.isStockStatus()}">
                                                        <input type="text" class="form-control" value="In Stock"
                                                               readonly>
                                                    </c:if>
                                                    <c:if test="${!p.isStockStatus()}">
                                                        <input type="text" class="form-control"
                                                               value="Out of Stock" readonly>
                                                    </c:if>
                                                </div>
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <input type="text" class="form-control"
                                                           value="${p.getCategory().getName()}" readonly>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="button" class="btn btn-info" data-dismiss="modal"
                                                       value="Close">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="e${p.getId()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="${pageContext.request.contextPath}/product?action=update"
                                                  method="post" id="formEdit${p.getId()}">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Update Product</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <input type="hidden" name="id" value="${p.getId()}">
                                                <div class="modal-body">
                                                        <%--                                                <div class="align-center">--%>
                                                        <%--                                                    <img src="${pageContext.request.contextPath}/${p.getImage()}"--%>
                                                        <%--                                                         class="" alt="profile">--%>
                                                        <%--                                                </div>--%>
                                                    <div class="form-group">
                                                        <label>Name</label>
                                                        <input type="text" name="name" class="form-control"
                                                               value="${p.getName()}" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Price</label>
                                                        <input type='number' step='0.01' name="price"
                                                               class="form-control"
                                                               value="${p.getPrice()}" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <textarea class="form-control" name="description" rows="5"
                                                                  required>
                                                                ${p.getDescription()}
                                                        </textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Image</label>
                                                        <input type="text" class="form-control" name="image"
                                                               value="${p.getImage()}" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Stock Status</label>
                                                        <select name="stock" class="form-control">
                                                            <c:if test="${p.isStockStatus()}">
                                                                <option value="true">In Stock</option>
                                                                <option value="false">Out of Stock</option>
                                                            </c:if>
                                                            <c:if test="${!p.isStockStatus()}">
                                                                <option value="false">Out of Stock</option>
                                                                <option value="true">In Stock</option>
                                                            </c:if>

                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Category</label>
                                                        <select name="category" class="form-control">
                                                            <c:forEach items="${categories}" var="c">
                                                                <c:if test="${c.getId() != p.getCategory().getId()}">
                                                                    <option value="${c.getId()}"><c:out
                                                                            value="${c.getName()}"/></option>
                                                                </c:if>
                                                                <c:if test="${c.getId() == p.getCategory().getId()}">
                                                                    <option selected value="${c.getId()}"><c:out
                                                                            value="${c.getName()}"/></option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal"
                                                           value="Cancel">
                                                    <input type="submit" class="btn btn-success" value="Save" id="edit${p.getId()}">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div id="d${p.getId()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="${pageContext.request.contextPath}/product?action=delete"
                                                  method="post" id="formDelete${p.getId()}">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Delete Product</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <input type="hidden" name="id" value="${p.getId()}">
                                                <div class="modal-body">
                                                    <p>Are you sure you want to delete this Product ?</p>
                                                    <p class="text-warning"><small>This action cannot be undone.</small>
                                                    </p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal"
                                                           value="Cancel">
                                                    <input type="submit" class="btn btn-danger" value="Delete"
                                                           id="delete${p.getId()}">
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </tr>
                            <script>
                                document.querySelector('#edit${p.getId()}').addEventListener('click', (event) => {
                                    event.preventDefault();
                                    let timerInterval
                                    Swal.fire({
                                        title: 'Update Successfully!',
                                        icon: 'success',
                                        html: 'Loading page ...',
                                        timer: 2500,
                                        timerProgressBar: true,
                                        didOpen: () => {
                                            Swal.showLoading()
                                            const b = Swal.getHtmlContainer().querySelector('b')
                                            timerInterval = setInterval(() => {
                                                b.textContent = Swal.getTimerLeft()
                                            }, 100)
                                        },
                                        willClose: () => {
                                            clearInterval(timerInterval)
                                        }
                                    }).then((result) => {
                                        /* Read more about handling dismissals below */
                                        document.querySelector('#formEdit${p.getId()}').submit();
                                    })
                                })

                                document.querySelector('#delete${p.getId()}').addEventListener('click', (event) => {
                                    event.preventDefault();
                                    let timerInterval
                                    Swal.fire({
                                        title: 'Delete Successfully!',
                                        icon: 'success',
                                        html: 'Loading page ...',
                                        timer: 2500,
                                        timerProgressBar: true,
                                        didOpen: () => {
                                            Swal.showLoading()
                                            const b = Swal.getHtmlContainer().querySelector('b')
                                            timerInterval = setInterval(() => {
                                                b.textContent = Swal.getTimerLeft()
                                            }, 100)
                                        },
                                        willClose: () => {
                                            clearInterval(timerInterval)
                                        }
                                    }).then((result) => {
                                        /* Read more about handling dismissals below */
                                        document.querySelector('#formDelete${p.getId()}').submit();
                                    })
                                })
                            </script>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <!--  END CONTENT PART  -->
</div>
<!-- END MAIN CONTAINER -->
<!-- Ad Modal -->
<div id="addProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/product?action=create" method="post" id="formCreate">
                <div class="modal-header">
                    <h4 class="modal-title">Add Products</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type='number' step='0.01' class="form-control" name="price" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" name="description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <input type="text" class="form-control" name="image" required>
                    </div>
                    <div class="form-group">
                        <label>Stock Status</label>
                        <select name="stock" class="form-control">
                            <option value="true">In Stock</option>
                            <option value="false">Out of Stock</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select name="category" class="form-control">
                            <c:forEach items="${categories}" var="c">
                                <option id="${c.getId()}" value="${c.getId()}">${c.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add" id="add">
                </div>
            </form>
        </div>
    </div>
</div>
<!--  BEGIN FOOTER  -->
<footer class="footer-section theme-footer">

    <div class="footer-section-1  sidebar-theme">

    </div>

    <div class="footer-section-2 container-fluid">
        <div class="row">
            <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                <ul class="list-inline mb-0 d-flex justify-content-sm-end justify-content-center mr-sm-3 ml-sm-0 mx-3">
                    <li class="list-inline-item  mr-3">
                        <p class="bottom-footer">&#xA9; 2022 <a target="_blank" href="../shop/index.jsp">GRONE HOME </a>
                        </p>
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
<script src="/admin/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="/admin/bootstrap/js/popper.min.js"></script>
<script src="/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="/admin/plugins/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/admin/assets/js/app.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<script>
    $(document).ready(function () {
        App.init();
    });
</script>
<script src="/admin/assets/js/custom.js"></script>
<!-- END GLOBAL MANDATORY SCRIPTS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/admin/plugins/table/datatable/datatables.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
    // var e;
    c1 = $('#customer-info-detail-1').DataTable({
        "lengthMenu": [5, 10, 20, 50, 100],
        headerCallback: function (e, a, t, n, s) {
            e.getElementsByTagName("th")[0].innerHTML = '<label class="new-control new-checkbox checkbox-outline-primary m-auto">\n<input type="checkbox" class="new-control-input chk-parent select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
        },
        columnDefs: [{
            targets: 0, width: "30px", className: "", orderable: !1, render: function (e, a, t, n) {
                return '<label class="new-control new-checkbox checkbox-outline-primary  m-auto">\n<input type="checkbox" class="new-control-input child-chk select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
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
        "lengthMenu": [5, 10, 20, 50, 100],
        headerCallback: function (e, a, t, n, s) {
            e.getElementsByTagName("th")[0].innerHTML = '<label class="new-control new-checkbox checkbox-outline-primary m-auto">\n<input type="checkbox" class="new-control-input chk-parent select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
        },
        columnDefs: [{
            targets: 0, width: "30px", className: "", orderable: !1, render: function (e, a, t, n) {
                return '<label class="new-control new-checkbox checkbox-outline-primary  m-auto">\n<input type="checkbox" class="new-control-input child-chk select-customers-info" id="customer-all-info">\n<span class="new-control-indicator"></span><span style="visibility:hidden">c</span>\n</label>'
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
        "lengthMenu": [5, 10, 20, 50, 100],
        "language": {
            "paginate": {
                "previous": "<i class='flaticon-arrow-left-1'></i>",
                "next": "<i class='flaticon-arrow-right'></i>"
            },
            "info": "Showing page _PAGE_ of _PAGES_"
        }
    });

    multiCheck(c3);

    document.querySelector('#add').addEventListener('click', (event) => {
        event.preventDefault();
        // Swal.fire({
        //     position: 'top-end',
        //     icon: 'success',
        //     title: 'Your work has been saved',
        //     // showConfirmButton: true,
        //     timer: 3500
        // }).then((result)=>{
        //     document.querySelector('#formCreate').submit();
        // })

        let timerInterval
        Swal.fire({
            title: 'Create Successfully!',
            icon: 'success',
            html: 'Loading page ...',
            timer: 2500,
            timerProgressBar: true,
            didOpen: () => {
                Swal.showLoading()
                const b = Swal.getHtmlContainer().querySelector('b')
                timerInterval = setInterval(() => {
                    b.textContent = Swal.getTimerLeft()
                }, 100)
            },
            willClose: () => {
                clearInterval(timerInterval)
            }
        }).then((result) => {
            /* Read more about handling dismissals below */
            document.querySelector('#formCreate').submit();
        })
    })


</script>
<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>