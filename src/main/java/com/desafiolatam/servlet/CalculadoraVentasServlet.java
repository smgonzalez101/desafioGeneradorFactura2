package com.desafiolatam.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.desafiolatam.models.Producto;

@WebServlet("/calculadora")
public class CalculadoraVentasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession sesion= request.getSession();
		String sesionNombre = (String) sesion.getAttribute("Nombre");

		// Se genera lista de productos
		ArrayList<Producto> listaProductos = new ArrayList<Producto>();

		Producto producto01 = new Producto("Válvulas Titanio", "Válvulas de carrera", 120000, "valvula");
		Producto producto02 = new Producto("Turbo Full Carrera", "Turbo de competición multimarca", 1700000, "turbo");
		Producto producto03 = new Producto("Kit de Freno Competición",
				"Juego de discos, balatas, caliper de competición", 760000, "kit");
		Producto producto04 = new Producto("Sistema de Refrigeración", "Sistema de enfriamiento de motor Carrera",
				2300000, "sistema");
		Producto producto05 = new Producto("Plumillas limpia parabrisas estandar", "Plumillas para la lluvia", 10000,
				"plumilla");

		listaProductos.add(producto01);
		listaProductos.add(producto02);
		listaProductos.add(producto03);
		listaProductos.add(producto04);
		listaProductos.add(producto05);

		request.setAttribute("listaProductos", listaProductos);
		request.getRequestDispatcher("formularioIngreso.jsp").forward(request, response);// llamado o desplegar al jsp

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
