using { sap.capire.incidents as my } from '../db/incidents-schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
@(path:'/odata/v4/incidents/processor')
@(requires: 'incidents-support')
service ProcessorService {
  entity Incidents as projection on my.Incidents;
  entity Customers @readonly as projection on my.Customers;
}

/**
 * Service used by administrators to manage customers and incidents.
 */
@(path:'/odata/v4/incidents/admin')
@(requires: 'incidents-admin')
service AdminService {
  entity Customers as projection on my.Customers;
  entity Incidents as projection on my.Incidents;
}

annotate ProcessorService.Incidents with @odata.draft.enabled; 
// annotate ProcessorService with @(requires: 'incidents-support');
// annotate AdminService with @(requires: 'incidents-admin');
