<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/" 
    exclude-result-prefixes="fe">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Apple Store</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        background-color: #f4f4f9;
                        color: #333;
                        margin: 0;
                        padding: 0;
                    }
                    .container {
                        max-width: 900px;
                        margin: 50px auto;
                        background: #ffffff;
                        padding: 30px;
                        border-radius: 10px;
                        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
                    }
                    h2 {
                        text-align: center;
                        color: #00aaff;
                        font-size: 2.5em;
                        margin-bottom: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }
                    th, td {
                        padding: 15px;
                        text-align: left;
                        border: 1px solid #ddd;
                    }
                    th {
                        background-color: #00aaff;
                        color: #fff;
                        font-size: 1.2em;
                    }
                    td {
                        background-color: #f9f9f9;
                    }
                    .total {
                        font-weight: bold;
                        color: #ff5f57;
                        font-size: 1.5em;
                    }
                    .logo {
                        display: block;
                        margin: 0 auto;
                        width: 120px;
                    }
                    .header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }
                    .header .title {
                        font-size: 1.8em;
                        font-weight: bold;
                        color: #333;
                    }
                    .footer {
                        margin-top: 30px;
                        text-align: center;
                        color: #888;
                        font-size: 0.9em;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <img class="logo" src="Apple_logo.png" alt="Apple Logo"/>
                        <div class="title">Factura Apple Store</div>
                    </div>
                    <table>
                        <tr>
                            <th>Fecha</th>
                            <td><xsl:value-of select="//InvoiceIssueDate"/></td>
                        </tr>
                        <tr>
                            <th>Vendedor</th>
                            <td>Apple Store Online</td>
                        </tr>
                        <tr>
                            <th>CIF/NIF Vendedor</th>
                            <td>A12345678</td>
                        </tr>
                        <tr>
                            <th>Cliente</th>
                            <td><xsl:value-of select="//BuyerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>CIF/NIF Cliente</th>
                            <td><xsl:value-of select="//BuyerParty/TaxIdentification/TaxIdentificationNumber"/></td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td class="total"><xsl:value-of select="//InvoiceTotalAmount"/> €</td>
                        </tr>
                        <tr>
                            <th>Moneda</th>
                            <td><xsl:value-of select="//InvoiceCurrencyCode"/></td>
                        </tr>
                    </table>
                    <h3>Detalle de Productos Apple</h3>
                    <table>
                        <tr>
                            <th>Descripción</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario</th>
                            <th>Total</th>
                        </tr>
                        <xsl:for-each select="//Items/InvoiceLine">
                            <tr>
                                <td><xsl:value-of select="ItemDescription"/></td>
                                <td><xsl:value-of select="Quantity"/></td>
                                <td><xsl:value-of select="UnitPriceWithoutTax"/> €</td>
                                <td><xsl:value-of select="TotalCost"/> €</td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <div class="footer">Gracias por comprar AR CABESA</div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
