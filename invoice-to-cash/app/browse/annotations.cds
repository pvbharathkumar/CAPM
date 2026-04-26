using CatalogService from '../../srv/cat-service';

// ── Invoices List Report ──────────────────────────────────
annotate CatalogService.Invoices with @(

  UI.SelectionFields : [ invoiceNumber, status, issueDate ],

  UI.LineItem : [
    { $Type : 'UI.DataField', Value : invoiceNumber,     Label : 'Invoice Number' },
    { $Type : 'UI.DataField', Value : customer_ID,       Label : 'Customer'       },
    { $Type : 'UI.DataField', Value : issueDate,         Label : 'Issue Date'     },
    { $Type : 'UI.DataField', Value : dueDate,           Label : 'Due Date'       },
    { $Type : 'UI.DataField', Value : totalAmount,       Label : 'Total Amount'   },
    { $Type : 'UI.DataField', Value : paidAmount,        Label : 'Paid Amount'    },
    { $Type : 'UI.DataField', Value : outstandingAmount, Label : 'Outstanding'    },
    { $Type : 'UI.DataField', Value : status,            Label : 'Status'         }
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
      { $Type : 'UI.DataField', Value : customer_ID       },
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
  UI.LineItem #InvoiceItems : [
    { $Type : 'UI.DataField', Value : productCode, Label : 'Product Code' },
    { $Type : 'UI.DataField', Value : description, Label : 'Description'  },
    { $Type : 'UI.DataField', Value : quantity,    Label : 'Quantity'     },
    { $Type : 'UI.DataField', Value : unitPrice,   Label : 'Unit Price'   },
    { $Type : 'UI.DataField', Value : discountPct, Label : 'Discount %'   },
    { $Type : 'UI.DataField', Value : taxRate,     Label : 'Tax Rate %'   },
    { $Type : 'UI.DataField', Value : lineTotal,   Label : 'Line Total'   }
  ]
);

// ── Payments ──────────────────────────────────────────────
annotate CatalogService.Payments with @(
  UI.LineItem #Payments : [
    { $Type : 'UI.DataField', Value : paymentDate,   Label : 'Payment Date'   },
    { $Type : 'UI.DataField', Value : amountPaid,    Label : 'Amount Paid'    },
    { $Type : 'UI.DataField', Value : paymentMethod, Label : 'Payment Method' },
    { $Type : 'UI.DataField', Value : bankReference, Label : 'Bank Reference' },
    { $Type : 'UI.DataField', Value : receivedBy,    Label : 'Received By'    },
    { $Type : 'UI.DataField', Value : status,        Label : 'Status'         }
  ]
);

// ── CreditNotes ───────────────────────────────────────────
annotate CatalogService.CreditNotes with @(
  UI.LineItem #CreditNotes : [
    { $Type : 'UI.DataField', Value : creditNoteNumber, Label : 'Credit Note #' },
    { $Type : 'UI.DataField', Value : issueDate,        Label : 'Issue Date'    },
    { $Type : 'UI.DataField', Value : amount,           Label : 'Amount'        },
    { $Type : 'UI.DataField', Value : reason,           Label : 'Reason'        },
    { $Type : 'UI.DataField', Value : status,           Label : 'Status'        }
  ]
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