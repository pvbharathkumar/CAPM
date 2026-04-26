sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"customers/test/integration/pages/CustomersList",
	"customers/test/integration/pages/CustomersObjectPage",
	"customers/test/integration/pages/InvoicesObjectPage"
], function (JourneyRunner, CustomersList, CustomersObjectPage, InvoicesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('customers') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomersList: CustomersList,
			onTheCustomersObjectPage: CustomersObjectPage,
			onTheInvoicesObjectPage: InvoicesObjectPage
        },
        async: true
    });

    return runner;
});

