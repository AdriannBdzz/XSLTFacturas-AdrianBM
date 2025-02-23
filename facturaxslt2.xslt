<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/" 
    exclude-result-prefixes="fe">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Apple</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        background-color: #f3f3f3;
                        color: #333;
                        padding: 20px;
                    }
                    .container {
                        max-width: 850px;
                        margin: 0 auto;
                        background: #ffffff;
                        padding: 25px;
                        border-radius: 12px;
                        box-shadow: 0px 12px 24px rgba(0, 0, 0, 0.1);
                    }
                    h2 {
                        text-align: center;
                        color: #333;
                        font-size: 2em;
                        margin-bottom: 15px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 30px;
                    }
                    th, td {
                        padding: 12px;
                        text-align: left;
                        border: 1px solid #e0e0e0;
                    }
                    th {
                        background-color: #4CAF50;
                        color: #fff;
                        font-size: 1.1em;
                    }
                    td {
                        background-color: #fafafa;
                    }
                    .total {
                        font-weight: bold;
                        color: #e53935;
                        font-size: 1.5em;
                    }
                    .logo {
                        display: block;
                        margin: 0 auto 20px;
                        width: 100px;
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
                        text-align: center;
                        font-size: 0.9em;
                        color: #888;
                        margin-top: 40px;
                    }
                </style>
            </head>
            <body>
             
                <div class="container">
                <div class="header">
                        <img class="logo" src="apple_logo2.png" alt="Apple Logo"/>
                        <div class="title">Factura Apple Store</div>
                    </div>
                    <table>
                        <tr>
                            <th>Fecha</th>
                            <td><xsl:value-of select="//InvoiceIssueDate"/></td>
                        </tr>
                        <tr>
                            <th>Vendedor</th>
                            <td><xsl:value-of select="//SellerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>CIF/NIF</th>
                            <td><xsl:value-of select="//SellerParty/TaxIdentification/TaxIdentificationNumber"/></td>
                        </tr>
                        <tr>
                            <th>Total Factura</th>
                            <td class="total"><xsl:value-of select="//InvoiceTotalAmount"/> €</td>
                        </tr>
                        <tr>
                            <th>Moneda</th>
                            <td><xsl:value-of select="//InvoiceCurrencyCode"/></td>
                        </tr>
                    </table>
                    <h3>Productos Apple Adquiridos</h3>
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
                    <div class="footer">Gracias por elegir AR CABESA</div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
