<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="users">
		<html>
			<head>
				<title>users</title>
				<link href="xslt_style.css" rel="stylesheet" type="text/css" />
			</head>
			<body>
				<h2>Users</h2>
				<p></p>
				
				<table cellpadding="10" cellspacing="0" border="1" bordercolordark="#FFFFFF" bordercolorlight="#000000">
					<thead>
						<tr>
							<th>id</th>
							<th>email</th>
							<th>name</th>
							<th>password</th>
							<th>gender</th>

						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates />
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="user">
		<tr>
			<td>
				<xsl:value-of select="id" />
			</td>
			<td>
				<xsl:value-of select="email" />
			</td>
			<td>
				<xsl:value-of select="name" />
			</td>
			<td>
				<xsl:value-of select="password" />
			</td>
			<td>
				<xsl:value-of select="gender" />
			</td>
		</tr>

	</xsl:template>


</xsl:stylesheet>