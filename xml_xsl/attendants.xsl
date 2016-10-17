<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="attendants">
		<html>
			<head>
				<title>attendants</title>
				<link href="xslt_style.css" rel="stylesheet" type="text/css" />
			</head>
			<body>
				<h2>Attendants</h2>
				<p></p>
				
				<table cellpadding="10" cellspacing="0" border="1" bordercolordark="#FFFFFF" bordercolorlight="#000000">
					<thead>
						<tr>
							<th>id</th>
							<th>person</th>
							<th>description</th>
							
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates />
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="attendant">
		<tr>
			<td>
				<xsl:value-of select="id" />
			</td>
			<td>
				<xsl:value-of select="person" />
			</td>
			<td>
				<xsl:value-of select="description" />
			</td>
			
		</tr>

	</xsl:template>


</xsl:stylesheet>