# InvoiceItem.destroy_all 
# Customer.destroy_all 
# Merchant.destroy_all 
# Invoice.destroy_all 
# Item.destroy_all 
# Transaction.destroy_all
# Discount.destroy_all

# merchant1 = Merchant.create!(name: 'Hair Care')
# merchant2 = Merchant.create!(name: 'Nail Care')

# customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
# customer_2 = Customer.create!(first_name: 'Cecilia', last_name: 'Jones')
# customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Carrey')
# customer_4 = Customer.create!(first_name: 'Leigh Ann', last_name: 'Bron')
# customer_5 = Customer.create!(first_name: 'Sylvester', last_name: 'Nader')
# customer_6 = Customer.create!(first_name: 'Herber', last_name: 'Coon')

# invoice_1 = Invoice.create!(merchant_id: merchant1.id, customer_id: customer_1.id, status: 2)
# invoice_2 = Invoice.create!(merchant_id: merchant1.id, customer_id: customer_1.id, status: 2)
# invoice_3 = Invoice.create!(merchant_id: merchant1.id, customer_id: customer_2.id, status: 2)
# invoice_4 = Invoice.create!(merchant_id: merchant1.id, customer_id: customer_3.id, status: 2)
# invoice_5 = Invoice.create!(merchant_id: merchant1.id, customer_id: customer_4.id, status: 2)
# invoice_6 = Invoice.create!(merchant_id: merchant1.id, customer_id: customer_5.id, status: 2)
# invoice_7 = Invoice.create!(merchant_id: merchant1.id, customer_id: customer_6.id, status: 1)

# item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: merchant1.id)
# item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: merchant1.id)
# item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: merchant1.id)
# item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: merchant1.id)
# item_5 = Item.create!(name: "Radio", description: "This lets you hear music", unit_price: 1, merchant_id: merchant2.id)
# item_6 = Item.create!(name: "Pens", description: "This helps you write", unit_price: 1, merchant_id: merchant2.id)

# ii_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 1, unit_price: 10, status: 0)
# ii_2 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_2.id, quantity: 1, unit_price: 8, status: 0)
# ii_3 = InvoiceItem.create!(invoice_id: invoice_2.id, item_id: item_3.id, quantity: 6, unit_price: 5, status: 2)
# ii_4 = InvoiceItem.create!(invoice_id: invoice_3.id, item_id: item_4.id, quantity: 10, unit_price: 5, status: 1)
# ii_5 = InvoiceItem.create!(invoice_id: invoice_4.id, item_id: item_4.id, quantity: 16, unit_price: 10, status: 1)
# ii_6 = InvoiceItem.create!(invoice_id: invoice_5.id, item_id: item_4.id, quantity: 25, unit_price: 20, status: 1)
# ii_7 = InvoiceItem.create!(invoice_id: invoice_6.id, item_id: item_4.id, quantity: 50, unit_price: 25, status: 1)
# ii_8 = InvoiceItem.create!(invoice_id: invoice_7.id, item_id: item_2.id, quantity: 10, unit_price: 25, status: 1)
# ii_9 = InvoiceItem.create!(invoice_id: invoice_7.id, item_id: item_3.id, quantity: 2, unit_price: 25, status: 1)
# ii_10 = InvoiceItem.create!(invoice_id: invoice_7.id, item_id: item_4.id, quantity: 19, unit_price: 25, status: 1)

# transaction1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: invoice_1.id)
# transaction2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: invoice_3.id)
# transaction3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: invoice_4.id)
# transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: invoice_5.id)
# transaction5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: invoice_6.id)
# transaction6 = Transaction.create!(credit_card_number: 879799, result: 1, invoice_id: invoice_7.id)
# transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: invoice_2.id)

# discount1 = Discount.create!(item_requirement: 10, percentage_discount: 0.20, merchant_id: merchant1.id)
# discount2 = Discount.create!(item_requirement: 15, percentage_discount: 0.25, merchant_id: merchant1.id)
# discount3 = Discount.create!(item_requirement: 5, percentage_discount: 0.10, merchant_id: merchant1.id)
# discount4 = Discount.create!(item_requirement: 20, percentage_discount: 0.40, merchant_id: merchant1.id)
# discount5 = Discount.create!(item_requirement: 50, percentage_discount: 0.45, merchant_id: merchant1.id)
# discount6 = Discount.create!(item_requirement: 19, percentage_discount: 0.30, merchant_id: merchant2.id)

