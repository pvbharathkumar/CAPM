using CatalogService from '../../srv/cat-service';

annotate CatalogService.Customers with @(

  UI.SelectionFields : [ customerGroup, name, email 
],

  UI.LineItem : [
    { $Type : 'UI.DataField', Value : name,          Label : '{i18n>CustomerName}'           },
    { $Type : 'UI.DataField', Value : customerGroup, Label : 'Customer Group' },
    { $Type : 'UI.DataField', Value : creditLimit,   Label : 'Credit Limit'   },
    { $Type : 'UI.DataField', Value : phone,         Label : 'Phone'          },
    { $Type : 'UI.DataField', Value : email,         Label : 'Email'          },
  ],

  UI.HeaderInfo : {
    TypeName       : 'Customer',
    TypeNamePlural : 'Customers',
    Title          : { $Type : 'UI.DataField', Value : name  },
    Description    : { $Type : 'UI.DataField', Value : email }
  },

  UI.FieldGroup #CustomerDetails : {
    $Type : 'UI.FieldGroupType',
    Label : 'Customer Details',
    Data  : [
      { $Type : 'UI.DataField', Value : name          },
      { $Type : 'UI.DataField', Value : customerGroup },
      { $Type : 'UI.DataField', Value : email         },
      { $Type : 'UI.DataField', Value : phone         },
      { $Type : 'UI.DataField', Value : address       },
      { $Type : 'UI.DataField', Value : creditLimit   },
      { $Type : 'UI.DataField', Value : createdAt     }
    ]
  },

  UI.Facets : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Customer Details',
    Target : '@UI.FieldGroup#CustomerDetails'
  }]
);
annotate CatalogService.Customers with {
    customerGroup @Common.Label : '{i18n>CustomerGroup}'
};

annotate CatalogService.Customers with {
    name @Common.Label : '{i18n>CustomerName}'
};

annotate CatalogService.Customers with {
    email @Common.Label : '{i18n>Email}'
};

