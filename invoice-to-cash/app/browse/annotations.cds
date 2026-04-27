using CatalogService from '../../srv/cat-service';

// ── Invoices List Report ──────────────────────────────────
annotate CatalogService.Invoices with @(
 
  UI.CreateHidden : false,
  UI.DeleteHidden : false,
  UI.UpdateHidden : false,

  UI.SelectionFields : [ invoiceNumber, status, issueDate ],

  UI.LineItem : [
    { $Type : 'UI.DataField', Value : invoiceNumber,     Label : 'Invoice Number' },
    { $Type : 'UI.DataField', Value : customer_ID,       Label : 'Customer'       },
    { $Type : 'UI.DataField', Value : issueDate,         Label : 'Issue Date'     },
    { $Type : 'UI.DataField', Value : dueDate,           Label : 'Due Date'       },
    { $Type : 'UI.DataField', Value : totalAmount,       Label : 'Total Amount'   },
    { $Type : 'UI.DataField', Value : paidAmount,        Label : 'Paid Amount'    },
    { $Type : 'UI.DataField', Value : outstandingAmount, Label : 'Outstanding'    },
    { $Type : 'UI.DataField', Value : status,            Label : 'Status'         },
    {
      $Type : 'UI.DataField',
      Value : IsActiveEntity,
      Label : 'Status'
    }
  ],

  UI.HeaderInfo : {
    TypeName       : 'Invoice',
    TypeNamePlural : 'Invoices',
    Title          : { $Type : 'UI.DataField', Value : invoiceNumber },
    Description    : { $Type : 'UI.DataField', Value : status        }
  },

  UI.FieldGroup #InvoiceDetails : {
    $Type : 'UI.FieldGroupType',
    Label : 'Invoice Details',
    Data  : [
      { $Type : 'UI.DataField', Value : invoiceNumber     },
      { $Type : 'UI.DataField', Value : customer_ID, Label  : 'Customer'       },
      { $Type : 'UI.DataField', Value : issueDate         },
      { $Type : 'UI.DataField', Value : dueDate           },
      { $Type : 'UI.DataField', Value : currency          },
      { $Type : 'UI.DataField', Value : totalAmount       },
      { $Type : 'UI.DataField', Value : paidAmount        },
      { $Type : 'UI.DataField', Value : outstandingAmount },
      { $Type : 'UI.DataField', Value : status            },
      { $Type : 'UI.DataField', Value : notes             }
    ]
  },

  UI.LineItem #InvoiceItems : [
    { $Type : 'UI.DataField', Value : productCode, Label : 'Product Code' },
    { $Type : 'UI.DataField', Value : description, Label : 'Description'  },
    { $Type : 'UI.DataField', Value : quantity,    Label : 'Quantity'     },
    { $Type : 'UI.DataField', Value : unitPrice,   Label : 'Unit Price'   },
    { $Type : 'UI.DataField', Value : discountPct, Label : 'Discount %'   },
    { $Type : 'UI.DataField', Value : taxRate,     Label : 'Tax Rate %'   },
    { $Type : 'UI.DataField', Value : lineTotal,   Label : 'Line Total'   }
  ],

  UI.LineItem #Payments : [
    { $Type : 'UI.DataField', Value : paymentDate,   Label : 'Payment Date'   },
    { $Type : 'UI.DataField', Value : amountPaid,    Label : 'Amount Paid'    },
    { $Type : 'UI.DataField', Value : paymentMethod, Label : 'Payment Method' },
    { $Type : 'UI.DataField', Value : bankReference, Label : 'Bank Reference' },
    { $Type : 'UI.DataField', Value : receivedBy,    Label : 'Received By'    },
    { $Type : 'UI.DataField', Value : status,        Label : 'Status'         }
  ],

  UI.LineItem #CreditNotes : [
    { $Type : 'UI.DataField', Value : creditNoteNumber, Label : 'Credit Note #' },
    { $Type : 'UI.DataField', Value : issueDate,        Label : 'Issue Date'    },
    { $Type : 'UI.DataField', Value : amount,           Label : 'Amount'        },
    { $Type : 'UI.DataField', Value : reason,           Label : 'Reason'        },
    { $Type : 'UI.DataField', Value : status,           Label : 'Status'        }
  ],

  UI.Facets : [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Invoice Details',
      Target : '@UI.FieldGroup#InvoiceDetails'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'InvoiceItemsFacet',
      Label  : 'Invoice Items',
      Target : 'invoiceItems/@UI.LineItem#InvoiceItems'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'PaymentsFacet',
      Label  : 'Payments',
      Target : 'payments/@UI.LineItem#Payments'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'CreditNotesFacet',
      Label  : 'Credit Notes',
      Target : 'creditNotes/@UI.LineItem#CreditNotes'
    }
  ]
);

