{#
	***Begin Custom Options***
	Toggle any of the options in this section between 'false' and 'true' in order to enable/disable them in the template
#}

{# Layout Adjustments #}
{% set print_layout = true %} {# Improves receipt layout for large display/paper size (A4/Letter/Email) #}
{% set chrome_right_margin_fix = false %}           {# Fixes a potential issue where the right side of receipts are cut off in Chrome #}
{% set firefox_margin_fix = false %}                {# Fixes issue with margins cutting off when printing on a letter printer on a Mac #}

{# Sale #}
{% set sale_id_instead_of_ticket_number = false %}  {# Displays the Sale ID instead of the Ticket Number #}
{% set invoice_as_title = false %}                  {# If print_layout is true, "Invoice" will be displayed instead of "Sales Receipt" on A4/Letter/Email formats #}
{% set workorders_as_title = false %}               {# Changes the receipt title to "Work Orders" if there is no Salesline items and 1 or more workorders #}
{% set quote_id_prefix = "" %}                      {# Adds a string of text as a prefix for the Quote ID. Ex: "Q-". To be used when "sale_id_instead_of_ticket_number" is true #}
{% set sale_id_prefix = "" %}                       {# Adds a string of text as a prefix for the Sales ID. Ex: "S-". To be used when "sale_id_instead_of_ticket_number" is true #}

{# Item Lines #}
{% set per_line_discount = false %}                 {# Displays Discounts on each Sale Line #}
{% set per_line_subtotal = false %}                 {# Displays Subtotals for each Sale Line (ex: "1 x $5.00") #}
{% set discounted_line_items = false %}             {# Strikes out the original price and displays the discounted price on each Sale Line #}
{% set per_line_employee = false %}                 {# Display Employee for each Sale line #}
{% set show_custom_sku = false %}                   {# Adds SKU column for Custom SKU, if available, on each Sale Line #}
{% set show_manufacturer_sku = false %}             {# Adds SKU column for Manufacturer SKU, if available, on each Sale Line #}
{% set show_msrp = false %}                         {# Adds MSRP column for the items MSRP, if available, on each Sale Line #}

{# Misc. Adjustments #}
{% set show_shop_name_with_logo = false %}          {# Displays the Shop Name under the Shop Logo #}
{% set show_thank_you = false %}                     {# Displays "Thank You <Customer Name>!" above bottom barcode #}
{% set show_transaction_item_count = false %}       {# Gives a total quantity of items sold near the bottom of the receipt #}
{% set show_sale_lines_on_store_copy = false %}     {# Shows Sale Lines on Credit Card Store Copy receipts #}
{% set quote_to_invoice = false %}                  {# Changes Quote wording to Invoice in Sales and in Sale Quotes (does not apply to Work Order Quotes) #}
{% set show_sale_lines_on_gift_receipt = true %}    {# Displays Sale Lines on Gift Receipts #}
{% set show_barcode = true %}                       {# Displays barcode at bottom of receipts #}
{% set show_barcode_sku = true %}                   {# Displays the System ID at the bottom of barcodes #}
{% set show_workorders_barcode = false %}           {# Displays workorders barcode #}
{% set show_workorders_barcode_sku = true %}        {# Displays the System ID at the bottom of workorders barcodes #}
{% set hide_ticket_number_on_quote = false %}       {# Hides the Ticket Number on Quotes #}
{% set hide_quote_id_on_sale = false %}             {# Hides the Quote ID on Sales #}

{# Customer Information #}
{% set show_full_customer_address = true %}        {# Displays Customers full address, if available #}
{% set show_customer_name_only = false %}            {# Hides all Customer information except for their name #}
{% set show_customer_notes = false %}               {# Displays Notes entered in the Customers profile #}
{% set company_name_override = false %}             {# Does not display the Customer Name if Company Name is present #}

{# Customer Account #}
{% set show_credit_account_signature = false %}     {# Prints Store Copy with signature line on accounts that use an Account Credit (not Deposit) #}
{% set show_customer_layaways = true %}             {# Displays Customer Layaway information at the bottom of receipts #}
{% set show_customer_specialorders = true %}        {# Displays Customer Special Order information at the bottom of receipts #}
{% set show_customer_workorders = true %}           {# Displays Customer Work Order information at the bottom of receipts #}
{% set show_customer_credit_account = true %}       {# Displays Customer Credit Account information at the bottom of receipts #}

{# Logos #}
{% set logo_width = '225' %}                      {# Default width is 225px. #}
{% set logo_height = '55' %}                     {# Default height is 55px. #}
{% set multi_shop_logos = true %}                  {# Allows multiple logos to be added for separate locations when used with options below #}

{#
	Use the following shop_logo_array to enter all of your locations and the link to the logo image that you have uploaded to the internet.
	Enter your EXACT shop name (Case Sensitive!) in the Quotes after the "name": entry and then enter the URL to your logo after the "logo": entry.
	Be sure to set the multi_shop_logos setting above to true in order to have these logos take effect!
#}

{% set shop_logo_array =
	{
		0:{"name":"Method Casting Services", "logo_url":"https://methodcasting.com/wp-content/themes/method/assets/images/logo.png"}
	}
%}

{#
	Custom CSS Variables
#}
{% set css_color_black = '#212121' %}
{% set css_color_gray = '#919191' %}
{% set css_color_gray_alt = '#000' %}


{#
	***End Custom Options***
#}

{% extends parameters.print ? "printbase" : "base" %}
{% block extrastyles %}

@page { margin: 0px; }
/* Custom Fonts */
@font-face {
  font-display: swap;
  font-family: 'Nexa';/*nexathin*/
  src: url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa-thin-webfont.woff2') format('woff2'),
        url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa-thin-webfont.woff') format('woff');
  font-weight: 200;
  font-style: normal;
}
@font-face {
	font-display: swap;
    font-family: 'Nexa';/*nexalight*/
    src: url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa-light-webfont.woff2') format('woff2'),
         url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa-light-webfont.woff') format('woff');
    font-weight: 300;
    font-style: normal;
}
@font-face {
	font-display: swap;
    font-family: 'Nexa';/*nexalight_italic*/
    src: url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_light_italic-webfont.woff2') format('woff2'),
         url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_light_italic-webfont.woff') format('woff');
    font-weight: 300;
    font-style: italic;
}

@font-face {
	font-display: swap;
    font-family: 'Nexa';/*nexaregular*/
    src: url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa-regular-webfont.woff2') format('woff2'),
         url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa-regular-webfont.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
@font-face {
	font-display: swap;
    font-family: 'Nexa'; /*nexaregular_italic*/
    src: url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_italic-webfont.woff2') format('woff2'),
         url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_italic-webfont.woff') format('woff');
    font-weight: 400;
    font-style: italic;
}
@font-face {
	font-display: swap;
    font-family: 'Nexa'; /*nexabold_italic*/
    src: url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_bold_italic-webfont.woff2') format('woff2'),
         url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_bold_italic-webfont.woff') format('woff');
    font-weight: 700;
    font-style: italic;
}

@font-face {
	font-display: swap;
    font-family: 'Nexa'; /*nexabold*/
    src: url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_bold-webfont.woff2') format('woff2'),
         url('https://s3-eu-west-1.amazonaws.com/promo.insignety.com/fonts/Nexa/fontfabric_-_nexa_bold-webfont.woff') format('woff');
    font-weight: 700;
    font-style: normal;
}
/* End Custom Fonts */

body {
	font: normal 10pt 'Nexa', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	width: {{parameters.page_width|pageWidthToCss}};
	margin: 0 auto;
	padding: 1px; <!-- You need this to make the printer behave -->
	color: {{ css_color_gray_alt }};

	{% if chrome_right_margin_fix == true %}
		margin-right: .13in;
	{% endif %}
	{% if firefox_margin_fix == true %}
		margin: 25px;
	{% endif %}
}

.store {
	page-break-after: always;
	margin-bottom: 40px;
}

.receipt {
	font: normal 10pt 'Nexa', “Helvetica Neue”, Helvetica, Arial, sans-serif;
}

h1 {
	margin: .5em 0 0;
	font-size: 12pt;
	text-align: center;
}

hr {
	border-color: {{ css_color_gray_alt }};
}

p.date, p.copy {
	font-size: 9pt;
	margin: 0;
	text-align: center;
}

p.details {
	font-size: 10pt;
	text-align: right;
	margin: 10px 0;
}
.details + .details {
	margin-top: 0;
}
p.details.date {
	margin-bottom: 0;
}
.details > br {
	display: none;
}
.details__item {
	display: block;
	margin-bottom: 5px;
	text-transform: uppercase;
}
.details__item__label {
	display: block;
	font-size: 9pt;
	color: {{ css_color_gray_alt }};
}
.details__item__value {
	display: block;
	font-size: 11pt;
}

.receiptTypeTitle {
	font-size: 20pt;
	font-weight: 200;
	margin-bottom: 15px;
	text-transform: uppercase;
}

.receiptShopContact {
	margin: 0;
	line-height: 1.5;
	text-align: center;
}
.receiptShopContact > br {
	display: none;
}
.footer__note {
	font-size: 8pt;
	display: block;
	margin-bottom: 5px;
}
.footer__note__label {
	display: block;
	text-transform: uppercase;
	font-weight: 300;
	color: {{ css_color_gray_alt }};
}
.footer__note__value {
	display: block;
}
.footer__note__value br {
	display: none;
}

h2 {
	text-transform: uppercase;
	font-size: 10pt;
	margin: .5em 0 0;
}

.receiptHeader {
	text-align: center;
}

.receiptHeader h3 {
	font-size: 12pt;
	margin: 0;
}

.shipping h4 {
	margin-top: 0;
}

.receiptHeader img {
	margin: 8px 0 4px;
}

table {
	margin: 0 0;
	width: 100%;
	border-collapse:collapse;
}

table th { text-align: left; }

table tbody th {
	font-weight: normal;
	text-align: left;
}

table td.amount, table th.amount { text-align: right; }
table td.quantity, table th.quantity { text-align: center; }

th.description {
	width: 100%;
}
th.table__th {
	text-transform: uppercase;
	color: {{ css_color_gray_alt }};
	font-weight: 300;
}

td.amount { white-space: nowrap; }

table.totals { text-align: right; }
table.payments { text-align: right; }
table.spacer { margin-top: 1em; }
table tr.total td { font-weight: bold; }

table td.amount { padding-left: 30px; }
table td.custom_field {
	padding-right: 10px;
	text-align: center;
}

table.sale {
	border-top: 2px solid #474747;
}
table.sale tr:first-child th,
table.workorders tr:first-child th {
	padding-top: 10pt;
}

table.sale th {}

table div.line_description {
	text-align: left;
	font-weight: bold;
}

table div.line_note {
	text-align: left;
}

table div.line_serial {
	text-align: left;
	font-weight: normal;
	padding-left: 10px;
}

table.workorders div.line_description {
	font-weight: normal;
	padding-left: 10px;
}

table.workorders div.line_note {
	font-weight: normal;
	padding-left: 10px;
}

table.workorders div.line_serial {
	font-weight: normal;
	padding-left: 20px;
}

table.workorders td.workorder div.line_note {
	font-weight: bold;
	padding-left: 0px;
}

p.thankyou {
	margin: 0;
	text-align: center;
}

.note {
	text-align: center;
	color: {{ css_color_gray_alt }};
	line-height: 1.1;
}


.barcodeContainer {
	margin-top: 15px;
	text-align: center;
}

.workorders .barcodeContainer {
	margin-left: 15px;
	text-align: left;
}

dl {
	overflow: hidden
}

dl dt {
	font-weight: bold;
	width: 80px;
	float: left
}

dl dd {
	border-top: 2px solid black;
	padding-top: 2px;
	margin: 1em 0 0;
	float: left;
	width: 180px
}

dl dd p { margin: 0; }

.strike { text-decoration: line-through; }


.receiptCompanyNameField,
.receiptCustomerNameField,
.receiptCustomerVatField,
.receiptCustomerCompanyVatField {
	display: block;
}

table.payments td.label {
	font-weight: normal;
	text-align: right;
	width: 100%;
}
table.saletotals {
	margin-top: 10px;
}

#receiptTransactionDetails table {
	max-width: 245px;
	margin: 0 auto;
}

#receiptTransactionDetails table td {
	text-align: right;
}

#receiptTransactionDetails table td.top {
	font-weight: bold;
}

#receiptTransactionDetails table td.label {
	padding-right: 20px;
	text-align: left;
}
/* Helper Styles */
.text-center {
	text-align: center;
}
.text-left {
	text-align: left;
}
.text-right {
	text-align: right;
}
.text-uppercase {
	text-transform: uppercase;
}
.color-gray {
	color: #919191;
}
.float-left {
	float: left;
}
.float-right {
	float: right;
}
.float-none {
	float: none;
}
/* End Helper Styles */

@media (max-width: 479px) {
	/* Make header grayscale and very black */
	.receiptHeader {
		/* IE4-8 and 9 (deprecated). */
		filter: Gray();
		/* SVG version for IE10, Chrome 17, FF3.5, 
		Safari 5.2 and Opera 11.6 */
		filter: url('#grayscale'); 
		/* CSS3 filter, at the moment Webkit only. Prefix it for
		future implementations */
		-webkit-filter: grayscale(100%) brightness(0);
		filter: grayscale(100%) brightness(0);
	}
}

{% if print_layout %}

	/* Receipts only */
	@media (max-width: 299px) {
		.show-on-print {
			display: none;
		}
		.hide-on-print {
			display: block;
		}
	}

	@media (min-width: 480px) {
		/* Emails hacks, don't mind the optimisation */
		table.saletotals {
			margin-top: 0;
		}

		table.payments {
			width: 100%;
		}

		table.payments {
			margin-top: 5px;
			text-align: left;
		}

		table.payments tr td.amount {
			text-align: right;
			width: auto;
		}

		table.payments tr td.amount {
			text-align: left;
			width: 100%;
		}


		table.payments td.label {
			font-weight: bold;
			text-align: right;
			white-space: nowrap;
		}
	}

/* Email, Letter, A4 only */
	@media (min-width: 480px) {
		*, ::after, ::before {
			box-sizing: border-box;
		}
		/* Grid */
		.row {
			display: -webkit-box;
			display: -ms-flexbox;
			display: flex;
			-ms-flex-wrap: wrap;
			flex-wrap: wrap;
			margin-right: -15px;
			margin-left: -15px;
		}
		.col, .col-1, .col-10, .col-11, .col-12, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-auto, .col-lg, .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-auto, .col-md, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-auto, .col-sm, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-auto, .col-xl, .col-xl-1, .col-xl-10, .col-xl-11, .col-xl-12, .col-xl-2, .col-xl-3, .col-xl-4, .col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-auto {
			position: relative;
			width: 100%;
			min-height: 1px;
			padding-right: 15px;
			padding-left: 15px;
		}
		.col {
			-ms-flex-preferred-size: 0;
			flex-basis: 0;
			-webkit-box-flex: 1;
			-ms-flex-positive: 1;
			flex-grow: 1;
			max-width: 100%;
		}
		.col-auto {
			-webkit-box-flex: 0;
			-ms-flex: 0 0 auto;
			flex: 0 0 auto;
			width: auto;
			max-width: none;
		}
		.col-6 {
			-webkit-box-flex: 0;
			-ms-flex: 0 0 50%;
			flex: 0 0 50%;
			max-width: 50%;
		}
		/* End Grid */
		
		/* Flex */
		.d-flex {
			display: -webkit-box!important;
			display: -ms-flexbox!important;
			display: flex!important;
		}
		.align-items-start {
			-webkit-box-align: start!important;
			-ms-flex-align: start!important;
			align-items: flex-start!important;
		}
		.align-items-end {
			-webkit-box-align: end!important;
			-ms-flex-align: end!important;
			align-items: flex-end!important;
		}
		.align-items-center {
			-webkit-box-align: center!important;
			-ms-flex-align: center!important;
			align-items: center!important;
		}
		.align-items-baseline {
			-webkit-box-align: baseline!important;
			-ms-flex-align: baseline!important;
			align-items: baseline!important;
		}
		.align-items-stretch {
			-webkit-box-align: stretch!important;
			-ms-flex-align: stretch!important;
			align-items: stretch!important;
		}
		.justify-content-start {
			-webkit-box-pack: start!important;
			-ms-flex-pack: start!important;
			justify-content: flex-start!important;
		}
		.justify-content-end {
			-webkit-box-pack: end!important;
			-ms-flex-pack: end!important;
			justify-content: flex-end!important;
		}
		.justify-content-center {
			-webkit-box-pack: center!important;
			-ms-flex-pack: center!important;
			justify-content: center!important;
		}
		.justify-content-between {
			-webkit-box-pack: justify!important;
			-ms-flex-pack: justify!important;
			justify-content: space-between!important;
		}
		.justify-content-around {
			-ms-flex-pack: distribute!important;
			justify-content: space-around!important;
		}
		/* End Flex */


		.show-on-print {
			display: block;
		}
		.hide-on-print {
			display: none;
		}

		body {
			color: {{ css_color_gray_alt }};
			padding: 15px 30px;
			position: relative;
			font-size: 8pt;
		}

		.receiptHeader {
			position: relative;
		}

		.receiptHeader img {
			display: block;
			margin: 0 auto;
			max-width: 225px;
		}

		.receiptHeader h3.receiptShopName {
			font-size: 14pt;
			margin-bottom: 3px;
			text-decoration: underline;
		}

		.receiptShopName,
		.receiptShopContact {
			text-align: center;
		}

		.receiptTypeTitle,
		.receiptTypeTitle span {
			font-size: 22pt;
			text-align: left;
			margin-top: 0;
			margin-bottom: 36px;
			padding-left: 30px;
		}

		.receiptTypeTitle span.hide-on-print {
			font-size: 0;
			display: none;
		}

		.details {
			font-weight: 300;
		}
		.details__item__value {
			font-size: 10pt;
			margin-bottom: 10px;
		}
		
		
		.receiptShopContact > br {
			display: block;
		}
		.footer__note {
			display: inline-block;
			margin-bottom: 0;
		}
		.footer__note__label,
		.footer__note__value {
			display: inline;
			font-weight: 400;
		}
		

		table.sale,
		table.workorders {
			clear: both;
		}
		table.sale tbody th,
		table.sale tbody td,
		table.workorders tbody th,
		table.workorders tbody td {
			padding-bottom: 5px;
			padding-top: 5px;
		}
		
		table.sale tbody tr:first-child th,
		table.sale tbody tr:first-child td,
		table.workorders tbody tr:first-child th,
		table.workorders tbody tr:first-child td {
			padding-top: 20px;
			padding-bottom: 0;
		}
		table.sale tbody:last-child tr:last-child th,
		table.sale tbody:last-child tr:last-child td,
		table.workorders tbody:last-child tr:last-child th,
		table.workorders tbody:last-child tr:last-child td {
			padding-bottom: 10px;
		}
		table.sale tbody tr th:first-child,
		table.sale tbody tr td:first-child,
		table.workorders tbody tr th:first-child,
		table.workorders tbody tr td:first-child {
			padding-left: 30px;
		}		

		.paymentTitle,
		.footerSectionTitle {
			font-weight: 300;
			padding-top: 15px;
			padding-left: 30px;
			text-transform: uppercase;
			
			margin-bottom: 15px;
		}
		.footerSectionTitle {
			clear: both;
		}

		.thankyou {
			clear: both;
			padding-top: 30px;
		}

		img.barcode {
			border: none;
			height: 30px;
			width: 150px;
		}

		.note {
			font-size: 7pt;
		}
		hr {
			margin-top: 15px;
			margin-bottom: 15px;
			border: 0;
			border-top: 2px solid #474747;
		}

	}

{% endif %}


@media (min-width: 480px) {
	hr, table.sale, table.workorders {
		border-color: {{ css_color_gray }} !important;
	}
	.details__item__label {
		color: {{ css_color_gray }} !important;
		font-size: 6pt;
	}
	.footer__note {
		font-size: 6pt;
	}
	.footer__note__label {
		color: {{ css_color_gray }} !important;	
	}
	th.table__th,
	.paymentTitle,
	.footerSectionTitle {
		color: {{ css_color_gray }} !important;
		font-size: 6pt;
	}
	.note {
		color: {{ css_color_gray }} !important;
	}
	.paymentTitle,
	.footerSectionTitle {
		color: {{ css_color_gray }} !important;
		margin-bottom: 0;
	}
	.footer__hr {
		margin-top: 100px;
	}
}

{% endblock extrastyles %}

{% block content %}
	{% set page_loaded = false %}
	{% for Sale in Sales %}
		{% if not parameters.page or parameters.page == 1 %}
			{% if Sale.Shop.ReceiptSetup.creditcardAgree|strlen > 0 and not parameters.gift_receipt and not parameters.email %}
				{% for SalePayment in Sale.SalePayments.SalePayment %}
					{% if parameters.force_cc_agree or parameters.print_workorder_agree %}
						{{ _self.store_receipt(Sale,parameters,_context,SalePayment) }}
						{% set page_loaded = true %}
					{% else %}
						{% if SalePayment.archived == 'false' and SalePayment.CCCharge and SalePayment.CCCharge.declined == 'false' and SalePayment.CCCharge.isDebit == 'false' %}
							{{ _self.store_receipt(Sale,parameters,_context,SalePayment) }}
							{% set page_loaded = true %}
						{% endif %}
					{% endif %}
				{% endfor %}
			{% endif %}
		{% endif %}

		{% if not parameters.page or parameters.page == 2 or not page_loaded %}
			<!-- replace.email_custom_header_msg -->
			<div>
				{{ _self.ship_to(Sale) }}
				{{ _self.header(Sale,_context) }}
				<div class="row align-items-end">
					<div class="col-6">
						{{ _self.title(Sale,parameters,_context) }}
					</div>
					<div class="col-6">
						{{ _self.date(Sale) }}
						{{ _self.sale_details(Sale,_context) }}
					</div>
				</div>
				{% if not parameters.gift_receipt or show_sale_lines_on_gift_receipt %}
					{{ _self.receipt(Sale,parameters,false,_context) }}
				{% endif %}
				{# Item Count Loop #}
				{% if show_transaction_item_count %}
					{% set transaction_item_count = 0 %}
					{% for Line in Sale.SaleLines.SaleLine %}
						{% set transaction_item_count = transaction_item_count + Line.unitQuantity %}
					{% endfor %}
					<p>Total Item Count: {{ transaction_item_count }}</p>
				{% endif %}
				
				<hr class="footer__hr" />

				{% if not parameters.gift_receipt %}
					{{ _self.no_tax_applied_text(Sale) }}
				{% endif %}

				{% if Sale.quoteID and Sale.Quote.notes|strlen > 0 %}<p id="receiptQuoteNote" class="note quote">{{Sale.Quote.notes|noteformat|raw}}</p>{% endif %}

				{% if Sale.Shop.ReceiptSetup.generalMsg|strlen > 0 %}<p id="receiptNote" class="note">{{ Sale.Shop.ReceiptSetup.generalMsg|noteformat|raw }}</p>{% endif %}

				{{ _self.client_workorder_agreement(Sale,_context) }}

				{% if not parameters.gift_receipt %}
					<p id="receiptThankYouNote" class="thankyou">
						{% if show_thank_you %}
							Thank You {% if Sale.Customer %}{{Sale.Customer.firstName}} {{Sale.Customer.lastName}}{% endif %}!
						{% endif %}
					</p>
				{% endif %}

				<p class="receiptShopContact">
					<span class="footer__note">
						<span class="footer__note__label">
							Retailer
						</span>
						<span class="footer__note__value">
							{{Sale.Shop.name}}
						</span>
					</span>
					<span class="footer__note">
						<span class="footer__note__label">
							Address
						</span>
						<span class="footer__note__value">
							{{ _self.address(Sale.Shop.Contact)|raw }}
						</span>
					</span>
					<br />
					{% for ContactPhone in Sale.Shop.Contact.Phones.ContactPhone %}
						<span class="footer__note">
							<span class="footer__note__label">
								Phone
							</span>
							<span class="footer__note__value">
								{{ContactPhone.number}}
							</span>
						</span>
					{% endfor %}
					<span class="footer__note">
						<span class="footer__note__label">
							Email
						</span>
						<span class="footer__note__value">
						{% for Email in Sale.Shop.Contact.Emails.ContactEmail %}
							{{Email.address}}
						{% endfor %}
						</span>
					</span>
					<span class="footer__note">
						<span class="footer__note__label">
							Website
						</span>
						<span class="footer__note__value">
							{{Sale.Shop.Contact.Website}}
							https://methodcasting.com
						</span>
					</span>
					<br/>
					{% if isVATAndRegistrationNumberOnReceipt() %}
						{% if Sale.Shop.companyRegistrationNumber|strlen %}
						<span class="footer__note">
							<span class="footer__note__label">
								CC
							</span>
							<span class="footer__note__value">
								{{Sale.Shop.companyRegistrationNumber}}
							</span>
						</span>
						{% endif %}
						{% if Sale.Shop.vatNumber|strlen %}
						<span class="footer__note">
							<span class="footer__note__label">
								VAT
							</span>
							<span class="footer__note__value">
								{{Sale.Shop.vatNumber}}
							</span>
						</span>
						{% endif %}
					{% endif %}
					<span class="footer__note">
						<span class="footer__note__label">
							IBAN
						</span>
						<span class="footer__note__value">
							NL04ABNA0506083438
						</span>
					</span>
					<span class="footer__note">
						<span class="footer__note__label">
							BIC
						</span>
						<span class="footer__note__value">
							ABNANL2A
						</span>
					</span>
				</p>

				{% if show_barcode %}
				<p class="barcodeContainer">
					<img id="barcodeImage" height="50" width="250" class="barcode" src="/barcode.php?type=receipt&number={{Sale.ticketNumber}}&hide_text={{ not show_barcode_sku }}">
				</p>
				{% endif %}

				{% if Sale.completed == 'true' and Sale.SalePayments and not parameters.gift_receipt %}
					{# 
						DO NOT CONSOLIDATE THESE IF STATEMENTS. 
						Twig doesnt play nice with these functions.
					#}
					{% if hasCCPayment(Sale.SalePayments) %}
						{% if isUnifiedReceipt(Sale.SalePayments) %}
							<h2 class="paymentTitle">Transaction Details</h2><br />
							<div id="receiptTransactionDetails">
								<table class="table">
									<tbody>
										{% for Payment in Sale.SalePayments.SalePayment %}
											{% if Payment.PaymentType.type == 'credit card' and Payment.MetaData.ReceiptData.status != 'error' and Payment.archived == 'false' %}
												{% if Payment.MetaData.ReceiptData.type and Payment.MetaData.ReceiptData.authorized_amount %}
													<tr>
														<td class="label top">{{ mostranslate(Payment.MetaData.ReceiptData.type, 'capitalize', true) }}</td>
														<td class="top">{{ Payment.MetaData.ReceiptData.authorized_amount|money }}</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.extra_parameters.statusCode %}
													<tr>
														<td class="label">Status:</td>
														<td>{{ Payment.MetaData.ReceiptData.extra_parameters.statusCode }}</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.card_brand and Payment.MetaData.ReceiptData.card_number %}
													<tr>
														<td class="label">{{ Payment.MetaData.ReceiptData.card_brand }}</td>
														<td>{{ getDisplayableCardNumber(Payment.MetaData.ReceiptData.card_number) }}</td>
													</tr>
												{% endif %}

												{# TODO We dont receive these as of yet #}
												{# <tr>
													<td class="label">Location ID:</td>
													<td>Acceptor ID</td>
												</tr> #}

												{% if Payment.MetaData.ReceiptData.processed_date %}
													<tr>
														<td class="label">Date:</td>
														<td>
															{{ Payment.MetaData.ReceiptData.processed_date|correcttimezone|date(getDateTimeFormat()) }}
														</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.entry_method %}
													<tr>
														<td class="label">Method:</td>
														<td>{{ Payment.MetaData.ReceiptData.entry_method }}</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.authorization_number %}
													<tr>
														<td class="label">Auth Code:</td>
														<td>{{ Payment.MetaData.ReceiptData.authorization_number }}</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkCode or Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkMessage %}
													<tr>
														<td class="label">Response:</td>
														<td>{{ Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkCode }}/{{ Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkMessage }}</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.emv_application_id %}
													<tr>
														<td class="label">AID:</td>
														<td>{{ Payment.MetaData.ReceiptData.emv_application_id }}</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.emv_application_preferred_name %}
													<tr>
														<td class="label">APN:</td>
														<td>{{ Payment.MetaData.ReceiptData.emv_application_preferred_name }}</td>
													</tr>
												{% endif %}

												{% if Payment.MetaData.ReceiptData.emv_cryptogram_type or Payment.MetaData.ReceiptData.emv_cryptogram %}
													<tr>
														<td class="label">Cryptogram:</td>
														<td>{{ Payment.MetaData.ReceiptData.emv_cryptogram_type }}/{{ Payment.MetaData.ReceiptData.emv_cryptogram }}</td>
													</tr>
												{% endif %}

												{% for emvTag in Payment.MetaData.ReceiptData.extra_parameters.emv_tags.children() %}
													<tr>
														<td class="label">{{ emvTag.getName() }}</td>
														<td>{{ emvTag }}</td>
													</tr>
												{% endfor %}

												{# Creates a Line Break for the next Payment #}
												<tr><td colspan="2"><br /></td></tr>
											{% endif %}
										{% endfor %}
									</tbody>
								</table>
							</div>
						{% endif %}
					{% endif %}
				{% endif %}	
			</div>

			<!-- replace.email_custom_footer_msg -->
		{% endif %}
	{% endfor %}
{% endblock content %}

{% macro no_tax_applied_text(Sale) %}
	{% set has_non_taxed_item = 'false' %}
	{% for Line in Sale.SaleLines.SaleLine %}
		{# If line has no tax and is not a workorder line, unless it is the workorders Labor line #}
		{% if ((Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0)) and
			(Line.isWorkorder == 'false' or Line.Note.note == 'Labor')) %}
			{% set has_non_taxed_item = 'true' %}
		{% endif %}
	{% endfor %}
	{% if(has_non_taxed_item == 'true') %}
		<p id="noTaxApplied" class="note text-left">* {{ mostranslate('No Tax Applied') }}</p>
	{% endif %}
{% endmacro %}

{% macro store_receipt(Sale,parameters,options,Payment) %}
	<div class="store">
		{{ _self.title(Sale,parameters,options) }}
			<p class="copy">Store Copy</p>
		{{ _self.date(Sale) }}
		{{ _self.sale_details(Sale,options) }}

		{% if options.show_sale_lines_on_store_copy %}
			{{ _self.receipt(Sale,parameters,true,options) }}
		{% else %}
			<h2 class="paymentTitle text-right">Payments</h2>
			<table class="payments">
				{{ _self.cc_payment_info(Sale,Payment) }}
			</table>
		{% endif %}

		{% if Sale.quoteID and Sale.Quote.notes|strlen > 0 %}<p class="note quote">{{Sale.Quote.notes|noteformat|raw}}</p>{% endif %}

		{{ _self.cc_agreement(Sale,Payment,options) }}
		{{ _self.shop_workorder_agreement(Sale) }}

		<img height="50" width="250" class="barcode" src="/barcode.php?type=receipt&number={{Sale.ticketNumber}}">

		{{ _self.ship_to(Sale) }}
	</div>
{% endmacro %}

{% macro lineDescription(Line,options) %}
	{% if Line.Item %}
		<div class='line_description'>
			{% autoescape true %}{{ Line.Item.description|nl2br }}{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}*{% endif %}{% endautoescape %}
		</div>
	{% endif %}
	{% if Line.Note %}
		<div class='line_note'>
			{% autoescape true %}
				{{ Line.Note.note|noteformat|raw }}
				<!-- If line has no tax and is not a workorder line, unless it is the workorder's "Labor" line -->
				{% if (Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0)) and
					(Line.isWorkorder == 'false' or Line.Note.note == 'Labor') %}
					*
				{% endif %}
			{% endautoescape %}
		</div>
	{% endif %}
	{% if Line.Serialized %}
		{% for Serialized in Line.Serialized.Serialized %}
			<div class='line_serial'>
				Serial#: {{ Serialized.serial }} {{ Serialized.color }} {{ Serialized.size }}
			</div>
		{% endfor %}
	{% endif %}
	{% if options.per_line_employee %}
		<div class='line_note'>
			Employee: {{ Line.Employee.firstName }}
		</div>
	{% endif %}
{% endmacro %}

{% macro title(Sale,parameters,options) %}
	<h1 class="receiptTypeTitle">
		{% if Sale.calcTotal >= 0 %}
			{% if Sale.completed == 'true' %}
				{% if options.invoice_as_title and options.print_layout %}
					<span class="hide-on-print">
				{% endif %}
				{% if options.workorders_as_title and Sale.SaleLines is empty and Sale.Customer.Workorders is defined %}
					 Work Orders
				{% else %}
					{% if parameters.gift_receipt %}Gift{% else %}Sales{% endif %} Receipt
				{% endif %}
				{% if options.invoice_as_title and options.print_layout %}
					</span>
					<span class="show-on-print">
						{% if options.workorders_as_title and Sale.SaleLines is empty and Sale.Customer.Workorders is defined %}
							Work Orders
						{% else %}
							Invoice
						{% endif %}
					</span>
				{% endif %}
			{% elseif Sale.voided == 'true' %}
				{% if options.invoice_as_title and options.print_layout %}
					<span class="hide-on-print">
				{% endif %}
					Receipt <large>VOIDED</large>
				{% if options.invoice_as_title and options.print_layout %}
					</span>
					<span class="show-on-print">Invoice VOIDED</span>
				{% endif %}
			{% else %}
				{% if options.quote_to_invoice %}
					Invoice
				{% else %}
					Quote
				{% endif %}
				{% if not Sale.quoteID %}
					<large>(NOT A RECEIPT)</large>
				{% endif %}
			{% endif %}
		{% else %}
			{% if options.invoice_as_title and options.print_layout %}
				<span class="hide-on-print">
			{% endif %}
			Refund Receipt
			{% if options.invoice_as_title and options.print_layout %}
				</span>
				<span class="show-on-print">Refund Invoice</span>
			{% endif %}
		{% endif %}
	</h1>
{% endmacro %}

{% macro date(Sale) %}
	<p class="date details" id="receiptDateTime">
		<span class="details__item">
			<span class="details__item__label">Date</span>
			<span class="details__item__value">
			{% if Sale.timeStamp %}
				{{Sale.timeStamp|correcttimezone|date(getDateTimeFormat())}}
			{% else %}
				{{"now"|date(getDateTimeFormat())}}
			{% endif %}
			</span>
		</span>
	</p>
{% endmacro %}

{% macro sale_details(Sale,options) %}
	<p id="receiptInfo" class="details">
		{% if options.hide_quote_id_on_sale and Sale.completed == 'true' %}
		{% else %}
			{% if Sale.quoteID > 0 %}
				<span class="receiptQuoteIdField details__item">
					<span class="receiptQuoteIdLabel details__item__label">
						{% if options.quote_to_invoice %}
							Invoice #
						{% else %}
							Quote #
						{% endif %}
					</span>
					<span id="receiptQuoteId details__item__value">{{options.quote_id_prefix}}{{Sale.quoteID}}</span>
				</span>
				<br />
			{% endif %}
		{% endif %}

		{% if options.hide_ticket_number_on_quote and Sale.completed != 'true' and Sale.quoteID > 0 %}
		{% else %}
			<span class="receiptTicketIdField details__item">
				<span class="receiptTicketIdLabel details__item__label">
					{% if options.sale_id_instead_of_ticket_number %}Sale {% else %}Ticket {% endif %}</span>
				<span id="receiptTicketId" class="details__item__value">
					{% if options.sale_id_instead_of_ticket_number %}
						{{options.sale_id_prefix}}{{Sale.saleID}}
					{% else %}
						{{Sale.ticketNumber}}
					{% endif %}
				</span>
			</span>
			<br />
		{% endif %}
		{# Moved this block to footer
		{% if isVATAndRegistrationNumberOnReceipt() %}
			{% if Sale.Shop.vatNumber|strlen %}
				<span class="vatNumberField details__item">
					<span class="vatNumberLabel details__item__label">VAT # </span>
					<span id="vatNumber" class="details__item__value">{{Sale.Shop.vatNumber}}</span>
				</span>
				<br />
			{% endif %}
			{% if Sale.Shop.companyRegistrationNumber|strlen %}
				<span class="companyRegistrationNumberField details__item">
					<span class="companyRegistrationNumberLabel details__item__label">Company registration # </span>
					<span id="companyRegistrationNumber" class="details__item__value">{{Sale.Shop.companyRegistrationNumber}}</span>
				</span>
				<br />
			{% endif %}
		{% endif %}
		#}

		{#
		{% if Sale.Register %}
			<span class="receiptRegisterNameField details__item">
				<span class="receiptRegisterNameLabel details__item__label">Register </span>
				<span id="receiptRegisterName" class="details__item__value">{{Sale.Register.name}}</span>
			</span>
			<br />
		{% endif %}

		{% if Sale.Employee %}
			<span class="receiptEmployeeNameField details__item">
				<span class="receiptEmployeeNameLabel details__item__label">Employee </span>
				<span id="receiptEmployeeName" class="details__item__value">{{Sale.Employee.firstName}}</span>
			</span>
			<br />
		{% endif %}
		#}

		{% if Sale.Customer %}
			{% if Sale.Customer.company|strlen > 0 %}
				<span class="receiptCompanyNameField details__item">
					<span class="receiptCompanyNameLabel details__item__label">Company</span>
					<span id="receiptCompanyName" class="details__item__value">{{Sale.Customer.company}}</span>
				</span>
			{% endif %}

			{% if not options.company_name_override or not Sale.Customer.company|strlen > 0 %}
				<span class="receiptCustomerNameField details__item">
					<span class="receiptCustomerNameLabel details__item__label">Customer</span>
					<span id="receiptCustomerName" class="details__item__value">{{Sale.Customer.firstName}} {{Sale.Customer.lastName}}</span>
				</span>
			{% endif %}

			{% if not options.show_customer_name_only %}
				{% set ContactAddress = Sale.Customer.Contact.Addresses.ContactAddress %}
				{% if options.show_full_customer_address and ContactAddress.address1 %}
					<span class="receiptCustomerAddressField details__item">
						<span class="receiptCustomerAddressLabel details__item__label" style="display: none;">Address</span>
						<span class="details__item__value">
						{{ ContactAddress.address1 }}
						{{ ContactAddress.address2 }}
						{% if ContactAddress.city %}<br /> {{ ContactAddress.city }}{% endif %}
						{% if ContactAddress.zip %}, {{ ContactAddress.zip }}{% endif %}
						{% if ContactAddress.state %}, {{ ContactAddress.state }}{% endif %}
						{% if ContactAddress.country %}<br /> {{ ContactAddress.country }}{% endif %}
						</span>
					</span>
				{% endif %}

				<span id="receiptPhonesContainer" class="details__item">
					{% for Phone in Sale.Customer.Contact.Phones.ContactPhone %}
						<span data-automation="receiptPhoneNumber" class="details__item__label" style="display: none;">{{Phone.useType}}</span>
						<span class="details__item__value">{{Phone.number}} <small>({{Phone.useType}})</small></span>
					{% endfor %}

					{% for Email in Sale.Customer.Contact.Emails.ContactEmail %}
						<span class="receiptEmailLabel details__item__label" style="display: none;">Email </span>
						<span id="receiptEmail" class="details__item__value">{{Email.address}}</span>
					{% endfor %}
				</span>
			{% endif %}

			{% if isVATAndRegistrationNumberOnReceipt() %}
				{% if Sale.Customer.vatNumber|strlen %}
					<span class="receiptCustomerVatField details__item">
						<span class="receiptCustomerVatLabel details__item__label">Customer VAT # </span>
						<span id="customerVatNumber" class="details__item__value">{{Sale.Customer.vatNumber}}</span>
					</span>
					<br />
				{% endif %}

				{% if Sale.Customer.companyRegistrationNumber|strlen %}
					<span class="receiptCustomerCompanyVatField details__item">
						<span class="receiptCustomerCompanyVatLabel details__item__label">Customer company registration # </span>
						<span id="customerCompanyVatNumber" class="details__item__value">{{Sale.Customer.companyRegistrationNumber}}</span>
					</span>
					<br />
				{% endif %}
			{% endif %}

			{% if options.show_customer_notes %}
				{% if Sale.Customer.Note.note|strlen > 0 %}
					<span class="receiptCustomerNoteField details__item">
						<span class="receiptCustomerNoteLabel details__item__label">Note </span>
						<span class="details__item__value">{{ Sale.Customer.Note.note|noteformat|raw }}</span>
					</span>
					<br />
				{% endif %}
			{% endif %}
		{% endif %}
	</p>
{% endmacro %}

{% macro line(isTaxInclusive,Line,parameters,options) %}
	<tr>
		<th data-automation="lineItemDescription" class="description">
			{{ _self.lineDescription(Line,options) }}
			{% if options.per_line_discount == true and not parameters.gift_receipt %}
				{% if Line.calcLineDiscount > 0 %}
					<small>Discount: '{{ Line.Discount.name }}' -{{Line.calcLineDiscount|money}}</small>
				{% elseif Line.calcLineDiscount < 0 %}
					<small>Discount: '{{ Line.Discount.name }}' {{Line.calcLineDiscount|getinverse|money}}</small>
				{% endif %}
			{% endif %}
		</th>

		{% if options.show_custom_sku and Line.Item.customSku %}
			<td class="custom_field">{{ Line.Item.customSku }}</td>
		{% endif %}
		{% if options.show_manufacturer_sku and Line.Item.manufacturerSku %}
			<td class="custom_field">{{ Line.Item.manufacturerSku }}</td>
		{% endif %}

		{% if options.show_msrp == true and not parameters.gift_receipt %}
			{% set msrp_printed = false %}
			{% for price in Line.Item.Prices.ItemPrice if not msrp_printed %}
				{% if price.useType == "MSRP" and price.amount != "0"%}
					<td class="custom_field">{{ price.amount|money }}</td>
					{% set msrp_printed = true %}
				{% endif %}
			{% endfor %}
			{% if not msrp_printed %}
				<td class="custom_field">N/A</td>
			{% endif %}
		{% endif %}

		<td data-automation="lineItemQuantity" class="quantity">
			{% if options.per_line_subtotal and options.discounted_line_items and Line.calcLineDiscount != 0 and not parameters.gift_receipt %}
				<span class="strike">{{Line.unitQuantity}} x {{Line.displayableUnitPrice|money}}</span>
			{% endif %}
			{{Line.unitQuantity}}
			{% if options.per_line_subtotal and not parameters.gift_receipt %} x
				{% if options.discounted_line_items %}
					{{ divide(Line.displayableSubtotal, Line.unitQuantity)|money }}
				{% else %}
					{{Line.displayableUnitPrice|money}}
				{% endif %}
			{% endif %}
		</td>

		<td data-automation="lineItemPrice" class="amount">
			{% if not parameters.gift_receipt %}
				{% if options.discounted_line_items and not options.per_line_subtotal and Line.calcLineDiscount != 0 %}
					{% if not isTaxInclusive or isTaxInclusive == 'false' %}
						<span class="strike">{{ Line.calcSubtotal|money }}</span><br />
					{% else %}
						<span class="strike">{{ multiply(Line.displayableUnitPrice, Line.unitQuantity)|money }}</span><br />
					{% endif %}
				{% endif %}
				{{ Line.displayableSubtotal|money }}
			{% endif %}
		</td>
	</tr>
{% endmacro %}

{% macro receipt(Sale,parameters,store_copy,options) %}
	{% if Sale.SaleLines %}
		<table class="sale lines">
			<tr>
				<th class="description table__th">Description</th>

				{% if options.show_custom_sku and options.show_manufacturer_sku %}
					<th class="custom_field table__th">Custom SKU</th>
					<th class="custom_field table__th">Man. SKU </th>
				{% elseif options.show_custom_sku or options.show_manufacturer_sku %}
					<th class="custom_field table__th">SKU</th>
				{% endif %}

				{% if options.show_msrp and not parameters.gift_receipt %}
					<th class="custom_field table__th">MSRP</th>
				{% endif %}

				<th class="quantity table__th">Amount</th>

				{% if not parameters.gift_receipt %}
					<th class="amount table__th">Price</th>
				{% endif %}
			</tr>
			<tbody>
				{% for Line in Sale.SaleLines.SaleLine %}
					{{ _self.line(Sale.isTaxInclusive,Line,parameters,options) }}
				{% endfor %}
			</tbody>
		</table>

		{% if not parameters.gift_receipt %}
			<table class="saletotals totals">
				<tbody id="receiptSaleTotals">
					<tr>
						<td width="100%">
							{% if options.discounted_line_items and Sale.calcDiscount != 0 %}
								Subtotal w/ Discounts
							{% else %}
								Subtotal
							{% endif %}
						</td>
						<td id="receiptSaleTotalsSubtotal" class="amount">
							{% if options.discounted_line_items %}
								{{ subtract(Sale.displayableSubtotal, Sale.calcDiscount)|money}}
							{% else %}
								{{Sale.displayableSubtotal|money}}
							{% endif %}
						</td>
					</tr>
					{% if not options.discounted_line_items and Sale.calcDiscount > 0 %}
						<tr><td>Discounts</td><td id="receiptSaleTotalsDiscounts" class="amount">-{{Sale.calcDiscount|money}}</td></tr>
					{% elseif not options.discounted_line_items and Sale.calcDiscount < 0 %}
						<tr><td>Discounts</td><td id="receiptSaleTotalsDiscounts" class="amount">{{Sale.calcDiscount|getinverse|money}}</td></tr>
					{% endif %}
					{% for Tax in Sale.TaxClassTotals.Tax %}
						{% if Tax.taxname and Tax.rate > 0 %}
							<tr><td data-automation="receiptSaleTotalsTaxName" width="100%">{{Tax.taxname}} ({{Tax.subtotal|money}} @ {{Tax.rate}}%)</td><td data-automation="receiptSaleTotalsTaxValue" class="amount">{{Tax.amount|money}}</td></tr>
						{% endif %}
						{% if Tax.taxname2 and Tax.rate2 > 0 %}
							<tr><td data-automation="receiptSaleTotalsTaxName" width="100%">{{Tax.taxname2}} ({{Tax.subtotal2|money}} @ {{Tax.rate2}}%)</td><td data-automation="receiptSaleTotalsTaxValue" class="amount">{{Tax.amount2|money}}</td></tr>
						{% endif %}
					{% endfor %}
					<tr><td width="100%">Total Tax</td><td id="receiptSaleTotalsTax" class="amount">{{Sale.taxTotal|money}}</td></tr>
					<tr class="total"><td>Total</td><td id="receiptSaleTotalsTotal" class="amount">{{Sale.calcTotal|money}}</td></tr>
				</tbody>
			</table>
		{% endif %}
	{% endif %}

	{% if Sale.completed == 'true' and not parameters.gift_receipt %}
		{% if Sale.SalePayments %}
			<h2 class="paymentTitle text-right">Payments</h2>
			<table id="receiptPayments" class="payments">
				<tbody>
					{% for Payment in Sale.SalePayments.SalePayment %}
						{% if Payment.PaymentType.name != 'Cash' %}
							<!-- NOT Cash Payment -->
							{% if Payment.CreditAccount.giftCard == 'true' %}
								<!--  Gift Card -->
								{% if Payment.amount > 0 %}
									<tr>
										<td class="label">Gift Card Charge</td>
										<td id="receiptPaymentsGiftCardValue" class="amount">{{Payment.amount|money}}</td>
									</tr>
									<tr>
										<td class="label">Balance</td>
										<td id="receiptPaymentsGiftCardBalance" class="amount">{{Payment.CreditAccount.balance|getinverse|money}}</td>
									</tr>
								{% elseif Payment.amount < 0 and Sale.calcTotal < 0 %}
									<tr>
										<td class="label">Refund To Gift Card</td>
										<td id="receiptPaymentsGiftCardValue" class="amount">{{Payment.amount|getinverse|money}}</td>
									</tr>
									<tr>
										<td class="label">Balance</td>
										<td id="receiptPaymentsGiftCardBalance" class="amount">{{Payment.CreditAccount.balance|getinverse|money}}
									</tr>
								{% elseif Payment.amount < 0 and Sale.calcTotal >= 0 %}
									<tr>
										<td class="label">Gift Card Purchase</td>
										<td id="receiptPaymentsGiftCardValue" class="amount">{{Payment.amount|getinverse|money}}</td>
									</tr>
									<tr>
										<td class="label">Balance</td>
										<td id="receiptPaymentsGiftCardBalance" class="amount">{{Payment.CreditAccount.balance|getinverse|money}}</td>
									</tr>
								{% endif %}
							{% elseif Payment.creditAccountID == 0 %}
								<!--  NOT Customer Account -->
								{{ _self.cc_payment_info(Sale,Payment) }}
							{% elseif Payment.CreditAccount and Payment.archived == 'false' %}
								<!-- Customer Account -->
								<tr>
									{% if Payment.amount < 0 %}
									<td class="label">Account Deposit</td>
									<td id="receiptPaymentsCreditAccountDepositValue" class="amount">{{Payment.amount|getinverse|money}}</td>
									{% else %}
									<td class="label">Account Charge</td>
									<td id="receiptPaymentsCreditAccountChargeValue" class="amount">{{Payment.amount|money}}</td>
									{% endif %}
								</tr>
							{% endif %}
						{% endif %}
					{% endfor %}
					<tr><td colspan="2"></td></tr>
					{{ _self.sale_cash_payment(Sale) }}
				</tbody>
			</table>
		{% endif %}

		{% if Sale.Customer and not store_copy %}
			{% if options.show_customer_layaways %}
				{{ _self.layaways(Sale.Customer,Sale.isTaxInclusive,parameters.gift_receipt,options)}}
			{% endif %}
			{% if options.show_customer_specialorders %}
				{{ _self.specialorders(Sale.Customer,Sale.isTaxInclusive,parameters.gift_receipt,options)}}
			{% endif %}
			{% if options.show_customer_workorders %}
				{{ _self.workorders(Sale.Customer,parameters.gift_receipt,options)}}
			{% endif %}
		{% endif %}

		{% if options.show_customer_credit_account and Sale.Customer and not parameters.gift_receipt and not store_copy %}
			{% if Sale.Customer.CreditAccount and Sale.Customer.CreditAccount.MetaData.creditBalanceOwed > 0 or Sale.Customer.CreditAccount.MetaData.extraDeposit > 0 %}
				<h2 class="footerSectionTitle">Store Account</h2>
				<table class="totals">
					{% if Sale.Customer.CreditAccount.MetaData.creditBalanceOwed > 0 %}
						<tr>
							<td width="100%">Balance Owed: </td>
							<td class="amount">{{ Sale.Customer.CreditAccount.MetaData.creditBalanceOwed|money }}</td>
						</tr>
					{% elseif Sale.Customer.CreditAccount.MetaData.extraDeposit > 0 %}
						<tr>
							<td width="100%">On Deposit: </td>
							<td class="amount">{{ Sale.Customer.CreditAccount.MetaData.extraDeposit|money }}</td>
						</tr>
					{% endif %}
				</table>
			{% endif %}
			{% if Sale.Customer.MetaData.getAmountToCompleteAll > 0 %}
				<table class="totals">
					<tr class="total">
						<td width="100%">Remaining Balance: </td>
						<td class="amount">{{ Sale.Customer.MetaData.getAmountToCompleteAll|money }}</td>
					</tr>
				</table>
			{% endif %}
		{% endif %}
	{% endif %}
{% endmacro %}

{% macro cc_payment_info(Sale,Payment) %}
	<tr>
		{% if Payment.archived == 'false' %}
			{% if Payment.ccChargeID > 0 and Payment.CCCharge.declined == 'false' %}
				<td class="label" width="100%">
					{{ Payment.PaymentType.name }}
					<br>Card Num: {{Payment.CCCharge.xnum}}
					{% if Payment.CCCharge.cardType|strlen > 0 %}
						<br>Type: {{Payment.CCCharge.cardType}}
					{% endif %}
					{% if Payment.CCCharge.cardholderName|strlen > 0 %}
						<br>Cardholder: {{Payment.CCCharge.cardholderName}}
					{% endif %}
					{% if Payment.CCCharge.entryMethod|strlen > 0 %}
						<br>Entry: {{Payment.CCCharge.entryMethod}}
					{% endif %}
					{% if Payment.CCCharge.authCode|strlen > 0 %}
						<br>Approval: {{Payment.CCCharge.authCode}}
					{% endif %}
					{% if Payment.CCCharge.gatewayTransID|strlen > 0 and Payment.CCCharge.gatewayTransID|strlen < 48 %}
						<br>ID: {{Payment.CCCharge.gatewayTransID}}
					{% endif %}
					{% if Payment.CCCharge.MetaData.isEMV %}
						{% if Payment.CCCharge.MetaData.AID|strlen > 0 %}
							<br>AID: {{Payment.CCCharge.MetaData.AID}}
						{% endif %}
						{% if Payment.CCCharge.MetaData.ApplicationLabel|strlen > 0 %}
							<br>Application Label: {{Payment.CCCharge.MetaData.ApplicationLabel}}
						{% endif %}
						{% if Payment.CCCharge.MetaData.PINStatement|strlen > 0 %}
							<br>PIN Statement: {{Payment.CCCharge.MetaData.PINStatement}}
						{% endif %}
					{% endif %}
				</td>
				<td class="amount">{{Payment.amount|money}}</td>
			{% elseif Payment.ccChargeID == 0 %}
				<td class="label" width="100%">
					{{ Payment.PaymentType.name }}
				</td>
				<td class="amount">{{Payment.amount|money}}</td>
			{% endif %}
		{% endif %}
	</tr>
{% endmacro %}

{% macro cc_agreement(Sale,Payment,options) %}
	{% if Payment.CCCharge %}
		{% if Sale.Shop.ReceiptSetup.creditcardAgree|strlen > 0 %}
			<p>{{Sale.Shop.ReceiptSetup.creditcardAgree|noteformat|raw}}</p>
		{% endif %}
		<dl id="signatureSection" class="signature">
			<dt>Signature:</dt>
			<dd>
				{{Payment.CCCharge.cardholderName}}<br />
			</dd>
		</dl>
	{% endif %}
{% endmacro %}

{% macro shop_workorder_agreement(Sale) %}
	{% if Sale.Shop.ReceiptSetup.workorderAgree|strlen > 0 and Sale.Workorders %}
	<!--
		@FIXME
		Should only print this work_order agreement if it's never been signed before.
		transaction->customer_id->printWorkorderAgreement($transaction->transaction_id)  -->
		<div class="signature">
			<p>{{Sale.Shop.ReceiptSetup.workorderAgree|noteformat|raw}}</p>
			<dl class="signature">
				<dt>Signature:</dt>
				<dd>{{Sale.Customer.firstName}} {{Sale.Customer.lastName}}</dd>
			</dl>
		</div>
	{% endif %}
{% endmacro %}

{% macro client_workorder_agreement(Sale,options) %}
	{% if options.workorders_as_title and Sale.SaleLines is empty and Sale.Customer.Workorders is defined and Sale.Shop.ReceiptSetup.workorderAgree|strlen > 0 %}
		<p>{{Sale.Shop.ReceiptSetup.workorderAgree|noteformat|raw}}</p>
	{% endif %}
{% endmacro %}

{% macro ship_to(Sale) %}
	{% if Sale.ShipTo %}
		<div class="shipping">
			<h4>Ship To</h4>
			{{ _self.shipping_address(Sale.ShipTo,Sale.ShipTo.Contact) }}

			{% for Phone in Sale.ShipTo.Contact.Phones.ContactPhone %}{% if loop.first %}
				<p>Phone: {{Phone.number}} ({{Phone.useType}})</p>
			{% endif %}{% endfor %}

			{% if Sale.ShipTo.shipNote|strlen > 0 %}
				<h5>Instructions</h5>
				<p>{{Sale.ShipTo.shipNote}}</p>
			{% endif %}
		</div>
	{% endif %}
{% endmacro %}

{% macro shipping_address(Customer,Contact) %}
	<p>
		{% if Customer.company|strlen > 0 %}{{Customer.company}}<br>{% endif %}
		{% if Customer.company|strlen > 0 %}Attn:{% endif %} {{Customer.firstName}} {{Customer.lastName}}<br>
		{{ _self.address(Contact) }}
	</p>
{% endmacro %}

{% macro address(Contact,delimiter) %}
	{% if delimiter|strlen == 0 %}{% set delimiter = '<br>' %}{% endif %}
	{% autoescape false %}
		{% for Address in Contact.Addresses.ContactAddress %}
			{% if loop.first and Address.address1 %}
				{{Address.address1}}{{delimiter}}
				{% if Address.address2|strlen > 0 %} {{Address.address2}}{{delimiter}}{% endif %}
				{{Address.city}}, {{Address.state}} {{Address.zip}} {{Address.country}}
			{% endif %}
		{% endfor %}
	{% endautoescape %}
{% endmacro %}

{% macro header(Sale,options) %}
	<div class="receiptHeader">
		{% set logo_printed = false %}
		{% if options.multi_shop_logos %}
			{% for shop in options.shop_logo_array if not logo_printed %}
				{% if shop.name == Sale.Shop.name %}
					{% if shop.logo_url|strlen > 0 %}
						<img src="{{ shop.logo_url }}" width="{{ options.logo_width }}" height="{{ options.logo_height }}" class="logo">
						{% set logo_printed = true %}
					{% endif %}
				{% endif %}
			{% endfor %}
		{% endif %}

		{% if Sale.Shop.ReceiptSetup.logo|strlen > 0 and not logo_printed %}
			<img src="{{Sale.Shop.ReceiptSetup.logo}}" width="{{ options.logo_width }}" height="{{ options.logo_height }}" class="logo">
			{% if show_shop_name_with_logo %}
				<h3 class="receiptShopName">{{ Sale.Shop.name }}</h3>
			{% endif %}
		{% else %}
			{% if show_shop_name_with_logo %}
			<h3 class="receiptShopName">{{ Sale.Shop.name }}</h3>
			{% endif %}
		{% endif %}
		{% if Sale.Shop.ReceiptSetup.header|strlen > 0 %}
			<p>{{Sale.Shop.ReceiptSetup.header|nl2br|raw}}</p>
		{% endif %}
	</div>
{% endmacro %}

{% macro layaways(Customer,isTaxInclusive,parameters,options) %}
	{% if Customer.Layaways and Customer.Layaways|length > 0 %}
		<h2 class="footerSectionTitle">{{ mostranslate('layaway', 'plural', true, 'capitalize', true) }}</h2>
		<table class="lines layaways">
			<tbody>
			{% for Line in Customer.Layaways.SaleLine %}
				{{ _self.line(isTaxInclusive,Line,parameters,options)}}
			{% endfor %}
			</tbody>
		</table>
		<table class="layways totals">
			<tr>
				<td class="label" width="100%">Subtotal</td>
				<td class="amount">{{Customer.MetaData.layawaysSubtotalNoDiscount|money}}</td>
			</tr>
			{% if Customer.MetaData.layawaysAllDiscounts > 0 %}
				<tr>
					<td class="label" width="100%">Discounts</td>
					<td class="amount">{{Customer.MetaData.layawaysAllDiscounts|getinverse|money}}</td>
				</tr>
			{% endif %}
			<tr>
				<td class="label" width="100%">Total Tax</td>
				<td class="amount">{{Customer.MetaData.layawaysTaxTotal|money}}</td>
			</tr>
			<tr class="total">
				<td class="label" width="100%">Total</td>
				<td class="amount">{{Customer.MetaData.layawaysTotal|money}}</td>
			</tr>
		</table>
	{% endif %}
{% endmacro %}

{% macro specialorders(Customer,isTaxInclusive,parameters,options) %}
	{% if Customer.SpecialOrders|length > 0 %}
		<h2 class="footerSectionTitle" id="lineItemSectionSO">Special Orders</h2>
		<table id="containerSOLineItems" class="lines specialorders">
			<tbody>
				{% for Line in Customer.SpecialOrders.SaleLine %}
					{{ _self.line(isTaxInclusive,Line,parameters,options) }}
				{% endfor %}
			</tbody>
		</table>
		<table id="containerSOTotals" class="specialorders totals">
			<tr>
				<td class="label" width="100%">Subtotal</td>
				<td class="amount">{{Customer.MetaData.specialOrdersSubtotalNoDiscount|money}}</td>
			</tr>
			{% if Customer.MetaData.specialOrdersAllDiscounts > 0 %}
				<tr>
					<td class="label" width="100%">Discounts</td>
					<td class="amount">{{Customer.MetaData.specialOrdersAllDiscounts|getinverse|money}}</td>
				</tr>
			{% endif %}
			<tr>
				<td class="label" width="100%">Total Tax</td>
				<td class="amount">{{Customer.MetaData.specialOrdersTaxTotal|money}}</td>
			</tr>
			<tr class="total">
				<td class="label" width="100%">Total</td>
				<td class="amount">{{Customer.MetaData.specialOrdersTotal|money}}</td>
			</tr>
		</table>
	{% endif %}
{% endmacro %}

{% macro workorders(Customer,parameters,options) %}
	{% if Customer.Workorders|length > 0 %}
		<h2 class="footerSectionTitle">Open Workorders</h2>
		<table class="lines workorders">
			{% for Line in Customer.Workorders.SaleLine %}
				<tr>
					{% if Line.MetaData.workorderTotal %}
						<td class="workorder" colspan="2">
							{{ _self.lineDescription(Line,options) }}
							{% if options.show_workorders_barcode %}
								<p class="barcodeContainer">
									<img id="barcodeImage"
											 height="50"
											 width="250"
											 class="barcode"
											 src="/barcode.php?type=receipt&number={{ Line.MetaData.workorderSystemSku }}&&hide_text={{ not options.show_workorders_barcode_sku }}">
								</p>
							{% endif %}
						</td>
					{% else %}
						<td>{{ _self.lineDescription(Line,options) }}</td>
						<td class="amount">{{Line.calcSubtotal|money}}</td>
					{% endif %}
				</tr>
			{% endfor %}
		</table>
		{% if Customer.MetaData.workordersTotal > 0 %}
			<table class="workorders totals">
				<tr>
					<td class="label" width="100%">Subtotal</td>
					<td class="amount">{{Customer.MetaData.workordersSubtotalNoDiscount|money}}</td>
				</tr>
				{% if Customer.MetaData.specialOrdersAllDiscounts > 0 %}
					<tr>
						<td class="label" width="100%">Discounts</td>
						<td class="amount">{{Customer.MetaData.workordersAllDiscounts|getinverse|money}}</td>
					</tr>
				{% endif %}
				<tr>
					<td class="label" width="100%">Total Tax</td>
					<td class="amount">{{Customer.MetaData.workordersTaxTotal|money}}</td>
				</tr>
				<tr class="total">
					<td class="label" width="100%">Total</td>
					<td class="amount">{{Customer.MetaData.workordersTotal|money}}</td>
				</tr>
			</table>
		{% endif %}
	{% endif %}
{% endmacro %}

{% macro sale_cash_payment(Sale) %}
	{% set total = Sale.change|floatval %}
	{% set pay_cash = 'false' %}
	{% for Payment in Sale.SalePayments.SalePayment %}
		{% if Payment.PaymentType.name == 'Cash' %}
			{% set total = total + Payment.amount|floatval %}
			{% set pay_cash = 'true' %}
		{% endif %}
	{% endfor %}
	{% if pay_cash == 'true' %}
		<tr><td class="label">Cash</td><td id="receiptPaymentsCash" class="amount">{{total|money}}</td></tr>
		<tr><td class="label">Change</td><td id="receiptPaymentsChange" class="amount">{{Sale.change|money}}</td></tr>
	{% endif %}
{% endmacro %}
