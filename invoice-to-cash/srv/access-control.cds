using {AdminService} from './admin-service';
using {CatalogService} from './cat-service';

annotate AdminService with @requires: 'admin';

annotate CatalogService with @requires: [
    'admin',
    'viewer',
    'Sales_Enterprise',
    'Sales_SMB',
    'Sales_Wholesale'
];