using { sap.fe.cap.travel as my } from '../db/sflight-schema';

service TravelService @(path:'/odata/v4/sflight/travel-service') {

  @(restrict: [
    { grant: 'READ', to: 'authenticated-user'},
    { grant: ['rejectTravel','acceptTravel','deductDiscount'], to: 'sflight-reviewer'},
    { grant: ['*'], to: 'sflight-processor'},
    { grant: ['*'], to: 'sflight-admin'}
  ])
  entity Travel as projection on my.Travel actions {
    action createTravelByTemplate() returns Travel;
    action rejectTravel();
    action acceptTravel();
    action deductDiscount( percent: Percentage not null ) returns Travel;
  };

}

type Percentage : Integer @assert.range: [1,100];
