<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" version="1.0" indent="yes"/>
	<xsl:template match="/">
		<fo:root>

			<fo:layout-master-set>
				<fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm"
									   master-name="template">
					<fo:region-body margin="20mm 0mm 20mm 0mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<!-- TITLE -->
			<fo:page-sequence master-reference="template">
				<fo:flow flow-name="xsl-region-body">
					<fo:block position="absolute" text-align="center" font-weight="bold" margin-bottom="50mm"
							  font-family="Times New Roman" font-size="48pt" padding-before="50mm" color="#2E8B57">
						Monasteries catalog
					</fo:block>
				</fo:flow>
			</fo:page-sequence>

			<!-- MONASTERIES -->
			<xsl:for-each select="//Monastery">
				<xsl:variable name="region_reference_id" select="@region_ref"/>
				<xsl:variable name="church1_reference_id" select="@church1_ref"/>
				<xsl:variable name="abbot1_reference_id" select="@abbot1_ref"/>
				<xsl:variable name="church2_reference_id" select="@church2_ref"/>
				<xsl:variable name="abbot2_reference_id" select="@abbot2_ref"/>
				<fo:page-sequence master-reference="template">
					<fo:flow flow-name="xsl-region-body">
						<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
							<fo:block position="absolute" text-align="center" font-weight="bold" padding-before="2cm"
									  margin-left="2.5cm"
									  font-family="Times New Roman" font-size="20pt" color="#191970">
								<xsl:value-of select="name"/>
							</fo:block>

							<fo:block position="absolute" text-align="center" padding-before="7mm" margin-left="2.5cm">
								<fo:external-graphic src="{unparsed-entity-uri(image/@src)}"
													 content-height="scale-to-fit"
													 height="250px" content-width="700px"/>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Name:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="name"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Year of construction:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="construction_year"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Area:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="area"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Region:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="//Region[@region_id = $region_reference_id ]/direction"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Church1:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="//Church[@church_id = $church1_reference_id ]/church_name"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Abbot1:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="//Abbot[@abbot_id = $abbot1_reference_id]/abbot_name"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Church2:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="//Church[@church_id = $church2_reference_id ]/church_name"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Abbot2:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="//Abbot[@abbot_id = $abbot2_reference_id]/abbot_name"/>
								</fo:inline>
							</fo:block>

							<fo:block position="relative" font-family="Times New Roman" font-weight="bold"
									  font-size="15pt" color="#000000"
									  padding-before="5mm" margin-left="2cm">
								Description:
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt"
										   color="#2F4F4F">
									<xsl:value-of select="description"/>
								</fo:inline>
							</fo:block>

						</fo:block-container>
					</fo:flow>
				</fo:page-sequence>
			</xsl:for-each>

		</fo:root>
	</xsl:template>
</xsl:stylesheet>
