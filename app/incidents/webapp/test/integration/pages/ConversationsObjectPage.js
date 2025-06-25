sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sap.fe.cap.incidents',
            componentId: 'ConversationsObjectPage',
            entitySet: 'Conversations'
        },
        CustomPageDefinitions
    );
});