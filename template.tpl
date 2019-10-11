___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Container Injector",
  "categories": ["TAG_MANAGEMENT","UTILITY"],
  "description": "Allows containers to be loaded based on pre-defined conditions.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "GTM-[A-Z0-9]{5,8}"
        ],
        "type": "REGEX"
      }
    ],
    "displayName": "Container ID",
    "simpleValueType": true,
    "name": "containerId",
    "type": "TEXT",
    "valueHint": "GTM-ABCDEF"
  },
  {
    "displayName": "Advanced Settings",
    "name": "advancedSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "If you have renamed the dataLayer for your root container and want to use the same dataLayer for this container, you need to set that in this field as well. You can use an alternative dataLayer but this is NOT recommended.",
        "valueValidators": [],
        "displayName": "dataLayer Name",
        "defaultValue": "",
        "simpleValueType": true,
        "name": "dataLayerName",
        "type": "TEXT"
      }
    ]
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://*.googletagmanager.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//Written by James Cottrill
//Require APIs
const log = require('logToConsole');
const injectScript = require('injectScript');
//Access Tag Text Fields
const containerId = data.containerId;
const dataLayerName = data.dataLayerName ? data.dataLayerName : 'dataLayer' ;

const onSuccess = () => {
  log('Zone Loaded');
  data.gtmOnSuccess();
};

const onFailure = () => {
  log('Zone Failed ');
  data.gtmOnFailure();
};
const url = 'https://www.googletagmanager.com/gtm.js?id='+containerId+'&l='+dataLayerName;
injectScript(url,onSuccess,onFailure);


___NOTES___

Created on 25/07/2019, 10:59:05
