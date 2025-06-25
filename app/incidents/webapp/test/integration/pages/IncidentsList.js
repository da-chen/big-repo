sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'sap.fe.cap.incidents',
            componentId: 'IncidentsList',
            entitySet: 'Incidents'
        },
        CustomPageDefinitions
    );
});