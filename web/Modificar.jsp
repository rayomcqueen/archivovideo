<%-- 
    Document   : Modificar
    Created on : 25-jun-2016, 0:17:02
    Author     : CristianFaune
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/nuevosEstilos.css">
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <title>Sistema archivo video</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10" id="margen-menu">
                    <h2 id="titulos">Bienvenido</h2> 
                    <p id="parrafo"><c:out value="${usuarioSesion.nombres} ${usuarioSesion.apellidos}"/></p>

                    <p  class="text-right"id="parrafo">
                        <a href="<c:url value="index.jsp"/>">cerrar sesión</a>
                    </p>
                    <br>
                    <div class="centered-pills">
                        <ul class="nav nav-pills">
                            <li role="presentation"><a href="<c:url value="Menu.jsp"/>">Inicio</a></li>
                            <li role="presentation"><a href="<c:url value="RegistroVideoServlet"/>">Registro Video</a></li>
                            <li role="presentation"><a href="<c:url value="ConsultaServlet"/>">Consulta</a></li>
                        </ul>
                    </div>
                    <hr>
                    <br>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <c:if test="${not empty mensaje}">
                    <div class="alert alert-success" role="alert">
                        <p class="text-success text-center"><c:out value="${mensaje['mensajeExito']}"/></p>
                    </div>
                </c:if>
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br>
                    <h4 class="text-center">Modifica la información del video</h4>
                    <br><br>
                    <label>Categoría de video:</label>
                    <form action="<c:url value="ModificarServlet"/>" method="post">
                        <select class="form-control" name="categoria">
                            <option value="0">--seleccione categoría--</option>
                            <c:forEach var="dato" items="${lstCategoria}">
                                <option value="${dato.idCategoria}" ${dato.idCategoria == video.idCategoria ? 'selected="selected"' : ''}>
                                    <c:out value="${dato.descripcion}"></c:out>
                                    </option>
                            </c:forEach>
                        </select>
                        <br>
                        <div>
                            <label>Nombre:</label>
                            <input class="form-control" type="text" name="nombre"
                                   value="<c:out value="${video.nombre}"/>">                               
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Horas:</label>
                                <input class="form-control" type="number" name="horas" placeholder="00" min="00"
                                       value="<c:out value="${horas}"/>">

                            </div>
                            <div class="col-md-3">
                                <label>Minutos:</label>
                                <input class="form-control" type="number" name="minutos" placeholder="00" min="00" max="59"
                                       value="<c:out value="${minutos}"/>">

                            </div>
                            <div class="col-md-3">
                                <label>Segundos:</label>
                                <input class="form-control" type="number" name="segundos" placeholder="00" min="" max="59"
                                       value="<c:out value="${segundos}"/>">

                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-8">
                                <label>Fecha Origen:</label>
                                <input class="form-control" type="date" name="fechaOrigen"
                                       value="<c:out value="${video.fechaOrigen}"/>">

                            </div>
                        </div>
                        <br>
                        <label>Resolución de video:</label>
                        <form action="<c:url value="RegistroVideoServlet"/>" method="post">
                            <select class="form-control" name="resolucion">
                                <option value="0">--seleccione resolución--</option>
                                <c:forEach var="dato" items="${lstResolucion}">
                                    <option value="${dato.idResolucion}" ${dato.idResolucion == video.idResolucion ? 'selected="selected"' : ''}>
                                        <c:out value="${dato.idResolucion} ${dato.descripcion}"></c:out>
                                        </option>
                                </c:forEach>
                            </select>
                            <br>
                            <label>Descripción:</label>
                            <p id="info">(puedes escribir palabras claves que te ayuden a su posterior búsqueda)</p>
                            <textarea class="form-control" rows="6" name="descripcion"><c:out value="${video.descripcion}"/></textarea>
                            <br><br>
                            <input type="hidden" name="idVideo" value="${video.idVideo}"/>
                            <button type="submit" class="btn btn-primary btn-block">Actualizar</button>
                        </form>
                </div>
                <div class="col-md-4">
                </div>
            </div>
        </div>
    </body>
</html>
