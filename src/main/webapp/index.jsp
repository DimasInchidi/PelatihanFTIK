<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="servlet.FBConnection" %>
<%@ page import="servlet.FBGraph" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%
        String code="";
        FBConnection fbConnection = new FBConnection();
        code = request.getParameter("code");
        String url = fbConnection.getFBAuthUrl();
        if (code == null || code.equals("")) {
            response.sendRedirect(url);
        }
        String accessToken = fbConnection.getAccessToken(code);
        FBGraph fbGraph = new FBGraph(accessToken);
        String graph = fbGraph.getFBGraph();
        Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
    %>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Halaman pendaftaran pelatihan @ FTIK Unmul 2015">
    <meta name="author" content="DimasInchidi">

    <title>Pendaftaran pelatihan</title>

    <!-- Bootstrap Core CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://ironsummitmedia.github.io/startbootstrap-sb-admin-2/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <div id="wrapper">
        <div id="page-wrapper">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Pendaftaran Pelatihan Session 1</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Formulir Pendaftaran
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 -align-center">
                                    <img class="col-lg-6" src="http://graph.facebook.com/<%=fbProfileData.get("id")%>/picture">
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    <form role="form">

                                        <button type="submit" class="btn btn-default">Selesai</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

        </div>
    </div>
</body>

</html>
