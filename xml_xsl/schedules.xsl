<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="schedules">
		<html>
			<head>
				<title>schedules</title>
				<link href="xslt_style.css" rel="stylesheet" type="text/css" />
			</head>
			<body>
				<h2>Schedules</h2>
				<p></p>
				
				<table cellpadding="10" cellspacing="0" border="1" bordercolordark="#FFFFFF" bordercolorlight="#000000">
					<thead>
						<tr>
							<th>id</th>
							<th>description</th>
							<th>count</th>
							
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates />
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="schedule">
		<tr>
			<td>
				<xsl:value-of select="id" />
			</td>
			<td>
				<xsl:value-of select="description" />
			</td>
			<td>
				<xsl:value-of select="count" />
			</td>
			
		</tr>

	</xsl:template>


</xsl:stylesheet>