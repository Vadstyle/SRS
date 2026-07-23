CREATE TABLE borrower (
    borrow_id UUID PRIMARY KEY,
    age INTEGER NOT NULL,
    monthly_income NUMERIC(15,2) NOT NULL,
    employment_status VARCHAR(20) NOT NULL,
    credit_score INTEGER NOT NULL,
    debt_to_income NUMERIC(5,2) NOT NULL,
	CHECK (age BETWEEN 18 AND 100),
    CHECK (monthly_income BETWEEN 0 AND 100000000),
	CHECK (employment_status IN (
    	'трудоустроен',
        'самозанятый',
        'безработный'
        )),
	CHECK (credit_score BETWEEN 0 AND 100),
	CHECK (debt_to_income BETWEEN 0 AND 100)
);

CREATE TABLE credit_product (
    credit_product_id UUID PRIMARY KEY,
	borrow_id UUID NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_type VARCHAR(40) NOT NULL,
    credit_product_status VARCHAR(20) NOT NULL,
    loan_amount NUMERIC(15,2) NOT NULL,
    current_loan_amount NUMERIC(15,2) NOT NULL,
    loan_length INTEGER NOT NULL,
    interest_rate NUMERIC(5,2) NOT NULL,
    payment_frequency VARCHAR(20) NOT NULL,
    insure_status VARCHAR(20) NOT NULL,
    loan_created_at TIMESTAMP NOT NULL,
    CHECK (product_type IN (
            'Кредит физическим лицам',
            'Кредит юридическим лицам',
            'Межбанковский кредит',
            'Государственный кредит'
        )),
	CHECK (credit_product_status IN (
            'активный',
            'архивный'
        )),
	CHECK (loan_amount BETWEEN 1 AND 1000000000),
	CHECK (current_loan_amount BETWEEN 0 AND 1000000000),
	CHECK (loan_length BETWEEN 1 AND 600),
	CHECK (interest_rate BETWEEN 0 AND 100),
	CHECK (payment_frequency IN (
            'ежемесячно',
            'ежегодно'
        )),
	CHECK (insure_status IN (
            'нет страховки',
            'есть страховка'
        )),
	FOREIGN KEY (borrow_id)
        REFERENCES borrower(borrow_id)
);

CREATE TABLE insurance_contract (
    contract_id UUID PRIMARY KEY,
    credit_product_id UUID NOT NULL,
    borrow_id UUID NOT NULL,
    insurance_type VARCHAR(40) NOT NULL,
    insurance_level VARCHAR(30) NOT NULL,
    insurance_details VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
	CHECK (insurance_type IN (
            'инверсивное страхование',
            'страхование с залогом'
        )),
	CHECK (insurance_level IN (
            'полное страхование',
            'базовое страхование'
        )),
	FOREIGN KEY (credit_product_id)
        REFERENCES credit_product(credit_product_id),
	FOREIGN KEY (borrow_id)
        REFERENCES borrower(borrow_id)
);

CREATE TABLE payment (
    payment_id UUID PRIMARY KEY,
    contract_id UUID NOT NULL,
    payment_details CHAR(12) NOT NULL,
    payment_sum NUMERIC(15,2) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    paid_at TIMESTAMP NOT NULL,
	CHECK (payment_sum BETWEEN 0 AND 1000000),
	CHECK (currency IN (
            'RUB',
            'EUR',
            'USD'
        )),
	FOREIGN KEY (contract_id)
        REFERENCES insurance_contract(contract_id)
);

CREATE TABLE insurance_status (
    contract_id UUID PRIMARY KEY,
    status VARCHAR(20) NOT NULL,
    message VARCHAR(255),
    updated_at TIMESTAMP NOT NULL,
	CHECK (status IN (
            'pending',
            'processing',
            'completed',
            'rejected'
        )),
	FOREIGN KEY (contract_id)
        REFERENCES insurance_contract(contract_id)
);

CREATE TABLE payment_status (
    payment_id UUID PRIMARY KEY,
    status VARCHAR(20) NOT NULL,
    message VARCHAR(255),
    updated_at TIMESTAMP NOT NULL,
	CHECK (status IN (
            'pending',
            'processing',
            'completed',
            'failed'
        )),
	FOREIGN KEY (payment_id)
        REFERENCES payment(payment_id)
);