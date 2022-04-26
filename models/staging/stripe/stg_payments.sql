with payments as (
        Select 
            ID as Payment_Id,
            ORDERID as Order_Id,
            PaymentMethod as Payment_Method,
            STATUS,
            AMOUNT,
            CREATED as Payment_Date,
            _Batched_AT as Payment_Batch
        from raw.stripe.payment

        
)
Select * from payments