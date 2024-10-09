-- 간단하게 구상한 재무관리 페이지 테이블 구조

-- 수당 등록 관련 테이블
CREATE TABLE fi_allowances (
    allowance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    allowance_name VARCHAR(100) NOT NULL,        
    amount DECIMAL(15, 2) NOT NULL,              
    start_date DATE NOT NULL,                    
    end_date DATE,                               
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 공제 등록 관련 테이블
CREATE TABLE fi_deductions (
    deduction_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    deduction_name VARCHAR(100) NOT NULL,        
    amount DECIMAL(15, 2) NOT NULL,              
    start_date DATE NOT NULL,                    
    end_date DATE,                               
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 급여계산/대장 테이블
CREATE TABLE fi_payrolls (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    pay_date DATE NOT NULL,                      
    base_salary DECIMAL(15, 2) NOT NULL,         
    total_allowances DECIMAL(15, 2) NOT NULL,    
    total_deductions DECIMAL(15, 2) NOT NULL,    
    net_salary DECIMAL(15, 2) NOT NULL,          
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 성과급/보너스 테이블
CREATE TABLE fi_bonuses (
    bonus_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    bonus_name VARCHAR(100) NOT NULL,            
    amount DECIMAL(15, 2) NOT NULL,              
    bonus_date DATE NOT NULL,                    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 사원별 급여 목록 테이블
CREATE TABLE fi_salary_inquiries (
    inquiry_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    inquiry_date DATE NOT NULL,                  
    total_salary DECIMAL(15, 2) NOT NULL,        
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 급여 명세서 테이블
CREATE TABLE fi_payslips (
    payslip_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    payroll_id INT NOT NULL,                     
    generated_date DATE NOT NULL,                
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (payroll_id) REFERENCES payrolls(payroll_id)
);

-- 근무 확정현황 테이블
CREATE TABLE fi_attendance_confirmations (
    confirmation_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    confirmed_date DATE NOT NULL,                
    status ENUM('Pending', 'Confirmed') NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 급여 이체 현황 테이블
CREATE TABLE fi_salary_transfers (
    transfer_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    transfer_date DATE NOT NULL,                 
    amount DECIMAL(15, 2) NOT NULL,              
    bank_name VARCHAR(100),                      
    account_number VARCHAR(20),                  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 비과세 테이블
CREATE TABLE fi_tax_exemptions (
    exemption_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    exemption_type VARCHAR(100) NOT NULL,        
    amount DECIMAL(15, 2) NOT NULL,              
    start_date DATE NOT NULL,                    
    end_date DATE,                               
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 초과근무 시간 관리 테이블
CREATE TABLE fi_overtime_hours (
    overtime_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,                    
    overtime_date DATE NOT NULL,                 
    hours_worked DECIMAL(5, 2) NOT NULL,         
    pay_rate DECIMAL(10, 2) NOT NULL,            
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
