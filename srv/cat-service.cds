using shophana as shop from '../db/schema';
using sap.common as common from '@sap/cds/common';
using shophana.teched.shop as STS from '../db/schema';

service CatalogService { 
    @odata.draft.enabled
    @Capabilities : { Deletable:true, Insertable:true}
    entity Products as projection on STS.Products 
    actions {
    //@cds.odata.bindingparameter.collection 
    @sap.applicable.path: 'startEnabled'
    function start() returns Products;
    @sap.applicable.path: 'closeEnabled'
    function close() returns Products;
    };
    @Capabilities : { Deletable:true, Insertable:true}
    entity Markets as projection on shop.teched.shop.Markets; 
    //{ * , order : redirected to STS.Orders };
    @Capabilities : { Deletable:true, Insertable:true}
    entity Orders as projection on shop.teched.shop.Orders;
    @cds.autoexpose entity ProductGroups as projection on STS.ProductGroups;
    @cds.autoexpose entity UOM as projection on STS.UOM;
    @cds.autoexpose entity MarketMDs as projection on STS.MarketInfos;
    @cds.autoexpose entity Statuses as projection on STS.Statuses;
    entity Currencies as projection on common.Currencies;

    
}