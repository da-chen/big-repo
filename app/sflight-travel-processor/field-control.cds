using TravelService from '../../srv/sflight-travel-service';

//
// annotations that control the behavior of fields and actions
//

annotate TravelService.Travel with @(Common.SideEffects: {
  SourceProperties: [BookingFee],
  TargetProperties: ['TotalPrice']
}){
  BookingFee  @Common.FieldControl  : TravelStatus.fieldControl;
  BeginDate   @Common.FieldControl  : TravelStatus.fieldControl;
  EndDate     @Common.FieldControl  : TravelStatus.fieldControl;
  to_Agency   @Common.FieldControl  : TravelStatus.fieldControl;
  to_Customer @Common.FieldControl  : TravelStatus.fieldControl;

} actions {
  rejectTravel @(
    Core.OperationAvailable : { $edmJson: { $Ne: [{ $Path: 'in/TravelStatus_code'}, 'X']}},
    Common.SideEffects.TargetProperties : ['in/TravelStatus_code'],
  );
  acceptTravel @(
    Core.OperationAvailable : { $edmJson: { $Ne: [{ $Path: 'in/TravelStatus_code'}, 'A']}},
    Common.SideEffects.TargetProperties : ['in/TravelStatus_code'],
  );
  deductDiscount @(
    Core.OperationAvailable : { $edmJson: { $Eq: [{ $Path: 'in/TravelStatus_code'}, 'O']}}
  );
}

annotate TravelService.Travel @(
    Common.SideEffects#ReactonItemCreationOrDeletion : {
        SourceEntities : [
            to_Booking
        ],
       TargetProperties : [
           'TotalPrice'
       ]
    }
);

annotate TravelService.Booking with @UI.CreateHidden : to_Travel.TravelStatus.createDeleteHidden;
annotate TravelService.Booking with @UI.DeleteHidden : to_Travel.TravelStatus.createDeleteHidden;

annotate TravelService.Booking {
  BookingDate   @Core.Computed;
  ConnectionID  @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  FlightDate    @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  FlightPrice   @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  BookingStatus @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  to_Carrier    @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  to_Customer   @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
};

annotate TravelService.Booking with @(
  Capabilities.NavigationRestrictions : {
    RestrictedProperties : [
      {
        NavigationProperty : to_BookSupplement,
        InsertRestrictions : {
          Insertable : to_Travel.TravelStatus.insertDeleteRestriction
        },
        DeleteRestrictions : {
          Deletable : to_Travel.TravelStatus.insertDeleteRestriction
        }
      }
    ]
  }
);


annotate TravelService.BookingSupplement {
  Price         @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  to_Supplement @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  to_Booking    @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  to_Travel     @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;

};
