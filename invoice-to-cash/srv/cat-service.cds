using { invoice as db } from '../db/schema';

service CatalogService {
  @readonly entity Customers    as projection on db.Customers;
  entity Invoices               as projection on db.Invoices;
  entity InvoiceItems           as projection on db.InvoiceItems;
  entity Payments               as projection on db.Payments;
  entity PaymentTerms           as projection on db.PaymentTerms;
  entity CreditNotes            as projection on db.CreditNotes;
}