using shophana as shop from '../db/schema';
using sap.common as common from '@sap/cds/common';
using shophana.teched.shop as STS from '../db/schema';

service CatalogService { 
    @Capabilities : { Deletable:true, Insertable:true}
    entity Products as projection on STS.Products 
    //{   * , market : redirected to Markets  }
    actions {
    //@sap.applicable.path: 'startEnabled'
    function start() returns Products;
    @sap.applicable.path: 'closeEnabled'
    function close() returns Products;
    };
    @Capabilities : { Deletable:true, Insertable:true}
    entity Markets as projection on shop.teched.shop.Markets; 
    //{ * , order : redirected to STS.Orders };
    @Capabilities : { Deletable:true, Insertable:true}
    entity Orders as projection on STS.Orders;
    entity ProductGroups as projection on STS.ProductGroups;
    entity UOM as projection on STS.UOM;
    entity MarketMDs as projection on STS.MarketInfos;
}