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
        title            : '{i18n>Product Group}',
        description      : '{i18n>Product Group}',
         Common.ValueList : {
            CollectionPath : 'ProductGroups',
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
            ]
        }

    );


    Status @(
        title               : '{i18n>lifecycle}',
        description         : '{i18n>lifecycle}',
        Common.FieldControl : #ReadOnly
    );

};
