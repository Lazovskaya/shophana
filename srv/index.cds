using from './cat-service';
annotate CatalogService.Products with @odata.draft.enabled;

annotate CatalogService.Orders with @ (
 UI: {
 Identification: [{Value: deliveryDate}],
 SelectionFields: [deliveryDate],
 LineItem: [
     { $Type : 'UI.DataField', Value: deliveryDate, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: quantity,![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: calendarYear, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: netAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: grossAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: taxAmount, ![@UI.Importance]: #High },
 ],
 HeaderInfo : { TypeName: 'Order', TypeNamePlural: 'Orders', Title: {Value : deliveryDate},},
 HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }
        ],
        FieldGroup #Description: {Data : [
        { $Type : 'UI.DataField', Value : deliveryDate },
        { $Type : 'UI.DataField', Value : quantity },
        { $Type : 'UI.DataField', Value : calendarYear }        
        ]},
        FieldGroup #Details : {Data : [
        {   $Type : 'UI.DataField', Value : netAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : grossAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : taxAmount, ![@UI.Importance] : #Medium },
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {  $Type : 'UI.DataField', Value : createdBy },
        {  $Type : 'UI.DataField', Value : createdAt },
        {  $Type : 'UI.DataField', Value : modifiedBy },
        {  $Type : 'UI.DataField', Value : modifiedAt }]}},
UI.Facets : [
    {   $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails3',
        Label  : '{i18n>Order Info}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Order Info}',
            Target : '@UI.FieldGroup#Description'
        }]
    },
      { $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo3',
        Label  : '{i18n>Admin Info}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Admin Info}',
            Target : '@UI.FieldGroup#AdministrativeData'
        }]
    }
    ]
);

annotate CatalogService.Markets with @ (
 UI: {
 Identification: [{Value: toMarketInfos.name }],
 SelectionFields: [toMarketInfos.name],
 LineItem: [
     { $Type : 'UI.DataField', Value : toMarketInfos.imageURL, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: toMarketInfos_ID, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: startDate, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: endDate, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: totalNetAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: totalGrossAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: totalTaxAmount, ![@UI.Importance]: #High }  
 ],
 HeaderInfo : { TypeName: 'Market', TypeNamePlural : 'Markets', Title : {Value : toMarketInfos.name} },
 HeaderFacets : [{ $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Description', ![@UI.Importance] : #Medium }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value : toMarketInfos_ID },
        {   $Type : 'UI.DataField', Value : toMarketInfos.imageURL },
        ]},
        FieldGroup #Details : {Data : [
        {   $Type : 'UI.DataField', Value : startDate },
        {   $Type : 'UI.DataField', Value : endDate, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : totalNetAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : totalGrossAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : totalTaxAmount, ![@UI.Importance] : #Medium }
        ]}
    },
     UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails2',
        Label  : '{i18n>Market Info}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Market Info}',
            Target : '@UI.FieldGroup#Description'
        }
        ]
    },
      {
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo2',
        Label  : '{i18n>Market Details}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Market Details}',
            Target : '@UI.FieldGroup#Details'
        }        ]
    },
     {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Orders Info}',
        Target : 'order/@UI.LineItem'
    }
    ]
);