// ── InvoiceItems ──────────────────────────────────────────
annotate CatalogService.InvoiceItems with @(
  UI.SelectionFields  : [ productCode, description ],
  UI.LineItem #InvoiceItems : [
    { $Type : 'UI.DataField', Value : productCode, Label : 'Product Code' },
    { $Type : 'UI.DataField', Value : description, Label : 'Description'  },
    { $Type : 'UI.DataField', Value : quantity,    Label : 'Quantity'     },
    { $Type : 'UI.DataField', Value : unitPrice,   Label : 'Unit Price'   },
    { $Type : 'UI.DataField', Value : discountPct, Label : 'Discount %'   },
    { $Type : 'UI.DataField', Value : taxRate,     Label : 'Tax Rate %'   },
    { $Type : 'UI.DataField', Value : lineTotal,   Label : 'Line Total'   }
  ],

  UI.HeaderInfo: { TypeName : 'Invoice Item', 
  TypeNamePlural: 'Invoice Items',
  Title: { $Type : 'UI.DataField', value: 'Product Code'},
  Description : { $Type : 'ui.DataField', Value : description }  
  },

  UI.FieldGroup #ItemDetails : {
    $Type : 'UI.FieldGroupType',
    Label : 'Item Details',
    Data  : [
      { $Type : 'UI.DataField', Value : productCode },
      { $Type : 'UI.DataField', Value : description },
      { $Type : 'UI.DataField', Value : quantity    },
      { $Type : 'UI.DataField', Value : unitPrice   },
      { $Type : 'UI.DataField', Value : discountPct },
      { $Type : 'UI.DataField', Value : taxRate     },
      { $Type : 'UI.DataField', Value : lineTotal   }
    ]
  },

  UI.Facets : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Item Details',
    Target : '@UI.FieldGroup#ItemDetails'
  }]
);

// ── Payments ──────────────────────────────────────────────
annotate CatalogService.Payments with @(
  UI.SelectionFields : [ paymentMethod, status ],

  UI.LineItem #Payments : [
    { $Type : 'UI.DataField', Value : paymentDate,   Label : 'Payment Date'   },
    { $Type : 'UI.DataField', Value : amountPaid,    Label : 'Amount Paid'    },
    { $Type : 'UI.DataField', Value : paymentMethod, Label : 'Payment Method' },
    { $Type : 'UI.DataField', Value : bankReference, Label : 'Bank Reference' },
    { $Type : 'UI.DataField', Value : receivedBy,    Label : 'Received By'    },
    { $Type : 'UI.DataField', Value : status,        Label : 'Status'         }
  ],

  UI.HeaderInfo : {
    TypeName       : 'Payment',
    TypeNamePlural : 'Payments',
    Title          : { $Type : 'UI.DataField', Value : paymentMethod },
    Description    : { $Type : 'UI.DataField', Value : status        }
  },

  UI.FieldGroup #PaymentDetails : {
    $Type : 'UI.FieldGroupType',
    Label : 'Payment Details',
    Data  : [
      { $Type : 'UI.DataField', Value : paymentDate   },
      { $Type : 'UI.DataField', Value : amountPaid    },
      { $Type : 'UI.DataField', Value : paymentMethod },
      { $Type : 'UI.DataField', Value : bankReference },
      { $Type : 'UI.DataField', Value : receivedBy    },
      { $Type : 'UI.DataField', Value : status        }
    ]
  },

  UI.Facets : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Payment Details',
    Target : '@UI.FieldGroup#PaymentDetails'
  }]
);

// ── CreditNotes ───────────────────────────────────────────
annotate CatalogService.CreditNotes with @(
  UI.SelectionFields : [ creditNoteNumber, status ],
  UI.LineItem #CreditNotes : [
    { $Type : 'UI.DataField', Value : creditNoteNumber, Label : 'Credit Note #' },
    { $Type : 'UI.DataField', Value : issueDate,        Label : 'Issue Date'    },
    { $Type : 'UI.DataField', Value : amount,           Label : 'Amount'        },
    { $Type : 'UI.DataField', Value : reason,           Label : 'Reason'        },
    { $Type : 'UI.DataField', Value : status,           Label : 'Status'        }
  ],

  UI.HeaderInfo : {
    TypeName       : 'Credit Note',
    TypeNamePlural : 'Credit Notes',
    Title          : { $Type : 'UI.DataField', Value : creditNoteNumber },
    Description    : { $Type : 'UI.DataField', Value : status           }
  },

  UI.FieldGroup #CreditNoteDetails : {
    $Type : 'UI.FieldGroupType',
    Label : 'Credit Note Details',
    Data  : [
      { $Type : 'UI.DataField', Value : creditNoteNumber },
      { $Type : 'UI.DataField', Value : issueDate        },
      { $Type : 'UI.DataField', Value : amount           },
      { $Type : 'UI.DataField', Value : reason           },
      { $Type : 'UI.DataField', Value : status           }
    ]
  },

  UI.Facets : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Credit Note Details',
    Target : '@UI.FieldGroup#CreditNoteDetails'
  }]
);

// ── PaymentTerms ──────────────────────────────────────────
annotate CatalogService.PaymentTerms with @(
  UI.SelectionFields : [ code, description ],
  UI.LineItem : [
    { $Type : 'UI.DataField', Value : code,         Label : 'Code'          },
    { $Type : 'UI.DataField', Value : description,  Label : 'Description'   },
    { $Type : 'UI.DataField', Value : netDays,      Label : 'Net Days'      },
    { $Type : 'UI.DataField', Value : discountDays, Label : 'Discount Days' },
    { $Type : 'UI.DataField', Value : discountPct,  Label : 'Discount %'    }
  ],
  UI.HeaderInfo : {
    TypeName       : 'Payment Term',
    TypeNamePlural : 'Payment Terms',
    Title          : { $Type : 'UI.DataField', Value : code        },
    Description    : { $Type : 'UI.DataField', Value : description }
  },
  UI.FieldGroup #TermDetails : {
    $Type : 'UI.FieldGroupType',
    Label : 'Term Details',
    Data  : [
      { $Type : 'UI.DataField', Value : code         },
      { $Type : 'UI.DataField', Value : description  },
      { $Type : 'UI.DataField', Value : netDays      },
      { $Type : 'UI.DataField', Value : discountDays },
      { $Type : 'UI.DataField', Value : discountPct  }
    ]
  },
  UI.Facets : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Term Details',
    Target : '@UI.FieldGroup#TermDetails'
  }]
);