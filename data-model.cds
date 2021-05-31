namespace shophana;

entity Products {
    key ID: Integer;
    title: String;
    model: String;
    price: Decimal(15, 2);
    taxrate : Decimal(13, 3);
    currency_code: String(3); 
}