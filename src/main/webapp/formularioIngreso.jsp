<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<title>Generador de Factura</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- Bootstrap CSS 5.1.3-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
body {
	background-color: #cfd8dc;
}
</style>

</head>
<body>

	<div class="container ">
		<div class="row">
			<div class="col-8 justify-content-center">
				<img
					src="https://blog.desafiolatam.com/wp-content/uploads/2019/02/desafio-latam-logo-orizontal.png"
					title="Logo de la Empresa" alt="Logo Empresa de Repuestos"
					style="width: 150px; height: 50px; margin-top: 10%; margin-left: 10%;">
			</div>
			<div class="col-4 lh-1 mt-5">
				<p class="text mb-1 fw-bold text-end">Generador Factura 2022</p>
				<p class="text mb-1 fw-bold text-end">Competition Part Ltda.</p>
				<p class="text mb-1 text-end">A�o 2022 Abril ICL</p>
			</div>
		</div>
	</div>

	<form action="factura" method="post">
		<div class="container mt-5 pt-5">
			<c:if test="${msjError !=null}">
				<div class="alert alert-danger" role="alert">
					<c:out value="${msjError}"></c:out>
				</div>
			</c:if>
			<div class="row g-3">
				<div class="col-md-4 ">
					<label class="form-label ">Nombre Completo</label> <input
						type="text" name="nombre" class="form-control"
						placeholder="Ingrese nombre de cliente">
				</div>
				<div class="col-md-4 ">
					<label class="form-label ">Empresa</label> <input type="text"
						name="empresa" class="form-control"
						placeholder="Ingrese nombre de la empresa">
				</div>
				<div class="col-md-4 ">
					<label class="form-label ">Rut</label> <input type="text"
						name="rut" class="form-control" placeholder="Ingrese  RUT cliente">
				</div>
				<div class="col-md-4 ">
					<label class="form-label ">Direcci�n</label> <input type="text"
						name="direccion" class="form-control"
						placeholder="Ingrese direcci�n de cliente">
				</div>
				<div class="col-md-4 ">
					<label class="form-label ">Ciudad</label> <input type="text"
						name="ciudad" class="form-control"
						placeholder="Ingrese ciudad de cliente">
				</div>
				<div class="col-md-4 ">
					<label class="form-label ">Pa�s</label> <input type="text"
						name="pais" class="form-control"
						placeholder="Ingrese pa�s de cliente">
				</div>
			</div>
		</div>

		<input type="hidden" name="listaProductos" value="${listaProductos}">

		<div class="container mt-5 ">
			<table class="table table-dark table-hover table-striped">
				<thead>
					<tr>
						<th scope="col">ITEM</th>
						<th scope="col">DESCRIPCION</th>
						<th scope="col">VALOR UNIDAD</th>
						<th scope="col">CANTIDAD</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="producto" items="${listaProductos}">
						<tr>
							<td><c:out value="${producto.producto}"></c:out></td>
							<td><c:out value="${producto.descripcion}"></c:out></td>
							<td class="text-start">$ <fmt:formatNumber
									value="${producto.valorUnitario}" pattern="#,##0" /></td>
							<td><input type="number" class="form-control text-start"
								id="${producto.item}" name="${producto.item}"
								placeholder="Ingrese cantidad" min="0" max="100" value="0"></td>
						</tr>
						<input type="hidden" name="${producto.item}VU"
							value="${producto.valorUnitario}">
					</c:forEach>
				</tbody>

			</table>
		</div>

		<div class="container d-flex justify-content-end">
			<div class="row">
				<div class="col-md-12 text-right">
					<button type="submit" class="btn btn-success mb-4 p-2">Genera
						Factura</button>
					<button type="reset" class="btn btn-secondary mb-4 p-2">Limpiar</button>
				</div>
			</div>
		</div>


	</form>



	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js "
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p "
		crossorigin="anonymous "></script>


</body>
</html>