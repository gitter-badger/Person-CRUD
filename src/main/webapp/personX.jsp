<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html>

            <head>
                <title>
                    Person CRUD - GNSMK
                </title>

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
            </head>

            <body>
                <div class="container well">
                    <c:if test="${empty newPerson}">
                        <form:form action="/add" method="post">
                            <div class="row">
                                <input style="margin: 1%" type="text" name="name" class="form-control col-4" placeholder="Person Name" autofocus required/>
                                <input style="margin: 1%" type="text" name="age" class="form-control col-4" placeholder="Person Age" required/>
                                <input style="margin: 1%" type="submit" class="btn btn-success btn-md col" value="Add Person" />
                            </div>
                        </form:form>
                    </c:if>
                    <c:if test="${!empty newPerson}">
                        <form:form action="/update" method="post">
                            <div class="row">
                                <input type="hidden" name="id" value=${newPerson.id} />
                                <input style="margin: 1%" type="text" name="name" class="form-control col-4" value="${newPerson.name}" autofocus required/>
                                <input style="margin: 1%" type="text" name="age" class="form-control col-4" value="${newPerson.age}" required/>
                                <input style="margin: 1%" type="submit" class="btn btn-primary btn-md col" value="Update Person" />
                            </div>
                        </form:form>
                    </c:if>
                </div>

                <hr/>

                <div class="container well">
                    <c:if test="${!empty list}">
                        <c:forEach items="${list}" var="x">
                            <div class="row">
                                <p style="margin: 1%" class="form-control col-4">${x.name}</p>
                                <p style="margin: 1%" class="form-control col-4">${x.age}</p>
                                <button style="margin: 1%" onclick="location.href='/edit/${x.id}';" class="btn btn-warning btn-md col">Edit</button>
                                <button style="margin: 1%" onclick="location.href='/delete/${x.id}';" class="btn btn-danger btn-md col">Delete</button>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty list}">
                        <p class="form-control col" style="text-align-last:center; color:grey">List Empty</p>
                    </c:if>
                </div>
            </body>

            </html>