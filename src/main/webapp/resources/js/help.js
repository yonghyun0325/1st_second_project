
$(document).ready(function () {
    const $btnOpenModal = $('.btn-open-help');
    const $modalContent = $('.help-content');

    const $inquiryForm = $('#inquiryForm');
    const $productSelect = $('#product');
    const $serviceSelect = $('#service');
    const $helpDetail = $('#help_detail');

    $btnOpenModal.on("click", function (event) {
        if ($btnOpenModal.hasClass('expanded') && !$(event.target).closest('.help-close').length) {
            return;
        }
        event.stopPropagation();
        $btnOpenModal.toggleClass('expanded');
        
        if ($btnOpenModal.hasClass('expanded')) {
            $btnOpenModal.on("transitionend", function () {
                $modalContent.css('opacity', '1');
                $btnOpenModal.off("transitionend");
            });
        } else {
            $modalContent.css('opacity', '0');
        }
    });

    $(document).on("click", ".help-close", function (event) {
        event.stopPropagation();
        $inquiryForm[0].reset();
        $btnOpenModal.removeClass('expanded');
        $modalContent.css('opacity', '0');
    });
    
    const isLoginPage = $('body').hasClass('login-page');

    if (isLoginPage) {
        $productSelect.empty().append(`
            <option value="">목록을 선택해주십시오.</option>
            <option value="hr">인사업무</option>
            <option value="etc">기타 문의</option>
        `);
        $inquiryForm.append(`
            <input type="hidden" id="help-e_idx" name="e_idx" value="20000000">`)
    }

    const serviceOptions = {
        "finance": [
            { value: "재무서비스1", text: "급여 관리" },
            { value: "재무서비스2", text: "재무 분석" }
        ],
        "purchase": [
            { value: "구매서비스1", text: "구매 주문" },
            { value: "구매서비스2", text: "재고 관리" }
        ],
        "hr": isLoginPage ? [
            { value: "사원번호 분실", text: "사원번호 분실" },
            { value: "비밀번호 분실", text: "비밀번호 분실" },
            { value: "등록 오류", text: "등록 오류" }
        ] : [
            { value: "인사서비스1", text: "인사 정보" },
            { value: "인사서비스2", text: "채용 관리" }
        ],
        "board": [
            { value: "게시판서비스1", text: "공지사항" },
            { value: "게시판서비스2", text: "커뮤니티" },
            { value: "게시판서비스3", text: "분실물 신고" }
        ],
        "etc": isLoginPage ? [
            { value: "접속문제", text: "접속문제" },
            { value: "원격지원", text: "원격지원" },
            { value: "일반문의", text: "일반문의" }
        ] : [
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

    
    const $successMessageBackground = $('<div class="success-message-background" style="display: none;"></div>');
    const $successMessage = $('<div class="success-message"></div>');
    $successMessageBackground.append($successMessage);
    $modalContent.append($successMessageBackground);

    $inquiryForm.on('submit', function (event) {
        event.preventDefault();

        const formData = {
            product: $('#product').val(),
            service: $('#service').val(),
            help_detail: $('#help_detail').val()
        };

        $.ajax({
            type: 'POST',
            url: '/help/insertHelp.do',
            data: formData,
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    $successMessage.text(response.message);
                    $successMessageBackground.fadeIn().delay(3000).fadeOut();
                    $inquiryForm[0].reset();
                } else {
                    $successMessage.text(response.message).css('color', 'red');
                    $successMessageBackground.fadeIn().delay(3000).fadeOut();
                }
            },
            error: function (jqXHR) {
                $successMessage.html('서버 오류가 발생했습니다.<br>다시 시도해주세요.').css('color', 'red');
                $successMessageBackground.fadeIn().delay(3000).fadeOut();
            }
        });
    });
});