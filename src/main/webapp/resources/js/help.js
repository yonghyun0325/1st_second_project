$(document).ready(function () {
    const $btnOpenModal = $('.btn-open-modal2');
    const $modalContent = $('.modal2_content');
    const $inquiryForm = $('#inquiryForm');
    const $productSelect = $('#product');
    const $serviceSelect = $('#service');
    const $etcQuestion = $('#etcQ');

    // 버튼 클릭 시 모달 표시
    $btnOpenModal.on("click", function (event) {
        event.stopPropagation();
        $modalContent.toggleClass('expanded');
    });

    // 닫기 버튼 클릭 시 모달 닫기
    $(document).on("click", ".close", function (event) {
        event.stopPropagation();
        $modalContent.removeClass('expanded');
    });

    // 모달 외부 클릭 시 모달 닫기
    $(window).on("click", function (event) {
        if (!$modalContent.is(event.target) && $modalContent.has(event.target).length === 0) {
            $modalContent.removeClass('expanded');
        }
    });

    // 폼 제출 시 유효성 검사
    $inquiryForm.on('submit', function (event) {
        if ($productSelect.val() === "") {
            alert('문의할 부분을 선택해주세요.');
            event.preventDefault();
            return;
        }

        if ($serviceSelect.val() === "") {
            alert('지원 서비스를 선택해주세요.');
            event.preventDefault();
            return;
        }

        if ($.trim($etcQuestion.val()) === "") {
            alert('추가 문의사항을 입력해주세요.');
            event.preventDefault();
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

    $productSelect.on('change', function () {
        const selectedProduct = $(this).val();
        $serviceSelect.empty().append('<option value="">지원 목록을 선택하십시오.</option>');
        
        if (serviceOptions[selectedProduct]) {
            $.each(serviceOptions[selectedProduct], function (index, service) {
                const $option = $('<option>').val(service.value).text(service.text);
                $serviceSelect.append($option);
            });
        }
    });
});
