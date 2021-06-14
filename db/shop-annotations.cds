using shophana.teched.shop as shop from './schema';

annotate shop.Products with @(
    title       : '{i18n>poService}',
    description : '{i18n>poService}'
) {
    ID              @(
        title       : '{i18n>po_id}',
        description : '{i18n>po_id}',
    );

    title           @(
        title       : '{i18n>title}',
        description : '{i18n>title}'
    );

    model         @(
        title            : '{i18n>model}',
        description      : '{i18n>model}'
    );

     productgroup         @(
        title            : '{i18n>Product}',
        description      : '{i18n>Product}',
        Common.FieldControl : #Mandatory,
        Common.Text : productgroup.name,
        ValueList : { ValueListWithFixedValues:true,
            CollectionPath : 'shop.ProductGroups',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'productgroup_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }                 
            ]}
   );

    status @(
        title               : '{i18n>status}',
        description         : '{i18n>status}',
        //Common.FieldControl : #ReadOnly
        Common.Text : status.name,
        ValueList : { ValueListWithFixedValues:true,
            CollectionPath : 'shop.Statuses',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'status_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }                 
            ]}
    );

    sizeuom_msehi @(
        title               : '{i18n>UOM}',
        description         : '{i18n>UOM}',
        Common.FieldControl : #ReadOnly
    )

};

annotate shop.UOM with {
        msehi    @(
        title            : '{i18n>Unit of Mesure}',
        description      : '{i18n>Unit of Mesure}')
};

annotate shop.ProductGroups with {
        
        ID @ (
        title            : '{i18n>ID}',
        description      : '{i18n>ID}'
    );
         
        name      @(
        title            : '{i18n>Product}',
        description      : '{i18n>Product}'
    );
      
};


annotate shop.Statuses with {
        
        ID @ (
        title            : '{i18n>ID}',
        description      : '{i18n>ID}'
    );
         
        name      @(
        title            : '{i18n>Status}',
        description      : '{i18n>Status}'
    );
      
};

annotate shop.MarketInfos with {
    ID @ (
        title            : '{i18n>Market ID}',
        description      : '{i18n>Market ID}'
    );
    name      @(
        title            : '{i18n>Market Name}',
        description      : '{i18n>Market Name}',
        Common.FieldControl : #ReadOnly
    );
      
};

annotate shop.Markets with {
 
     toMarketInfos  @(
        title            : '{i18n>Product Group}',
        description      : '{i18n>Product Group}',
        Common.FieldControl : #Mandatory,
        Common.Text : toMarketInfos.name ,
        ValueList : {
            CollectionPath : 'shop.MarketInfos',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'toMarketInfos_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }                 
            ]}
   );
     startDate @(
        title               : '{i18n>Starting date}',
        description         : '{i18n>Starting date}',
    );
     endDate @(
        title               : '{i18n>End date}',
        description         : '{i18n>End date}',  
    );
     totalNetAmount @(
        title               : '{i18n>Total Net Amount}',
        description         : '{i18n>Total Net Amount}',
        Common.FieldControl : #ReadOnly
    );
     totalGrossAmount@(
        title               : '{i18n>Total Gross Amount}',
        description         : '{i18n>Total Gross Amount}',
        Common.FieldControl : #ReadOnly
    );

     totalTaxAmount@(
        title               : '{i18n>Total Tax Amount}',
        description         : '{i18n>Total Tax Amount}',
        Common.FieldControl : #ReadOnly
     );

    currency  @(
        title               : '{i18n>Currency}',
        description         : '{i18n>Currency}',
        //Common.FieldControl : #ReadOnly
    );

}

annotate shop.Orders with {
 deliveryDate     @(
        title               : '{i18n>Date of Delivery}',
        description         : '{i18n>Date of Delivery}',
        Common.FieldControl : #Mandatory
    );
 quantity @(
        title               : '{i18n>Quantity}',
        description         : '{i18n>Quantity}',
        Common.FieldControl : #Mandatory
    );
 calendarYear  @(
        title               : '{i18n>Year of production}',
        description         : '{i18n>Year of production}',
        Common.FieldControl : #ReadOnly
    );
 netAmount  @(
        title               : '{i18n>Net Amount}',
        description         : '{i18n>Net Amount}',
        Common.FieldControl : #ReadOnly,
        //@Measures.ISOCurrency: Currencies.ISOCurrency
    );
 grossAmount @(
        title               : '{i18n>Gross Amount}',
        description         : '{i18n>Gross Amount}',
        Common.FieldControl : #ReadOnly
    );

 taxAmount  @(
        title               : '{i18n>Tax Amount}',
        description         : '{i18n>Tax Amount}',
        Common.FieldControl : #ReadOnly
    );

  currency  @(
        title               : '{i18n>Currency}',
        description         : '{i18n>Currency}',
        //Common.FieldControl : #ReadOnly
    );
 }
