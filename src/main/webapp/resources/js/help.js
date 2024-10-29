window.addEventListener("DOMContentLoaded", () => {
    const modal = document.querySelector('.modal2');
    const btnOpenModal = document.querySelector('.btn-open-modal2');
    const btnCloseModal = document.querySelector('.close');
    const inquiryForm = document.getElementById('inquiryForm');
    const productSelect = document.getElementById('product');
    const serviceSelect = document.getElementById('service');
    const etcQuestion = document.getElementById('etcQ');

    // 모달 열기
    btnOpenModal.addEventListener("click", () => {
        modal.classList.add('show');
        modal.style.display = 'flex';
    });

    // 모달 닫기
    btnCloseModal.addEventListener("click", () => {
        modal.classList.remove('show');
        modal.style.display = 'none';
    });

    // 모달 외부를 클릭하면 모달 닫기
    window.addEventListener("click", (event) => {
        if (event.target === modal) {
            modal.classList.remove('show');
            modal.style.display = 'none';
        }
    });

    // 폼 제출 시 유효성 검사
    inquiryForm.addEventListener('submit', function(event) {
        // 선택한 값이 없을 경우 경고 메시지 표시 후 제출 중지
        if (productSelect.value === "") {
            alert('문의할 부분을 선택해주세요.');
            event.preventDefault(); // 제출 중지
            return;
        }

        if (serviceSelect.value === "") {
            alert('지원 서비스를 선택해주세요.');
            event.preventDefault(); // 제출 중지
            return;
        }

        if (etcQuestion.value.trim() === "") {
            alert('추가 문의사항을 입력해주세요.');
            event.preventDefault(); // 제출 중지
            return;
        }
    });

    // 제품 선택에 따른 서비스 옵션 변경
    const serviceOptions = {
        "finance": [
            { value: "재무서비스1", text: "급여 관리" },
            { value: "재무서비스2", text: "재무 분석" }
        ],
        "purchase": [
            { value: "구매서비스1", text: "구매 주문" },
            { value: "구매서비스2", text: "재고 관리" }
        ],
        "hr": [
            { value: "인사서비스1", text: "인사 정보" },
            { value: "인사서비스2", text: "채용 관리" }
        ],
        "board": [
            { value: "게시판서비스1", text: "공지사항" },
            { value: "게시판서비스2", text: "커뮤니티" },
            { value: "게시판서비스3", text: "분실물 신고" }
        ],
        "etc": [
            { value: "기타서비스1", text: "홈페이지 접속문제" },
            { value: "기타서비스2", text: "원격지원" },
            { value: "기타서비스3", text: "기타 일반문의" }
        ]
    };

    productSelect.addEventListener('change', function() {
        const selectedProduct = this.value;
        serviceSelect.innerHTML = '<option value="">지원 목록을 선택하십시오.</option>';
        
        if (serviceOptions[selectedProduct]) {
            serviceOptions[selectedProduct].forEach(function(service) {
                const option = document.createElement('option');
                option.value = service.value;
                option.text = service.text;
                serviceSelect.appendChild(option);
            });
        }
    });
});