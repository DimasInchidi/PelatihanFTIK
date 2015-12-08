<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="servlet.FBConnection" %>
<%@ page import="servlet.FBGraph" %>
<%@ page import="java.util.Map" %>
<%@ page import="servlet.F_Koneksi" %>
<%
    String code, aksi;
    FBConnection fbConnection = new FBConnection();
    code = request.getParameter("code");
    String url = fbConnection.getFBAuthUrl();
    if (code == null || code.equals("")) {
        response.sendRedirect(url);
    } else{
        String accessToken = fbConnection.getAccessToken(code);
        FBGraph fbGraph = new FBGraph(accessToken);
        String graph = fbGraph.getFBGraph();
        Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
        F_Koneksi Koneksi = new F_Koneksi();
        String query = "SELECT * FROM datauser WHERE userid = '"+fbProfileData.get("id")+"';";
        if (Koneksi.SelectCheck(query)){
            response.sendRedirect("/Thanks");
        }else{
%>
<!DOCTYPE html>
<html lang="en">

<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Halaman pendaftaran pelatihan @ FTIK Unmul 2015">
    <meta name="author" content="DimasInchidi">
    <link rel="shortcut icon" href="img/favicon.ico">

    <title>Pendaftaran pelatihan</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                            <div class="col-lg-2 -align-center">
                                <img class="col-lg-12" src="http://graph.facebook.com/<%=fbProfileData.get("id")%>/picture">
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                            <div class="col-lg-10">
                                <form role="form" name="FormDaftar" action="${pageContext.request.contextPath}/Daftar" method="POST">
                                    <div class="form-group">
                                        <input class="hidden" name="ID" value="<%=fbProfileData.get("id")%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Nama Lengkap</label>
                                        <input class="form-control" name="Nama">
                                        <p class="help-block">Nama Lengkap sesuai KTM yah jangan AckhuCayankNdu2ut.</p>
                                    </div>
                                    <div class="form-group">
                                        <label>NIM</label>
                                        <input class="form-control" name="NIM">
                                        <p class="help-block">Nomer Induk Mahasiswa atau Nomer Induk Pegawai</p>
                                    </div>
                                    <div class="form-group">
                                        <label>IDE</label>
                                        <select class="form-control" name="IDE">
                                            <option>Intellij</option>
                                            <option>Netbeans</option>
                                            <option>Eclipse</option>
                                            <option>Text Editor (such as: notepad/gedit, Sublime, etc)</option>
                                        </select>
                                        <p class="help-block">IDE yang kamu gunakan.</p>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input class="form-control" name="HP">
                                        <p class="help-block">Nomer handphone yang aktif dan kalau bisa bukan perdana paketan <b>please</b></p>
                                    </div>
                                    <div class="form-group">
                                        <label>Testimoni</label>
                                        <textarea class="form-control" rows="3" name="Testi"></textarea>
                                        <p class="help-block">Kepo dikit, singkat aja kenapa anda mengikuti pelatihan ini :3</p>
                                    </div>

                                    <div class="form-group">
                                        <label>
                                            <p class="help-block">Dengan ini setelah anda menekan tombol Selesai, anda menyatakan bahwa telah mengisi data di atas secara benar.
                                                Anda juga menyatakan bahwa anda mengikuti pelatihan ini. Biar tambah gimana gitu anda juga berusaha agar tidak terlambat saat pelatihan.
                                            </p>
                                            <div class="checkbox">
                                                <label>
                                                    <input value="true" type="checkbox">Setuju
                                                </label>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <input class="hidden" name="URL" value="<%=request.getRequestURL()%>">
                                    </div>
                                    <br>
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
<%
    if (session.getAttribute("fail").equals("insert")){%>
<div style="display: none;" class="modal fade in" id="fail" tabindex="-1" role="dialog" aria-labelledby="myModalLabelinsert" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="false">×</button>
                <h4 class="modal-title" id="myModalLabelinsert">Pendaftaran Gagal</h4>
            </div>
            <div class="modal-body">
                Terjadi kesalahan dalam koneksi ke database. Silahkan koneksi anda atau hubungi:
                Dimas Ari 0812 7777 9663
                Godefridus Jeno 0852 4619 2158
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
    <%} else if(session.getAttribute("fail").equals("param")){%>
<div style="display: none;" class="modal fade in" id="fail" tabindex="-1" role="dialog" aria-labelledby="myModalLabelparam" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="false">×</button>
                <h4 class="modal-title" id="myModalLabelparam">Pendaftaran Gagal</h4>
            </div>
            <div class="modal-body">
                Terjadi kesalahan dalam pendaftaran anda. Silahkan periksa data anda kembali atau hubungi:<br>
                Dimas Ari 0812 7777 9663<br>
                Godefridus Jeno 0852 4619 2158
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
    <%}%>

<script type="text/javascript">
    function checkInp()
    {
        var x=document.forms["FormDaftar"]["NIM"].value;
        if (isNaN(x))
        {
            alert("NIM Angka yak");
            return false;
        }
    }
</script>
</body>
</html>
<%
        }
    }
%>