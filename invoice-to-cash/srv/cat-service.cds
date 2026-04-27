using { invoice as db } from '../db/schema';

service CatalogService {

  @odata.draft.enabled
  @restrict: [
    { grant: '*',    to: 'admin'                                          },
    { grant: 'READ', to: 'viewer'                                         },
    { grant: 'READ', to: 'Sales_Enterprise', where: 'customerGroup = ''Enterprise''' },
    { grant: 'READ', to: 'Sales_SMB',        where: 'customerGroup = ''SMB'''        },
    { grant: 'READ', to: 'Sales_Wholesale',  where: 'customerGroup = ''Wholesale'''  }
  ]
  entity Customers as projection on db.Customers;

  @odata.draft.enabled
  @restrict: [
    { grant: '*',    to: 'admin'           },
    { grant: 'READ', to: 'viewer'          },
    { grant: 'READ', to: 'Sales_Enterprise' },
    { grant: 'READ', to: 'Sales_SMB'        },
    { grant: 'READ', to: 'Sales_Wholesale'  }
  ]
  entity Invoices as projection on db.Invoices;

  @restrict: [
    { grant: '*',    to: 'admin'           },
    { grant: 'READ', to: 'viewer'          },
    { grant: 'READ', to: 'Sales_Enterprise' },
    { grant: 'READ', to: 'Sales_SMB'        },
    { grant: 'READ', to: 'Sales_Wholesale'  }
  ]
  entity InvoiceItems as projection on db.InvoiceItems;

  @restrict: [
    { grant: '*',    to: 'admin'           },
    { grant: 'READ', to: 'viewer'          },
    { grant: 'READ', to: 'Sales_Enterprise' },
    { grant: 'READ', to: 'Sales_SMB'        },
    { grant: 'READ', to: 'Sales_Wholesale'  }
  ]
  entity Payments as projection on db.Payments;

  @odata.draft.enabled
  @restrict: [
    { grant: '*',    to: 'admin'  },
    { grant: 'READ', to: 'viewer' }
  ]
  entity PaymentTerms as projection on db.PaymentTerms;

  @restrict: [
    { grant: '*',    to: 'admin'           },
    { grant: 'READ', to: 'viewer'          },
    { grant: 'READ', to: 'Sales_Enterprise' },
    { grant: 'READ', to: 'Sales_SMB'        },
    { grant: 'READ', to: 'Sales_Wholesale'  }
  ]
  entity CreditNotes as projection on db.CreditNotes;
}