annotate CatalogService.Products with @(
    UI: {
 SelectionFields: [productgroup_ID],
 Identification  : [  
     { $Type: 'UI.DataFieldForAction', Action: 'CatalogService.start', Label: 'Start'},
     { $Type: 'UI.DataFieldForAction', Action: 'CatalogService.close', Label: 'Close' },
     //{Value: productgroup.name}
     ],
 LineItem: [
     { $Type: 'UI.DataFieldForAction', Action: 'CatalogService.start', Label: 'Start'},
     { $Type: 'UI.DataFieldForAction', Action: 'CatalogService.close', Label: 'Close' },
     { $Type : 'UI.DataField', Value : productgroup.imageURL, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: productgroup_ID, ![@UI.Importance]: #High },   
     { $Type : 'UI.DataField', Value: model, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: status_ID, Criticality: status.criticality, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: price, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: taxrate, ![@UI.Importance]: #High },
     //{ $Type : 'UI.DataField', Value: height, ![@UI.Importance]: #High },
     //{ $Type : 'UI.DataField', Value: width, ![@UI.Importance]: #High },
     //{ $Type : 'UI.DataField', Value: depth, ![@UI.Importance]: #High } 
 ],
 PresentationVariant : {SortOrder : [
      
        {   $Type      : 'Common.SortOrderType', Property   : productgroup.name, Descending : false },
        {   $Type      : 'Common.SortOrderType', Property   : model, Descending : false }
        ]},
    },
  UI        : {
        HeaderInfo : {
            TypeName       : 'Product',
            TypeNamePlural : 'Products',
            //Title          : {Value : productgroup_ID},
        },
        HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value : productgroup_ID },    
        {   $Type : 'UI.DataField', Value : productgroup.imageURL },
        {   $Type : 'UI.DataField', Value : model },
         ]},
         FieldGroup #Details : {Data : [
        //{   $Type : 'UI.DataField', Value : productgroup_ID, ![@UI.Importance] : #Medium },
        //{   $Type : 'UI.DataField', Value : model, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : price},
        {   $Type : 'UI.DataField', Value : currency.code, ![@UI.Importance]: #High },
        {   $Type : 'UI.DataField', Value : taxrate }
        ]},
        FieldGroup #Details2 : {Data : [
        {   $Type : 'UI.DataField', Value : status_ID, Criticality: status.criticality },
        ]},
        FieldGroup #Details3 : {Data : [
        {   $Type : 'UI.DataField', Value : depth },
        {   $Type : 'UI.DataField', Value : width },
        {   $Type : 'UI.DataField', Value : height },
        {   $Type : 'UI.DataField', Value : sizeuom_msehi }
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {  $Type : 'UI.DataField',  Value : createdBy },
        {  $Type : 'UI.DataField',  Value : createdAt },
        {  $Type : 'UI.DataField',  Value : modifiedBy },
        {  $Type : 'UI.DataField',  Value : modifiedAt }
        ]}
    },
     UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails',
        Label  : '{i18n>Product Info}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Price Info}',
            Target : '@UI.FieldGroup#Details'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Production Info}',
            Target : '@UI.FieldGroup#Details2'
        },
         {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Dimentions Info}',
            Target : '@UI.FieldGroup#Details3'
        },
        ]
    },
      {
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo',
        Label  : '{i18n>Admin Info}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Admin Info}',
            Target : '@UI.FieldGroup#AdministrativeData'
        }
        ]
    },
     {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Markets Info}',
        Target : 'market/@UI.LineItem'
    }
    ]
 
);
 
annotate CatalogService.Products with {
    ID @title: 'ID';
    title @title: 'Title';
    model @title: 'Model';
    price @title: 'Price' @Measures.ISOCurrency: currency_code;
    taxrate @title: 'Tax Rate';
    status @title: 'Status';
    height @title: 'Height' @Measures.Unit : sizeuom_msehi;
    width @title: 'Width' @Measures.Unit : sizeuom_msehi;
    depth @title: 'Depth' @Measures.Unit : sizeuom_msehi;
    currency_code @title: 'Currency';
    productgroup @title: 'Product';
};

annotate CatalogService.Markets with {
    startDate @title: 'Starting Date';
    endDate @title: 'Ending Date';
    totalNetAmount @title: 'Total Net Amount' @Measures.ISOCurrency: currency_code;
    totalGrossAmount @title: 'Total Gross Amount' @Measures.ISOCurrency: currency_code;
    totalTaxAmount @title: 'Total Tax Amount' @Measures.ISOCurrency: currency_code;
    currency_code @title: 'Currency';
    toMarketInfos @title: 'Market name'
};

annotate CatalogService.Orders with {
    deliveryDate @title: 'Delivery Date';
    calendarYear @title: 'Year';
    quantity @title : 'Quantity';
    netAmount @title: 'Order Net Amount' @Measures.ISOCurrency: currency_code;
    grossAmount @title: 'Order Gross Amount' @Measures.ISOCurrency: currency_code;
    taxAmount @title: 'Order Tax Amount' @Measures.ISOCurrency: currency_code;
    currency_code @title: 'Currency';
};