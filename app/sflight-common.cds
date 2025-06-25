using { Currency } from '../db/sflight-common';


// Workarounds for overly strict OData libs and clients
annotate cds.UUID with @Core.Computed  @odata.Type : 'Edm.String';

annotate Currency with @Common.UnitSpecificScale : 'Decimals';
