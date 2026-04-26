namespace invoice;

entity Customers
{
    key ID : UUID;
    name : String(100) not null;
    email : String(100) not null;
    phone : String(20);
    address : String(250);
    creditLimit : Decimal(15,2);
    customerGroup : String(50);
    createdAt : Timestamp;
    Invoices : Association to many Invoices on Invoices.customer = $self;
}

entity Invoices
{
    key ID : UUID;
    invoiceNumber : String(20) not null;
    customer_ID : UUID;
    issueDate : Date;
    dueDate : Date;
    currency : String(3) default 'USD';
    totalAmount : Decimal(15,2);
    paidAmount : Decimal(15,2) default 0;
    outstandingAmount : Decimal(15,2);
    status : String(20) default 'Open';
    notes : String(100);
    createdAt : Timestamp;
    customer : Association to one Customers on customer.ID = customer_ID;
    invoiceItems : Composition of many InvoiceItems on invoiceItems.invoice_ID = ID;
    payments : Composition of many Payments on payments.invoice_ID = ID;
    creditNotes : Composition of many CreditNotes on creditNotes.invoice_ID = ID;
    paymentTerm : Association to one PaymentTerms;
}

entity InvoiceItems
{
    key ID : UUID;
    invoice_ID : UUID;
    productCode : String(50);
    description : String(100);
    quantity : Integer;
    unitPrice : Decimal(15,2);
    discountPct : Decimal(5,2);
    taxRate : Decimal(5,2);
    lineTotal : Decimal(15,2);
}

entity Payments
{
    key ID : UUID;
    invoice_ID : UUID;
    paymentDate : Date;
    amountPaid : Decimal(15,2);
    paymentMethod : String(30);
    bankReference : String(100);
    receivedBy : String(100);
    status : String(20) default 'Confirmed';
    createdAt : Timestamp;    
}

entity PaymentTerms
{
    key ID : UUID;
    code : String(100);
    description : String(100);
    netDays : Integer;
    discountDays : Integer;
    discountPct : Decimal(5,2);    
}

entity CreditNotes
{
    key ID : UUID;
    invoice_ID : UUID;
    creditNoteNumber : String(20);
    issueDate : Date;
    amount : Decimal(15,2);
    reason : String(100);
    status : String(20) default 'Applied';    
}
