INSERT INTO borrower (
    borrow_id,
    age,
    monthly_income,
    employment_status,
    credit_score,
    debt_to_income
)
VALUES
(
    '11111111-1111-1111-1111-111111111111',
    32,
    250000.00,
    'трудоустроен',
    82,
    21.50
),
(
    '22222222-2222-2222-2222-222222222222',
    45,
    180000.00,
    'самозанятый',
    71,
    36.80
);

INSERT INTO credit_product (
    credit_product_id,
    borrow_id,
    product_name,
    product_type,
    credit_product_status,
    loan_amount,
    current_loan_amount,
    loan_length,
    interest_rate,
    payment_frequency,
    insure_status,
    loan_created_at
)
VALUES
(
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    '11111111-1111-1111-1111-111111111111',
    'Ипотека для молодых семей',
    'Кредит физическим лицам',
    'активный',
    4500000.00,
    4350000.00,
    240,
    12.50,
    'ежемесячно',
    'есть страховка',
    '2026-05-23 19:59:00'
),
(
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
    '22222222-2222-2222-2222-222222222222',
    'Кредит на развитие бизнеса',
    'Кредит юридическим лицам',
    'активный',
    12000000.00,
    11750000.00,
    60,
    14.20,
    'ежемесячно',
    'нет страховки',
    '2026-05-25 14:20:00'
);

INSERT INTO insurance_contract (
    contract_id,
    credit_product_id,
    borrow_id,
    insurance_type,
    insurance_level,
    insurance_details,
    created_at,
    updated_at
)
VALUES
(
    'cccccccc-cccc-cccc-cccc-cccccccccccc',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    '11111111-1111-1111-1111-111111111111',
    'страхование с залогом',
    'полное страхование',
    'Страхование квартиры и жизни заемщика',
    '2026-05-23 20:05:00',
    '2026-05-23 20:10:00'
);

INSERT INTO payment (
    payment_id,
    contract_id,
    payment_details,
    payment_sum,
    currency,
    paid_at
)
VALUES
(
    'dddddddd-dddd-dddd-dddd-dddddddddddd',
    'cccccccc-cccc-cccc-cccc-cccccccccccc',
    '123456789012',
    18000.00,
    'рубль',
    '2026-05-24 12:15:00'
),
(
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
    'cccccccc-cccc-cccc-cccc-cccccccccccc',
    '123456789013',
    18000.00,
    'рубль',
    '2026-06-24 12:15:00'
);

INSERT INTO insurance_status (
    contract_id,
    status,
    message,
    updated_at
)
VALUES
(
    'cccccccc-cccc-cccc-cccc-cccccccccccc',
    'completed',
    'Договор успешно оформлен',
    '2026-05-23 20:15:00'
);

INSERT INTO payment_status (
    payment_id,
    status,
    message,
    updated_at
)
VALUES
(
    'dddddddd-dddd-dddd-dddd-dddddddddddd',
    'completed',
    'Платеж успешно проведен',
    '2026-05-24 12:20:00'
),
(
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
    'processing',
    'Платеж обрабатывается банком',
    '2026-06-24 12:18:00'
);