<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="polls">
		<html>
			<head>
				<title>polls</title>
				<link href="xslt_style.css" rel="stylesheet" type="text/css" />
			</head>
			<body>
				<h2>Polls</h2>
				<p></p>
				
				<table cellpadding="10" cellspacing="0" border="1" bordercolordark="#FFFFFF" bordercolorlight="#000000">
					<thead>
						<tr>
							<th>id</th>
							<th>userid</th>
							<th>title</th>
							<th>person</th>
							<th>location</th>
							<th>creationdata</th>
							<th>description</th>
							<th>isclose</th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates />
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="poll">
		<tr>
			<td>
				<xsl:value-of select="id" />
			</td>
			<td>
				<xsl:value-of select="userid" />
			</td>
			<td>
				<xsl:value-of select="title" />
			</td>
			<td>
				<xsl:value-of select="person" />
			</td>
			<td>
				<xsl:value-of select="location" />
			</td>
			<td>
				<xsl:value-of select="creationdata" />
			</td>
			<td>
				<xsl:value-of select="description" />
			</td>
			<td>
				<xsl:value-of select="isclose" />
			</td>
		</tr>

	</xsl:template>


</xsl:stylesheet>