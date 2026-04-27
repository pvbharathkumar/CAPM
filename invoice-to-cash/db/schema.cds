using { cuid, managed } from '@sap/cds/common';
namespace invoice;
entity Customers : cuid, managed
{    
    name : String(100) not null;
    email : String(100) not null;
    phone : String(20);
    address : String(250);
    creditLimit : Decimal(15,2);
    customerGroup : String(50);    
    Invoices : Association to many Invoices on Invoices.customer = $self;
}

entity Invoices : cuid, managed
{    
    invoiceNumber : String(20) not null;
    customer          : Association to Customers;
    issueDate : Date;
    dueDate : Date;
    currency : String(3) default 'USD';
    totalAmount : Decimal(15,2);
    paidAmount : Decimal(15,2) default 0;
    outstandingAmount : Decimal(15,2);
    status : String(20) default 'Open';
    notes : String(100);    
    paymentTerm : Association to one PaymentTerms;
    invoiceItems : Composition of many InvoiceItems on invoiceItems.invoice = $self;
    payments : Composition of many Payments on payments.invoice = $self;
    creditNotes : Composition of many CreditNotes on creditNotes.invoice = $self;

}

entity InvoiceItems : cuid, managed
{
    invoice : Association to Invoices; //UUID;
    productCode : String(50);
    description : String(100);
    quantity : Integer;
    unitPrice : Decimal(15,2);
    discountPct : Decimal(5,2);
    taxRate : Decimal(5,2);
    lineTotal : Decimal(15,2);
}

entity Payments  : cuid, managed
{
    invoice       : Association to Invoices;  // ← replace invoice_ID : UUID
    paymentDate : Date;
    amountPaid : Decimal(15,2);
    paymentMethod : String(30);
    bankReference : String(100);
    receivedBy : String(100);
    status : String(20) default 'Confirmed';
}

entity PaymentTerms : cuid, managed
{
    code : String(100);
    description : String(100);
    netDays : Integer;
    discountDays : Integer;
    discountPct : Decimal(5,2);    
}

entity CreditNotes : cuid, managed
{
    invoice          : Association to Invoices;  // ← replace invoice_ID : UUID
    creditNoteNumber : String(20);
    issueDate : Date;
    amount : Decimal(15,2);
    reason : String(100);
    status : String(20) default 'Applied';    
}
