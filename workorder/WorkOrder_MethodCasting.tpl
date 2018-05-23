{% extends parameters.print ? "printbase" : "base" %}
{% block extrastyles %}

{#
	Custom CSS Variables
#}
{% set css_color_black = '#212121' %}
{% set css_color_gray = '#919191' %}
{% set css_color_gray_alt = '#000' %}

<!-- default -->

@page { margin: 0px; }
body {
    margin: 0;
    font: normal 10pt 'Nexa', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
.pagebreak {
    page-break-after: always;
}

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

.workorder {
    margin: 0;
}

.header {
    margin-bottom: 30px;
}

.header p {
    margin: 0;
}

.receiptTypeTitle {
    font-size: 20pt;
    font-weight: 200;
    margin-bottom: 15px;
    text-transform: uppercase;
}

.header h3 {
    font-size: 10pt;
    margin: 0;
}

.header img {
    display: block;
    margin: 8px auto 4px;
    height: {{ Workorder.Shop.ReceiptSetup.logoHeight }};
    width: {{ Workorder.Shop.ReceiptSetup.logoWidth }}
}

.detail h2 {
    margin: 0px 0px 10px 0px;
    padding: 0px;
    font-size: 11pt;
}

.detail h3 {
    margin: 0px 0px 10px 0px;
    padding: 0px;
    font-size: 11pt;
    text-decoration: underline;
}

.detail { 
    margin-bottom: 1em;
}

.detail p {
    margin: 0;
}

table.lines, table.totals {
    width: 100%;
    border-spacing:0;
    border-collapse:collapse;
    clear: both;
}
table.lines {
    border-top: 2px solid {{ css_color_gray }};
}
table.totals {
    margin-top: 20px;
}
th.table__th {
	text-transform: uppercase;
	color: {{ css_color_gray_alt }};
	font-weight: 300;
}

table.lines td {
    padding: 4px 0;
}

table.totals td {
    margin: 0px;
}
table.totals td.amount {
    padding-left: 30px;
}

table.lines tbody tr th:first-child,
table.lines tbody tr td:first-child {
    padding-left: 30px;
}
table.lines tbody tr:first-child th,
table.lines tbody tr:first-child td {
    padding-top: 20px;
    padding-bottom: 0;
}

table.lines .td__notes {
    margin-left: 15px;
}

table td.amount {
    width: 10%;
    text-align: right;
}
        
table.totals {
    text-align: right;
}

table.totals tr td:first-child {
    padding-right: 10px;
}

table tr.total td {
    font-weight: bold;
}

table .description {
    font-weight: bold;
}

table p {
    font-weight: normal;
    margin: 0;
}

.notes {
    overflow: hidden;
    margin: 0 0 2em;
    text-align: center;
    color: #000;
    line-height: 1.1;
}
.notes h3 {
    font-weight: 300;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.notes h1 {
    margin: 1em 0 0;
}

img.barcode {
    display: block;
    margin: 2em auto;
}

.receiptShopContact {
    margin: 0;
    line-height: 1.5;
    text-align: center;
}

.details {
	font-size: 10pt;
	text-align: right;
	margin: 10px 0;
}
.details + .details {
	margin-top: 0;
}
.details.date {
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

.footer__note {
	font-size: 8pt;
	display: block;
	margin-bottom: 5px;
}
.footer__note__label {
	display: block;
	text-transform: uppercase;
	font-weight: 300;
	color: {{ css_color_gray }};
}
.footer__note__value {
	display: block;
}
.footer__note__value br {
	display: none;
}

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

    hr {
        margin-top: 15px;
        margin-bottom: 15px;
        border: 0;
        border-top: 2px solid {{ css_color_gray }};
    }

    .receiptTypeTitle, .receiptTypeTitle span {
        font-size: 22pt;
        text-align: left;
        margin-top: 0;
        margin-bottom: 36px;
        padding-left: 30px;
    }

    th.table__th,
	.paymentTitle,
	.footerSectionTitle {
		color: {{ css_color_gray }} !important;
		font-size: 6pt;
	}

    .details {
        font-weight: 300;
    }
    .details__item__value {
        font-size: 10pt;
        margin-bottom: 10px;
    }
    .details__item__label {
		color: {{ css_color_gray }} !important;
		font-size: 6pt;
	}
    
    .footer__note {
        display: inline-block;
        margin-bottom: 0;
        font-size: 6pt;
    }
    .footer__note__label,
    .footer__note__value {
        display: inline;
        font-weight: 400;
    }
    .footer__hr {
        margin-top: 100px;
    }
    .notes {
        font-size: 7pt;
        color: {{ css_color_gray }};
    }
    img.barcode {
        border: none;
        height: 30px;
        width: 150px;
    }

}

{% endblock extrastyles %}


{% block content %}
    <!-- replace.email_custom_header_msg -->
    {% for Workorder in Workorders %}
        <div class="workorder {% if not loop.last %} pagebreak{% endif %}">
            
            <div class="header">
                {% if parameters.type == 'invoice' %}
                    {% if Workorder.Shop.ReceiptSetup.hasLogo == "true" %}
                        <img class="header" src="{{ Workorder.Shop.ReceiptSetup.logo }}" height="{{ Workorder.Shop.ReceiptSetup.logoHeight }}" width="{{ Workorder.Shop.ReceiptSetup.logoWidth }}">
                    {% else %}
                    <h3>{{ Workorder.Shop.name }}</h3>
                    {% endif %}
                    {% if Workorder.Shop.ReceiptSetup.header|strlen > 0 %}
                        {{ Workorder.Shop.ReceiptSetup.header|nl2br|raw }}
                    {% endif %}
                {% endif %}
                <div class="row align-items-end">
                    <div class="col-6">
                        <h1 class="receiptTypeTitle">Work Order <small>#{{ Workorder.workorderID }}</small></h1>
                        {% if parameters.type == 'shop-tag' %}
                            {% if Workorder.hookIn|strlen > 0 or Workorder.hookOut|strlen > 0 %}
                                <h1 style="margin-top:20px;">Hook In: {{Workorder.hookIn}} <br />
                                Hook Out: {{Workorder.hookOut}}</h1>
                            {% endif %}
                        {% endif %}
                    </div>
                    <div class="col-6">
                        <div class="details">
                            <div class="details__item">
                                <div class="details__item__label">Started</div>
                                <div class="details__item__value">
                                    {{Workorder.timeIn|correcttimezone|date ("m/d/y h:i a")}}
                                </div>
                            </div><!-- /.item -->
                            <div class="details__item">
                                <div class="details__item__label">Due on</div>
                                <div class="details__item__value">
                                    {{Workorder.etaOut|correcttimezone|date ("m/d/y h:i a")}}
                                </div>
                            </div><!-- /.item -->
                            {% for serializedID in Workorder.Serialized %}
                            <div class="details__item">
                                <div class="details__item__label">Work Order Item</div>
                                <div class="details__item__value">
                                    {% if Workorder.Serialized.description|strlen > 0 %}
                                        {{ Workorder.Serialized.description }}
                                    {% elseif Workorder.Serialized.Item.description|strlen > 0 %}
                                        {{ Workorder.Serialized.Item.description }}
                                    {% endif %}
                                    {% if Workorder.Serialized.colorName|strlen > 0 %}
                                        / {{ Workorder.Serialized.colorName }}
                                    {% endif %}
                                    {% if Workorder.Serialized.sizeName|strlen > 0 %}
                                        / {{ Workorder.Serialized.sizeName }}
                                    {% endif %}
                                    {% if Workorder.Serialized.serial|strlen > 0 %}
                                        / {{ Workorder.Serialized.serial }}
                                    {% endif %}
                                </div>
                            </div><!-- /.item -->
                            {% endfor %}
                            <div class="details__item">
                                <div class="details__item__label">Customer</div>
                                <div class="details__item__value">
                                    <p>{{ Workorder.Customer.firstName}} {{ Workorder.Customer.lastName}}</p>
                                    <p>{{ Workorder.Customer.Contact.Addresses.ContactAddress.address1 }}</p>
                                    <p>{{ Workorder.Customer.Contact.Addresses.ContactAddress.address2 }}</p>
                                    <p>{{ Workorder.Customer.Contact.Addresses.ContactAddress.city }}{% if Workorder.Customer.Contact.Addresses.ContactAddress.state|strlen > 0 %}, {% endif %}{{ Workorder.Customer.Contact.Addresses.ContactAddress.state }} {{ Workorder.Customer.Contact.Addresses.ContactAddress.zip }}</p>
                                    {% for ContactPhone in Workorder.Customer.Contact.Phones.ContactPhone %}
                                        <p>{{ ContactPhone.number }} <small>({{ ContactPhone.useType }})</small></p>
                                    {% endfor %}
                                    {% for ContactEmail in Workorder.Customer.Contact.Emails.ContactEmail %}
                                        <p>{{ ContactEmail.address }}</p>
                                    {% endfor %}
                                </div>
                            </div><!-- /.item -->
                        </div>
                        
                    </div>
                </div>
            </div>

            <table class="lines">
                <tr>
                    <th class="table__th" style="text-align: left;">Item/Labor</th>
                    <th class="table__th">Notes</th>
                    <th class="table__th" style="text-align: right">Charge</th>
                </tr>
                {% for WorkorderItem in Workorder.WorkorderItems.WorkorderItem %}
                <tr>
                    {% if WorkorderLine.itemID != 0 %}
                        <td class="description">
                        </td>
                    {% else %}
                        <td class="description">
                            {% if WorkorderItem.unitQuantity > 0 %}
                                {{ WorkorderItem.unitQuantity }} &times;
                            {% endif %}
                            {{ WorkorderItem.Item.description }}
                            {% if WorkorderItem.Discount %}
                                <p>Discount: {{ WorkorderItem.Discount.name }} (-{{ WorkorderItem.SaleLine.calcLineDiscount|money }})</p>
                            {% endif %}
                         </td>
                    {% endif %}
                
                        <td class="td__notes">
                            {{ WorkorderItem.note }}
                        </td>

                        {% if WorkorderItem.warranty == 'true' %}
                            <td class="amount"> $0.00
                        {% endif %}
                    
                        {% if WorkorderItem.warranty == 'false' %}
                            <td class="amount">        
                                {{ WorkorderItem.SaleLine.calcSubtotal|money }}
                            </td>
                        {% endif %}
                    </tr>
                {% endfor %}
                
                {% for WorkorderLine in Workorder.WorkorderLines.WorkorderLine %} <!--this loop is necessary for showing labor charges -->
                    <tr>
                        {% if WorkorderLine.itemID != 0 %}
                            <td class="description">
                                {{ WorkorderLine.Item.description }}
                                {% if WorkorderLine.Discount %}
                                    <br />
                                    <p>Discount: {{ WorkorderLine.Discount.name }} (-{{ WorkorderLine.SaleLine.calcLineDiscount|money }})</p>
                                {% endif %}
                             </td>
                             <td class="td__notes">
                                 {{ WorkorderLine.note }}
                             </td>
                        {% else %}
                            <td class="td__notes" colspan="2">
                            {{ WorkorderLine.note }}
                                {% if WorkorderLine.Discount %}
                                    <br />
                                    Discount: {{ WorkorderLine.Discount.name }} (-{{ WorkorderLine.SaleLine.calcLineDiscount|money }})
                                {% endif %}
                            </td>
                        {% endif %}
                        
                        <td class="amount">
                            {{ WorkorderLine.SaleLine.calcSubtotal|money }}
                        </td>
                    </tr>
                {% endfor %}
            </table>
            
            <table class="totals">
                <tbody>
                    <tr>
                        <td class="label">Labor</td>
                        <td class="amount">
                            {{Workorder.MetaData.labor|money}}
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label">Parts</td>
                        <td class="amount">
                            {{Workorder.MetaData.parts|money}}
                        </td>
                    </tr>
                
                    {% if Workorder.MetaData.discount > 0 %}
                        <tr>
                            <td class="label">Discounts</td>
                            <td class="amount">
                                -{{Workorder.MetaData.discount|money}}
                            </td>
                        </tr>
                    {% endif %}
                
                    <tr>
                        <td class="label">Tax</td>
                        <td class="amount">
                            {{Workorder.MetaData.tax|money}}
                        </td>
                    </tr>
                
                    <tr class="total">
                        <td class="label">Total</td>
                        <td class="amount">
                            {{Workorder.MetaData.total|money}}
                        </td>
                    </tr>
                </tbody>
            </table>

            <hr class="footer__hr">

            {% if Workorder.note|strlen > 0 %}
                <div class="notes">
                    <h3>Notes</h3>
                    {{ Workorder.note|noteformat|raw }}
                </div>
            {% endif %}

            <p class="receiptShopContact">
                <span class="footer__note">
                    <span class="footer__note__label">
                        Retailer
                    </span>
                    <span class="footer__note__value">
                        {{Workorder.Shop.name}}
                    </span>
                </span>
                <span class="footer__note">
                    <span class="footer__note__label">
                        Address
                    </span>
                    <span class="footer__note__value">
                        {{ Workorder.Shop.Contact.Addresses.ContactAddress.address1 }},
                        {{ Workorder.Shop.Contact.Addresses.ContactAddress.city }},
                        {{ Workorder.Shop.Contact.Addresses.ContactAddress.state }} {{ Workorder.Shop.Contact.Addresses.ContactAddress.zip }}
                    </span>
                </span>
                <br />
                {% for ContactPhone in Workorder.Shop.Contact.Phones.ContactPhone %}
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
                    {% for Email in Workorder.Shop.Contact.Emails.ContactEmail %}
                        {{Email.address}}
                    {% endfor %}
                    </span>
                </span>
                <span class="footer__note">
                    <span class="footer__note__label">
                        Website
                    </span>
                    <span class="footer__note__value">
                        {{Workorder.Shop.Contact.Website}}
                        https://methodcasting.com
                    </span>
                </span>
                <br/>
                {% if isVATAndRegistrationNumberOnReceipt() %}
                    {% if Workorder.Shop.companyRegistrationNumber|strlen %}
                    <span class="footer__note">
                        <span class="footer__note__label">
                            CC
                        </span>
                        <span class="footer__note__value">
                            {{Workorder.Shop.companyRegistrationNumber}}
                        </span>
                    </span>
                    {% endif %}
                    {% if Workorder.Shop.vatNumber|strlen %}
                    <span class="footer__note">
                        <span class="footer__note__label">
                            VAT
                        </span>
                        <span class="footer__note__value">
                            {{Workorder.Shop.vatNumber}}
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
            
            <img height="50" width="250" class="barcode" src="/barcode.php?type=receipt&number={{Workorder.systemSku}}">
            
            {% if parameters.type == 'invoice' %}
                {% if Workorder.Shop.ReceiptSetup.workorderAgree|strlen > 0 %}
                    <div style="padding: 10px 0px">
                        <p style="margin-bottom:40px;">{{ Workorder.Shop.ReceiptSetup.workorderAgree|noteformat|raw }}</p>
                        X_______________________________
                        <br/>
                        {{ Workorder.Customer.firstName}} {{ Workorder.Customer.lastName}}
                    </div>
            </div>


            {% endif %}
        {% endif %}
    
    {% endfor %}

{% endblock content %}
