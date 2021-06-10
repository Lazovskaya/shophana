namespace shophana;
using { cuid, managed, Currency, sap } from '@sap/cds/common';

context teched.shop {
entity Products: managed, cuid, teched.common.PriceCurrency {
  model         : String(15);
  title         : String(200);
  status        : Association to one Statuses;
  price         : teched.common.CurrencyType;
  taxrate       : teched.common.CurrencyType;
  //currencyCode  : teched.common.CurrencyType;
  currency      : Currency;
  height        : Decimal(13, 3);
  depth         : Decimal(13, 3);
  width         : Decimal(13, 3);
  sizeuom       : Association to one UOM;
  productgroup  : Association to one ProductGroups;
  @cascade : {all}
  market   : Composition of many Markets on market.toProduct = $self;
  virtual startEnabled: Boolean;
  virtual closeEnabled: Boolean;   
}

entity Markets: managed, cuid {
      toMarketInfos    : Association to MarketInfos;
      toProduct        : Association to Products;
      startDate        : Date;
      endDate          : Date;
      totalNetAmount   : teched.common.CurrencyType;
      totalGrossAmount : teched.common.CurrencyType;
      totalTaxAmount   : teched.common.CurrencyType;
      currency         : Currency;
      @cascade : {all}
      order   : Composition of many Orders on order.toMarket = $self;
}

entity Orders: managed, cuid {
    toMarket: Association to Markets;
    quantity         : Integer;
    calendarYear     : String;
    deliveryDate     : Date;
    netAmount        : teched.common.CurrencyType;
    grossAmount      : teched.common.CurrencyType;
    taxAmount        : teched.common.CurrencyType;
    currency         : Currency;
}

@cds.odata.valuelist
@cds.autoexpose entity UOM : sap.common.CodeList {
    key msehi      : String(3);
        dimid      : String(6);
        isocode    : String(3);
}

@cds.odata.valuelist
@cds.autoexpose entity ProductGroups : sap.common.CodeList {
    key ID     : Integer;
    name       : String(20);
    imageURL   : String @UI.IsImageURL;
    imageType  : String @Core.IsMediaType; 
}

@cds.odata.valuelist
@cds.autoexpose entity Statuses : sap.common.CodeList {
    key ID     : Integer;
    name       : String(20);
    criticality: Integer;
}

@cds.odata.valuelist
@cds.autoexpose entity MarketInfos : sap.common.CodeList {
    key ID     : Integer;
    name       : String(50);
    code       : String(2);
    imageURL   : String @UI.IsImageURL;
    imageType  : String @Core.IsMediaType; 
}

}

extend sap.common.Currencies with {
    numcode  : Integer;
    exponent : Integer; //> e.g. 2 --> 1 Dollar = 10^2 Cent
    minor    : String; //> e.g. 'Cent'
}

context teched.common{

type BusinessKey : String(10);

 @assert.range : true
    type StatusType : Integer enum {
        Planning = 1;
        Development = 2;
        Production = 3;
        Out = 4;
        Confirmed = 5;
        Unconfirmed = 6;
    }

    type CurrencyType : Decimal(15, 2)@(
        Semantics.amount.currencyCode : 'CURRENCY_code',
        sap.unit                      : 'CURRENCY_code'
    );
    
    type MesureType : Decimal(13, 3)@(
        Semantics.quantity.unitOfMeasure : 'sizeuom',
        sap.unit                         : 'sizeuom'
    );

    aspect PriceCurrency {
        currency: Currency;
        price : CurrencyType;
        taxrate   : CurrencyType;
        grossAmount : CurrencyType;
        netAmount : CurrencyType;
        taxAmount : CurrencyType;
    }

     annotate PriceCurrency with {
        price @(title : 'Price');
        taxrate   @(title : 'Tax rate');
        grossAmount @(title : 'Gross amount');
        netAmount @(title : 'Net amount');
        taxAmount @(title : 'Tax amount');
    }

  aspect MyCodeList @(
    cds.autoexpose,
    cds.persistence.skip : 'if-unused'
  ) {
    ID  : localized String(255)  @title : '{i18n>ID}';
    Title : localized String(1000) @title : '{i18n>Title}';
  }

annotate shophana.MyCodeList with @UI.Identification : [{Value:ID}];
annotate SHOPHANA.MyCodeList with @cds.odata.valuelist;
}  



