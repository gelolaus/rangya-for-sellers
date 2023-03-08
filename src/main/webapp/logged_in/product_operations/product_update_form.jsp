<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Rangya | Log In</title>

<link rel="stylesheet" type="text/css" href="../../src/css/styles.css" />

</head>

<body>

	<!-- Navbar -->

	<nav class="navbar" role="navigation" aria-label="main-navigation">

		<div class="navbar-brand">
			<a class="navbar-item" href="../index.jsp"> <img
				src="../../src/images/logo/RangyaBlack.png" height="28"> for
				Sellers
			</a>


		</div>

		<div class="navbar-menu">

			<div class="navbar-start">

				<a class="navbar-item" href="../dashboard.jsp"> Dashboard </a> <a
					class="navbar-item" href=""> <strong>Create</strong>
				</a>

			</div>

			<div class="navbar-end">

				<div class="navbar-item has-dropdown is-hoverable">
					<a class="navbar-link"> Hello, Username! </a>

					<div class="navbar-dropdown">
						<a class="navbar-item"> View Account </a>
						<hr class="navbar-divider">
						<a class="navbar-item" style="color: red;"> Log Out </a>

					</div>

				</div>

			</div>

		</div>

	</nav>

	<!-- Form -->
	<%
	String product_id = request.getParameter("product_id");
	try {

		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {

		e.printStackTrace();

	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/rangya_db", "root", "Love,@funjai_gr");

		statement = connection.createStatement();
		String sql = "SELECT * FROM product_tbl where product_id=" + product_id;
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
	%>
	<form method="POST"
		action="../product_operations_CRUD/product_updater_process.jsp"
		class="box" id="products_box">
		<div class="field">
			<div class="control">
				<input class="input" type="hidden" placeholder="Product Name"
					id="product_name" name="product_id"
					value="<%out.println(resultSet.getInt("product_id"));%>"
					required>
			</div>
		</div>
		<div class="field">
			<label class="label">Product Name</label>
			<div class="control">
				<input class="input" type="text" placeholder="Product Name"
					id="product_name" name="product_name"
					value="<%out.println(resultSet.getString("product_name"));%>"
					required>
			</div>
		</div>

		<label class="label">Product Image</label>

		<div class="file has-name is-fullwidth">
			<label class="file-label"> <input class="file-input"
				type="file" name="product_image"> <span class="file-cta">
					<span class="file-icon"> <i class="fas fa-upload"></i>
				</span> <span class="file-label"> Choose a file... </span>
			</span> <span class="file-name"> </span>
			</label>
		</div>

		<div class="field" style="padding-top: 12px;">
			<label class="label">Product Description</label>
			<div class="control">
				<textarea class="textarea" placeholder="e.g. Hello world"
					id="product_description" name="product_description" required> <%
 out.println(resultSet.getString("product_description"));
 %>
				</textarea>
			</div>
		</div>

		<div class="field">
			<label class="label">Product Size</label>
			<div class="control">
				<input class="input" type="number" placeholder="Product Size"
					id="product_size" name="product_size"
					value=<%out.println(resultSet.getInt("product_size"));%> required>
			</div>
		</div>

		<div class="field">
			<label class="label">Product Price</label>
			<div class="control">
				<input class="input" type="number" placeholder="Product Price"
					id="product_price" name="product_price"
					value=<%out.println(resultSet.getInt("product_price"));%> required>
			</div>
		</div>

		<div class="field is-grouped" style="padding-top: 2%;">

			<div class="control">
				<button class="button is-success" type="submit">Update</button>
			</div>

			<div class="control">
				<a href="../dashboard.jsp"><button class="button is-danger"
						type="button">Cancel</button></a>
			</div>

		</div>

	</form>
	<%
	}

	connection.close();

	} catch (Exception e) {

	e.printStackTrace();

	}
	%>
	<script>
const fileInput = document.querySelector('.file-input');
const fileName = document.querySelector('.file-name');

fileInput.addEventListener('change', () => {
  fileName.textContent = fileInput.files[0].name;
});


</script>

</body>

</html>